# Digital-Systems-Design
A Digital System Design course consisting of 5 labs and a final project. SystemVerilog, VHDL, Assembly and a De1-soc FPGA were used for these projects.

# Lab 1 Tone organ
Using a frequency divider, we generated "523Hz 587Hz 659Hz 698Hz 783Hz 880Hz 987Hz 1046Hz" signals from the 50MHz clock. The generated frequency is controllable from the switches SW[3:1]. SW[0] enables the audio output. A LED control was also done to have LEDs flashing from side to side.

# Lab 2 Simple Ipod
An MP3 was made using the De1-soc with Altera flash controller and a keyboard for audio control.
### Flash address and audio sampling
Each word address in the flash contains a 32-bit sample, which means each word address contains two audio samples that we need.\
Instead of using full 16 bits for audio data, we only took first 8 bits. (This is how our professor set it up)\
Our audio sampling rate was 22Hz and the audio sample was 8 bits long. Meaning that we toggle between higher bits and lower bits with frequency 22Hz, and change word addresses with frequency 44Hz.\
An FSM was implemented to control the read address of the flash and a multiplexer was used to control audio data.

### Frequency Generation and Edge Detector
Using a frequency divider, we easily got signals with 22Hz and 44Hz frequency. However, the 50MHz clock is not synchronized with 22Hz and 44Hz, we had to build a edge detector and use the output signal as a stimulus for our FSM and multiplexer.

### Keyboard Interface and Speed Control
By reading the ASCII code received from the keyboard, we made a control interface for the keyboard:
+ D -> pause
+ E -> play
+ R -> reset 
+ B -> rewind 
+ F -> forward  
 
The keys KEY[2:0] on the De1-soc board were use to control the stimulus frequency:
+ KEY[0] -> speed increase
+ KEY[1] -> speed decrease
+ KEY[2] -> resets to 22Hz

# Lab 3 Strength meter
In this lab, we used an embedded picoblaze processor to add a strength meter to our previous lab.\
Instead of using a FSM, Assembly code was used to implement the following algorithm.
### Strength Meter Algorithm
A interrupt routine is triggered each time a new value is read from the flash.\
Each sound sample has its own "intensity" or absolute value. Once the interrupt accumulates and sums 256 of these values, the interrupt routine divides this sum by 256 every 256th interrupt triggered. This creates an averaging filter operation.\
The LED will display will show the most significant binary digit of the average when the the 256th interrupt triggered. Then the counter will reset and go through the process again.\



