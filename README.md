# Four-Input Combination Lock
This project implements a combination lock using a Moore Finite State Machine (FSM) in Verilog, designed specifically for the DE1-SOC Board. The system features a 4-bit input sequence and includes security options such as an alarm system and a combination reset.

## Specifications
### Moore Finite State Machine (FSM) Architecture
The lock’s logic is driven by a Moore FSM, ensuring that the output is determined strictly by the Machine's current state, making the system predictable, easy to debug, and robust against unintended behaviors.

### Combination Reset
The system allows users to update the 4-bit combination code, providing flexibility to adapt to changing security needs. 

### Security Alarm System
An integrated alarm system is triggered after two consecutive incorrect attempts, enhancing security by deterring unauthorized access and alerting users to potential breaches.

## Files
- combo_lock.v: Main module including the Moore FSM controlling the lock mechanism.
- comparator.v: Module to compare the input with the preset combination.
- hexdisp.v: Manages the hexadecimal display output.
- input_condition.v: Conditions and debounces input signals.
- register.v: Stores user input for comparison.
## Usage
To simulate this project, use a Verilog simulator like ModelSim or Vivado. Load all the modules and run the simulation to test the functionality of the combination lock system.
