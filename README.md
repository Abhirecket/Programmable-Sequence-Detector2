# Programmable Sequence Detector2
 Added extra signal to control sequence from user end with load functionality. Please refer Programmable Sequence Detector first.

 ### RTL Description: Programmable Sequence Detector

- **Engineer**: Abhishek Kumar Kushwaha
- **Date Created**: March 19, 2024
- **Module Name**: programmable_sequence_detector
- **Company**: College of VLSI
- **Revision**: Revision 0.01 - File Created

#### Overview:
The `programmable_sequence_detector` module implements a sequence detector that detects a programmable sequence of bits in a stream of input data. It allows the user to specify the sequence to detect (`prog_sequence_i`) and provides an output signal (`detect_o`) indicating whether the specified sequence has been detected in the input data stream.

#### Functional Description:
- **Inputs**: 
  - `clk`: Clock signal.
  - `rst`: Reset signal.
  - `data_i`: Input data stream.
  - `load_i`: Load signal for loading the programmable sequence.
  - `prog_sequence_i`: Programmable sequence to detect.
- **Outputs**:
  - `detect_o`: Output signal indicating whether the programmable sequence has been detected.
- **Parameters**:
  - `WIDTH`: Parameter specifying the width of the input data and the programmable sequence.
- **Registers**:
  - `prog_sequence_q`: Register to store the programmable sequence.
  - `shift_q`: Register to store the shifted input data stream.
- **Logic**:
  - The `prog_sequence_q` register holds the programmable sequence. It is loaded with the specified sequence (`prog_sequence_i`) when the `load_i` signal is asserted.
  - The `shift_q` register holds the shifted input data stream. It is updated on every clock cycle by shifting in the new input data (`data_i`).
  - The `shift_nxt` wire represents the next state of the shifted input data.
  - The `detect_o` output is determined by comparing the shifted input data (`shift_nxt`) with the programmable sequence (`prog_sequence_q`). If they match, `detect_o` is asserted.
- **Reset Handling**:
  - On reset (`rst`), the `prog_sequence_q` and `shift_q` registers are cleared.
- **Dependencies**:
  - This module has no external dependencies.

#### Target Devices and Tool Versions:
- This RTL design does not specify target devices or tool versions. It is generic and can be synthesized using various Verilog synthesis tools.

#### Additional Comments:
- Programmable Sequence Detector modules are widely used in digital systems for detecting specific sequences of data.
- The ability to specify the sequence to detect makes this module versatile and applicable to various applications.
