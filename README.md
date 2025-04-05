# ELEC-6181-Phase3

## Project 5: Differentiated Service with Traffic Shaping and Policing

This guide provides instructions on how to run Experiment 5 (Network with Shaping and Policing).

### Overview
The following files are included as part of the project's source code:
- package.ned
* omnetpp.ini
+ OSPFConfig.xml
* filters.xml
- README

### Prerequisites
To run this project, you need to install the following versions:
- Omnet++ 5.6.2
- INET Framework 4.2.2

### Setting up the project
1. After installing Omnet++ and the INET framework, create a New Omnet Project.
2. After setting up the project, move the listed files into the src folder of your new project.
3. Open the project properties, navigate to Project References, and select inet from the available list

### Running the Simulation
1. Locate the omnetpp.ini file within the src directory.
2. Right-click on the file and select Run As > Omnet++ Simulation.
3. A new simulation window will open.
4. From the dropdown menu, select the experiment you want to run.
5. Click on Run (top left corner) and wait for the simulation to complete.

### Viewing Results
After the simulation finishes, you can find the output data in the results directory within the src folder.
The output includes:
* Scalar Files: These files contain scalar data, which are single value results such as end-to-end delay or packet loss.
* Vector Files: These files store time-series data, such as throughput or queue length over time.

Both scalar and vector files can be analyzed using the Omnet++ IDE to visualize network performance metrics.
