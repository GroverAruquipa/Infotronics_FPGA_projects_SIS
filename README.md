# VHDL FILES
## _VHDL repository of infotronics projects_


[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

In this repository, the base descriptions for the description of the VHDL projects developed in 2021 for the Infotronics subjects of the Franche Comte University in the master program in Smart Integrated System are presented.

- PROJECT 1: FILTER AND INITIATION TO PS/PL INTERACTION ON RED PITAYA BOARD  
- PROJECT 2: SPI COMMUNICATION 
- PROJECT 3 PS2 MOUSE – SVGA SCREEN INTERFACE WITH DE2 BOARD 
## Features

- Create a Modelsim project
- Attach the files of each project
- Simulate on Modelsim
- Add different signals according to the specifications
- Run the simulation


## PROJECT 1: FILTER AND INITIATION TO PS/PL INTERACTION ON RED PITAYA BOARD

This project performs the implementation of an FIR filter, using VIVADO in a Redpitaya card, it is necessary to previously generate the filter coefficients using Matlab.

- [Matlab] -For the generation of the coefficients.
- [Vivado] - For the integration of the different componens
- [Modelsim] - For the simulation of the FIR fILTER.
- [RedPiyata] - For the implementation.

## PROJECT 2: SPI COMMUNICATION

This project develops the SPI interface for a DDS, there are two main components:
- Clock manager -Formanaggin.- To manage the delivery frequency
- State Machine -To manage the delivery Data

The tools used are:
- [Modelsim] - For the simulation of the COMPONENTS.
- [QUARTUSLITE] - For the VHDL Design.
- [DE10LITE BOARD] - For the implementation.



## PROJECT 3: PS2 MOUSE – SVGA SCREEN INTERFACE WITH DE2 BOARD 
This project shows the implementation of a communication interface with a mouse and a monitor, using a VGA port to acquire position data from the mouse, on the monitor and show them on 4 displays of 4 segments.
The tools used are:
- [Modelsim] - For the simulation of the COMPONENTS.
- [QUARTUS] - For the VHDL Design.
- [DE10 BOARD] - For the implementation.

## Installation

To use the clone repository scripts:


```sh
git clone https://github.com/GroverAruquipa/Infotronics_FPGA_projects_SIS
```
