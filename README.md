# SMTS-Smart Traffic Management System

SMTS is Smart Traffic Management System using Cognitive Recognition based on Internet Of Things.
## Proposed System

* The System can be deployed in City to manage and reduce traffic.
* The System considers all the intersections of city as nodes. A network of Raspberry PI are installed which are dedicated for each type of intesection. These RaspberryPI are directly interfaced with each traffic control signal at junction.
* Each RaspPI controls the traffic control signal timer of each junction and changes it accordingly to real time traffic density at the   junction.
* The Traffic density is calculated using image processing of real time feed from IPcamera installed at junction.
* A network of such RaspPI are connected to a Main server where the RaspPI forwards the calculated Traffic Density. Using our self defined algorithm, The main server finds optimal traffic signal timer value for each signal and then forwards to each RaspberryPI. These RaspberryPI then furthers forwards to each signal.

## Phases
### 1) Network
* Connection of RaspberryPI with microcontroller interfaced with Traffic Control Signals.
* Interfacing of IP camera at traffic control signal.
* Pipeline of realtime dataflow between IP camera and RaspberryPI module.
* After processing and computation, optimal traffic timer should be responded back to traffic control signal.

### 2) Computer Vision
* Reduction of Noise from image.
* Object Detection of vehicle using SIFT and SURF features; Vehicle Density should be computed at the backend system.
* Optimal Time is computed and sent to the respective Traffic Control Signal.

## Requirements

### Sofware

1) Python (2.7 or above) 
2) Octave
3) OpenCV (3.0 or above)
4) Oher Packages in Python (Matplotlib, Numpy etc)

### Hardware

1) RaspberryPI
2) IP Camera

## Final Project Report

For better understanding the scope and objective of project please refer to the following link: https://drive.google.com/open?id=0BwbpueonZ5A7MjlkMEV5VFprSTQ

## System Design

![Alt text](systemdesign/image.jpg/?raw=true "System Design") 


