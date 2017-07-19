# SMTS-Smart Traffic Management System

SMTS is Smart Traffic Management System using Cognitive Recognition based on Internet Of Things.
## Proposed System
* The System can be deployed in City to manage and reduce traffic.
* The System considers all the intersections of city as nodes. A network of Raspberry PI are installed which are dedicated for each type of intesection. These RaspberryPI are directly interfaced with each traffic control signal at junction.
* Each RaspPI controls the traffic control signal timer of each junction and changes it accordingly to real time traffic density at the   junction.
* The Traffic density is calculated using image processing of real time feed from IPcamera installed at junction.
* A network of such RaspPI are connected to a Main server where the RaspPI forwards the calculated Traffic Density. Using our self defined algorithm, The main server finds optimal traffic signal timer value for each signal and then forwards to each RaspberryPI. These RaspberryPI then furthers forwards to each signal.

## Phases
### 1)Network 
Need to code for establishing network connection between RaspberryPI node(s) and main server preferably using Networking Socketing.
The communication should be full duplex.
### 2)Image processing
Algorithm to count number of vehicle to calulcate traffic density.

## Requirements

1) RaspberryPi 
2) Octave
3) Python (2.7 or above)

###### **Final Project Report**:- https://drive.google.com/open?id=0BwbpueonZ5A7MjlkMEV5VFprSTQ

## System Design

![Alt text](systemdesign/image.jpg/?raw=true "System Design") 


