# Scrolling Text Display


## Disclamer

This repository contains the code of the task, that I have made for the subject [Computer Structures and Architectures](https://courses.fit.cvut.cz/BI-SAP) studied during the second semester at the Czech Technical University in Prague.


## Description

Implement a program that will display the inscription defined in program memory on the device display. The display has two lines of 16 characters each, but the inscription will be longer, so the inscription on the display will rotate, such as in means of transport inscriptions such as "This train ends at the Smíchovské nádraží station".


## Requirements for the functionality:

- [X] After starting the program, the inscription will appear on an empty (!) display and will leave at the end (i.e. the display will be empty again). This will be repeated.
- [X] The program must be able to display any inscription defined in the program’s memory (as an example, "IF THE FINGER WILL NOT BE WET") terminated by a zero. The text is defined in the program memory as a constant behind the `.db` pseudo-instruction.
- [X] Given that the display has two lines, there are two options for how to move:
    - [X] One long text that comes from the end of the second line and when it reaches the beginning of it, it moves to the end of the first line and continues to its beginning.
    - [ ] Two different texts at two different addresses in memory, with one rotating over the first line and the other over the second line. However, both must rotate "simultaneously".
- [X] Edit your text, for example, like this: "MR WALKER FROM SCOTISH OFFICE WANTS POINTS FOR MOVING TEXT AND BONUS". The text has to move in "just right" speed. If it moves too fast, it won’t be possible to find out whom the points should be given, and if he moves too slowly, totor might not be patient enough to read the text. To adjust the speed, use wait-loops called as subroutines. The processor is clocked at **16 MHz**.