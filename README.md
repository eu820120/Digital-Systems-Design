# Digital-Systems-Design
A Digital System Design course consisting of 5 labs and a final project. SystemVerilog, VHDL, Assembly and a De1-soc FPGA were used for these projects.

## Lab 1 Tone organ
Using a frequency divider, we generated "523Hz 587Hz 659Hz 698Hz 783Hz 880Hz 987Hz 1046Hz" signals from the 50MHz clock. The generated frequency is controllable from the switches SW[3:1]. SW[0] enables the audio output. A LED control was also done to have LEDs flashing from side to side.

## Lab 2 Simple Ipod
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

## Lab 3 Strength meter
In this lab, we used an embedded picoblaze processor to add a strength meter to our previous lab.\
Instead of using a FSM, Assembly code was used to implement the following algorithm.
### Strength Meter Algorithm
A interrupt routine is triggered each time a new value is read from the flash.\
Each sound sample has its own "intensity" or absolute value. Once the interrupt accumulates and sums 256 of these values, the interrupt routine divides this sum by 256 every 256th interrupt triggered. This creates an averaging filter operation.\
The LED will display will show the most significant binary digit of the average when the the 256th interrupt triggered. Then the counter will reset and go through the process again.

## Lab 4 RC4 Decryption
In this lab, we built an RC4 cracking circuit which implements a "brute force" attack on RC4 by cycling throught the entire keyspace and stopping when a successful decryption is performed. Parallel processing was also implemented in the end for faster cracking.

### RC4 Algorithm
```
 // Input:
 // secret_key [] : array of bytes that represent the secret key. In our implementation, 
 // we will assume a key of 24 bits, meaning this array is 3 bytes long 
 // encrypted_input []: array of bytes that represent the encrypted message. In our 
 // implementation, we will assume the input message is 32 bytes 
 
 // Output:
 // decrypted _output []: array of bytes that represent the decrypted result. This will 
 // always be the same length as encrypted_input []. 
 
 // initialize s array. You will build this in Task 1 
 for i = 0 to 255 { 
 s[i] = i; 
 } 
 // shuffle the array based on the secret key. You will build this in Task 2 
 j = 0 
 for i = 0 to 255 { 
 j = (j + s[i] + secret_key[i mod keylength] ) mod 256 //keylength is 3 in our impl. 
 swap values of s[i] and s[j] 
 } 
 // compute one byte per character in the encrypted message. You will build this in Task 2 
 i = 0, j=0 
 for k = 0 to message_length-1 { // message_length is 32 in our implementation 
 i = (i+1) mod 256 
 j = (j+s[i]) mod 256 
 swap values of s[i] and s[j] 
 f = s[ (s[i]+s[j]) mod 256 ] 
 decrypted_output[k] = f xor encrypted_input[k] // 8 bit wide XOR function 
 }
```
In this lab, we assumed secret_key is only 24 bits.

### RAM/ROM instantiation
We used the Megafunction Wizard to create suitable RAM/ROM for our design.\
In-System Memory Content Editor was used to observe the contents and debug.

### Cracking Core Design (Single Core)
The algorithm was implemented with a single FSM. \
The key is set to 0 as default. Using the key, it goes through the decryption process and finds the output.\
Then, the output is checked if its a successful decryption or not. We did this by checking if every character represents a letter in the alphabet or "space".\
If the decryption is succesful, the key is shown on the HEX display and the FSM stops running. If it is unsuccesful, the key increments by one and runs the whole process again until the right key is founded.

### Multicore Design
A multicore design was used for increasing cracking speed. We used four decryption cores and split the search space into 4 equal size spaces. Once the correct key is found by any of the cores, a signal is sent out to stop all FSM's and the correct key is displayed on the HEX display.

## Lab 5 VGA oscilloscope
In this lab, we covered topics of Nios, Qsys, DDS (Direct Digital Synthesis), LFSR (Linear Feedback Shift Registers), Modulations (ASK, BPSK, FSK) and clock domain crossing. A VGA screen is used to display signals.

### DDS with LFSR modulation(ASK, BPSK)
We used a DDS with a tuning word that would generate a 3 Hz carrier. Then we instantiated a 5-bit LFSR(with 1Hz clock) and used the 0-bit as a pseudo-random bit sequence. This bit is used for modulation of the DDS to generate ASK and BPSK signals.

### FSK modulation using Nios
We instantiated a PIO that allows the Nios to read the LFSR 0-bit, and another PIO to allow Nios to control DDS tuning word. If LFSR bit is 0, the tuning word would generate a 1 Hz signal, if LFSR bit is 1, the tuning word would generate a 5 Hz signal.

## Final Project - Talking Calculator
In this project, we made a talking calculator that can be used with a connected keyboard. The talking part was created using code that emulates the SPO256 speech synthesizer. The instructions of which phoneme to say were controlled by a picoblaze processor (Assembly). The calculation functionality and audio processing were all done in verilog.

### Phoneme and audio data
The phoneme data were stored in the flash memory. Multiple FSM's were instantiated where they interact with each other using start-finish protocol. Picoblaze sends the phoneme to FSM1, FSM1 converts the phoneme into start, end addresses and give it to FSM2, FSM2 converts byte addresses to word addresses and give it to FSM3, FSM3 reads the flash and sample the audio data, after FSM3 finishes it sends a signal back to FSM2, then FSM2 sends a signal to FSM1, then FSM1 sends a signal to Picoblaze to read the next instruction.

### Audio sampling
The audio data is 8 bit, so each address contains 4 audio data. A 7200Hz stimulus in FSM3 was used to sample the audio using the correct frequency. Instead of using a multiplexer approach like Lab 2, it is done with an FSM(FSM3) because we need to stop at a certain address and send a finish signal back to FSM2.

### Volume meter 
The algorithm here is identical to Lab 3 expect we did it using a FSM instead of picoblaze.
1. Calculate absolute value of 8-bit audio data (for each read)
2. Calculate the sum of 256 audio data (after getting 256 values)
3. Calculate the average using shift right
4. Display LEDs representing the value of the most significant digit of the average

### 8b10b Codec
An 8b10b serial link was emulated to practice using 8b10b codec. The 8-bit audio data was encoded and then decoded. The decoded data then is sent to the audio (should be the same as the original). The "silent" signal, which is 1 when a silent phoneme is selected, is used in the codec as the K28.5 control bit. If this control bit is detected after decoding, the audio will be muted. 

