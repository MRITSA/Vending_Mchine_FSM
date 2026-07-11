# Vending_Mchine_FSM

# Overview
This project implements a Finite State Machine (FSM) based vending machine using Verilog HDL. The design accepts coin inputs, accumulates the inserted amount, dispenses the selected product when the required amount is reached, and returns change when applicable.

The project demonstrates the implementation of sequential digital logic, state transitions, and RTL design principles.

Features:
* Finite State Machine (FSM) based controller
* Coin input handling
* Product dispensing logic
* Change return logic
* Synchronous reset
* RTL simulation using Verilog testbench
* Synthesizable RTL

# Design Specifications

# Inputs

| Signal | Description                   |
| ------ | ----------------------------- |
| clk    | System clock                  |
| reset  | Active-high synchronous reset |
| coin   | Coin input                    |
| select | Product selection             |

# Outputs

| Signal   | Description                          |
| -------- | ------------------------------------ |
| dispense | Dispenses the selected product       |
| change   | Returns extra amount (if applicable) |


# FSM Description

The vending machine operates using a Finite State Machine where each state represents the total amount inserted.

Typical flow:

* Idle state
* Coin inserted
* Amount accumulation
* Product selection
* Product dispense
* Change return (if needed)
* Return to Idle state

# Project Structure
Vending_Machine_FSM/
│
├── constraints.sdc
├── synth.ys
├── vending_machine.v
├── vending_machine_netlist.v
├── vending_tb.v
└── README.md


# Simulation

Compile:
iverilog -o vending vending_machine.v vending_tb.v
Run:
vvp vending
Open waveform:
gtkwave dump.vcd

# Synthesis

Synthesis was performed using **Yosys**.

Run synthesis:
yosys synth.ys

Generated outputs include:

* Synthesized netlist
* RTL statistics
* Cell utilization report

# Tools Used
* Verilog HDL
* Icarus Verilog
* GTKWave
* Yosys
* Ubuntu Linux

# Learning Outcomes

This project helped in understanding:

* Finite State Machine (FSM) design
* Sequential logic design
* RTL coding practices
* Verilog testbench development
* Functional simulation
* RTL synthesis flow using Yosys
