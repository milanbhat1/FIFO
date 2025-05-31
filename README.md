# FIFO Middle Block (Verilog HDL)

## 1. Abstract
A First-In-First-Out (FIFO) memory buffer is a key component in digital systems, ensuring orderly data storage and retrieval. This project presents the design, implementation, and simulation of a synchronous FIFO using Verilog HDL. It focuses on simple, hazard-free data access and reliable synchronization between write and read operations, using a single clock signal and an enable (`en`) signal to determine the operation mode.

## 2. Introduction
FIFO buffers are essential in digital electronics for maintaining data order, especially in streaming, communication interfaces, and pipeline stages. This project demonstrates the construction of a basic FIFO buffer where writing and reading occur based on a control signal (`en`), using a single shared clock (`clk`).

## 3. Objective
- To design a synchronous FIFO buffer using Verilog HDL.
- To simulate FIFO operations using a single clock signal and control logic.
- To verify correct data storage and retrieval behavior via a testbench.
- To understand FIFO mechanisms in real-world digital design.

## 4. Design Specifications
- **Memory Depth**: 16 locations (4-bit address)
- **Data Width**: 8 bits
- **Clock**: Single clock signal (`clk`)
- **Control Signal**: `en` (1 = write, 0 = read)
- **Reset**: Active-high asynchronous reset (`rst`)
- **Memory Type**: Register array

## 5. Language and Tools Used
- **HDL**: Verilog
- **Simulation Tool**: Cadence
- **Editor**: Any HDL-compatible editor (e.g., VS Code, Cadence IDE)

## 6. Module Description

### `fifo_middle.v` (Design Module)
- Implements a 16x8 FIFO using a register array.
- Write and read addresses (`waddr`, `raddr`) track memory positions.
- Controlled by a single clock and `en` signal.
- `en = 1`: Data from `wdata` is written to FIFO at `waddr`.
- `en = 0`: Data is read from FIFO into `rdata` from `raddr`.

### `tb_fifo_middle.v` (Testbench)
- Generates a 10 ns period clock signal.
- Uses reset (`rst`) for initialization.
- Simulates writing squares of 1 to 10 (1, 4, 9, ..., 100).
- Simulates reading those values and displays the outputs.
- Displays read and write activity using `$display`.

## 7. Algorithm and Logic

### Reset
- On reset, `waddr`, `raddr`, and `rdata` are initialized to 0.

### Write Logic
- On rising edge of `clk`:
  - If `en == 1`, `wdata` is written to `mem[waddr]`.
  - `waddr` is incremented.

### Read Logic
- On rising edge of `clk`:
  - If `en == 0`, `mem[raddr]` is assigned to `rdata`.
  - `raddr` is incremented.

## 8. Sample Input and Output

### Write Phase
- Input: `wdata` = 1, 4, 9, 16, ..., 100 (squares of 1 to 10)
- Condition: `en = 1`

### Read Phase
- Output: `rdata` = 1, 4, 9, 16, ..., 100
- Condition: `en = 0`

## 9. Results and Verification
- Simulation was carried out using Cadence.
- The design showed correct sequential write and read operations.
- `waddr` and `raddr` increment independently.
- Data was accurately preserved and retrieved.

## 10. Screenshots

### Simulation Waveform

<img width="1280" alt="image" src="https://github.com/user-attachments/assets/77d7a705-d1c7-4e1c-b6ac-f136fddda1ca" />

### Group Photo

<img width="800" alt="image" src="https://github.com/user-attachments/assets/7d0125a6-a8e2-44d2-8e4f-a9e91e7df55a" />

## 11. Limitations and Future Work

### Limitations
- No detection of overflow (FIFO full) or underflow (FIFO empty).
- No circular pointer wrapping.

### Future Enhancements
- Add full and empty status flags.
- Implement pointer wrap-around logic for continuous operation.
- Extend design to handle asynchronous read/write with proper synchronization.

## 12. Conclusion
This project successfully demonstrates the design and simulation of a synchronous FIFO using Verilog HDL. The module effectively handles ordered data flow, write-read sequencing, and memory management. It provides a strong foundation for more advanced FIFO systems with additional safety and control features for real-world applications.
