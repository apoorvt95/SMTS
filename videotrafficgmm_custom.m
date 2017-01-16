%27/October/2016

% use the foreground detector,
% blob analysis to detect and count cars in a video sequence.
% It assumes that the camera is stationary. 
% The example focuses on detecting objects.

%% Import Video and Initialize Foreground Detector
% initial video frame in which the moving objects are
% segmented from the background.
%
% The foreground detector requires a certain number of video frames in
% order to initialize the Gaussian mixture model. This example uses the
% first 50 frames to initialize three Gaussian modes in the mixture model.
foregroundDetector = vision.ForegroundDetector('NumGaussians', 3, ...
    'NumTrainingFrames', 50);

videoReader = vision.VideoFileReader('DTF3.mp4');
for i = 1:150
    frame = step(videoReader); % read the next video frame
    foreground = step(foregroundDetector, frame);
end

%%
%figure; imshow(frame); title('Video Frame');

%figure; imshow(foreground); title('Foreground');
    
%% Detect Cars in an Initial Video Frame
% Noise removal
se = strel('square', 3);
filteredForeground = imopen(foreground, se);
figure; imshow(filteredForeground); title('Clean Foreground');

%%
% Next, we find bounding boxes of each connected component corresponding to
% a moving car by using vision.BlobAnalysis object. The object further
% filters the detected foreground by rejecting blobs which contain fewer
% than 150 pixels.
blobAnalysis = vision.BlobAnalysis('BoundingBoxOutputPort', true, ...
    'AreaOutputPort', false, 'CentroidOutputPort', false, ...
    'MinimumBlobArea', 150);
bbox = step(blobAnalysis, filteredForeground);

%%
% To highlight the detected cars, we draw green boxes around them.
result = insertShape(frame, 'Rectangle', bbox, 'Color', 'green');

%%
% The number of bounding boxes corresponds to the number of cars found in
% the video frame. We display the number of found cars in the upper left
% corner of the processed video frame.
numCars = size(bbox, 1);
result = insertText(result, [10 10], numCars, 'BoxOpacity', 1, ...
    'FontSize', 14);
figure; imshow(result); title('Detected Cars');

%% Process the Rest of Video Frames
% In the final step, we process the remaining video frames.
videoPlayer = vision.VideoPlayer('Name', 'Detected Cars');
videoPlayer.Position(3:4) = [650,400];  % window size: [width, height]
se = strel('square', 3); % morphological filter for noise removal

while ~isDone(videoReader)
    
    frame = step(videoReader); % read the next video frame
    
    % Detect the foreground in the current video frame
    foreground = step(foregroundDetector, frame);
    
    % Use morphological opening to remove noise in the foreground
    filteredForeground = imopen(foreground, se);
    
    % Detect the connected components with the specified minimum area, and
    % compute their bounding boxes
    bbox = step(blobAnalysis, filteredForeground);

    % Draw bounding boxes around the detected cars
    result = insertShape(frame, 'Rectangle', bbox, 'Color', 'green');

    % Display the number of cars found in the video frame
    numCars = size(bbox, 1);
    result = insertText(result, [10 10], numCars, 'BoxOpacity', 1, ...
        'FontSize', 14);

    step(videoPlayer, result);  % display the results
end

%Generate XML text file
docNode = com.mathworks.xml.XMLUtils.createDocument... 
    ('node');
docRootNode = docNode.getDocumentElement;

%first_node=docNode.createElement('node');
docRootNode.setAttribute('number','1');
for i=1:4
    camera = docNode.createElement('camera');
    camera.setAttribute('id', sprintf('%d',i));
        count=docNode.createElement('count');
        count.appendChild(docNode.createTextNode(int2str(numCars + i)));
        camera.appendChild(count);
        ts=docNode.createElement('timestamp');
        ts.appendChild(docNode.createTextNode(datestr(clock)));
        camera.appendChild(ts);
%     thisElement.appendChild... 
%         (docNode.createTextNode(sprintf('%i',i)));
%     docRootNode.appendChild(thisElement);
    docRootNode.appendChild(camera);
end
%docNode.appendChild(first_node);
%docNode.appendChild(docNode.createComment('this is a comment'));

xmlFileName = ['Gen','.xml'];
xmlwrite(xmlFileName,docNode);
type(xmlFileName);


release(videoReader); % close the video file

%%
% The output video displays the bounding boxes around the cars. It also
% displays the number of cars in the upper left corner of the video.
displayEndOfDemoMessage(mfilename)
