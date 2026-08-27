# Smart Dustbin using Verilog

## Project Description

The Smart Dustbin is a Verilog HDL project that automatically opens the dustbin lid when an object is detected. It also indicates when the dustbin is full using an LED output.

## Features

* Automatic lid opening when an object is detected.
* Automatic lid closing after a fixed time.
* Full-bin detection.
* LED indication when the dustbin is full.
* Designed using Verilog HDL.
* Includes a simulation testbench.

## Inputs

| Input             | Description                          |
| ----------------- | ------------------------------------ |
| `clk`             | System clock                         |
| `reset`           | Active-high reset                    |
| `object_detected` | Indicates that an object is detected |
| `full_sensor`     | Indicates that the dustbin is full   |

## Outputs

| Output     | Description                        |
| ---------- | ---------------------------------- |
| `lid_open` | Controls the dustbin lid           |
| `full_led` | Indicates that the dustbin is full |

## Working Principle

1. The system starts with the lid closed.
2. When `object_detected` becomes `1`, the lid opens automatically.
3. The lid remains open for a fixed number of clock cycles.
4. The lid closes automatically after the delay.
5. When `full_sensor` becomes `1`, `full_led` turns ON.
6. When the dustbin is emptied, `full_led` turns OFF.

## Files

```text
Smart-Dustbin-Verilog/
│
├── smart_dustbin.v
├── smart_dustbin_tb.v
├── simulation_output.txt
└── README.md
```

## Simulation

The design can be simulated using Icarus Verilog.

```bash
iverilog -o smart_dustbin_sim smart_dustbin.v smart_dustbin_tb.v
vvp smart_dustbin_sim
```

For waveform viewing:

```bash
gtkwave smart_dustbin.vcd
```

## Sample Output

```text
Time=0   | Object=0 | Full=0 | Lid=0 | Full_LED=0
Time=25  | Object=1 | Full=0 | Lid=1 | Full_LED=0
Time=35  | Object=0 | Full=0 | Lid=1 | Full_LED=0
Time=85  | Object=0 | Full=0 | Lid=0 | Full_LED=0
Time=95  | Object=0 | Full=1 | Lid=0 | Full_LED=1
Time=115 | Object=0 | Full=0 | Lid=0 | Full_LED=0
```

## Result

The Smart Dustbin Verilog design was successfully simulated. The lid opens when an object is detected and the full LED indicates the full-bin condition.

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* GitHub

## Author

**Manasa Boya**
