# Asyncounter_with_delay
# Synchronous Mod-6 Counter with 1-Second Delay (Verilog)

## 📁 Project Overview

This project implements a **synchronous 3-bit Mod-6 counter** using **JK flip-flop logic**. The counter increments every **1 second**, achieved by dividing an incoming **100 MHz clock** to **1 Hz** using a clock divider module. The complete design is modular and consists of:

- A **clock divider** that generates a 1 Hz clock from a 100 MHz clock
- A **counter** that resets after counting from 0 to 5
- A **top module** to integrate the above components
- A **testbench** to simulate and verify the behavior

---

## 🔧 Files Included

| File Name                      | Description                                                  |
|-------------------------------|--------------------------------------------------------------|
| `Clock_divider_100MHz_to_1Hz.v` | Clock divider: Generates 1 Hz from 100 MHz input clock       |
| `counter_b.v`                 | 3-bit counter with asynchronous reset, resets after 5 (0101) |
| `top_module.v`                | Top module integrating clock divider and counter             |
| `top_module_tb.v`             | Testbench for simulating the top module                      |

---

## 🧠 Functionality

### 🔁 Counter Logic (`counter_b.v`)
- JK flip-flop behavior implemented for the first 3 bits of output `q[2:0]`.
- The counter resets when the output reaches 6 (`q == 0101`).
- Bit `q[3]` is unused and always held at 0.

### ⏱ Clock Divider (`Clock_divider_100MHz_to_1Hz.v`)
- Uses a 26-bit counter to toggle output every 50 million cycles.
- Generates a 1 Hz clock by toggling every 0.5s.

### 🧩 Top Module (`top_module.v`)
- Instantiates the clock divider and feeds its output into the counter.
- Exposes the 4-bit counter output to top level.

---

## 🧪 Simulation

### Testbench (`top_module_tb.v`)
- Simulates a 100 MHz clock (`10 ns` period).
- Applies a reset pulse at the beginning.
- Runs the simulation for 1.2 seconds (`#1200000000`) to observe multiple counter cycles.

---

## ▶️ Running the Simulation

1. **Open** the design in your preferred simulator (e.g., ModelSim, Vivado Simulation).
2. **Compile** all Verilog files.
3. **Run** the testbench (`top_module_tb.v`).
4. **Observe** the `q` output waveform. It should count from 0 to 5 every second and then reset.

---

## 🛠 Target Platform

This design is suitable for:
- Simulation using any standard Verilog simulator.
- FPGA implementation using Xilinx Vivado.

**Clock Requirements**:
- Must be provided a stable 100 MHz input clock signal.
