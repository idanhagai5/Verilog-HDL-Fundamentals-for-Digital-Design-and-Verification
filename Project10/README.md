# Project10
Design and verify a D-latch.

## Interface Definition
The module should have the following interface:
- When enable is active -> q gets the value of d. 
- When rst_n is 0 -> reset the value of q.

```verilog
  input    d
  input    enable
  input    rst_n

  output   q
  output   q_not 
```
