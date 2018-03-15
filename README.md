# CodeBreak
A hardware-based project on the FPGA board where the user must guess the right hexadecimal (base 16: digits 0, 1, ..., 9, A, B, ..., F) 4-digit number to solve the code. 

### Powers of 2
Being a computer science geek, I intentionally designed this game to fit in powers of 2. In a given game:
- 1: number of codes you need to guess
- 2: number of button functionalities (reset and send)
- 4: number of digits the code you need to guess
- 8: number of tries you are given to guess the code correctly before reaching game over
- 16: number of possible digits in the code (since it is in hexadecimal)
- 32: number of bits in an integer usually, used heavily in developing this project
- 64: number of bits of the word size for which the machine runs (64-bit machine)
- 128: number of hours spent on this project (?) not really
