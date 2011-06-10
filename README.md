Quad XC-1A
==========

This project connects four XMOS XC-1A development boards together via 5-wire XMOS
links. The connection is tested via a simple demo.

Author
------

I'm [Tom Carter][me]. This project was adapted from an example of connecting two XMOS
XC-1 booads by Martin Young.

Walkthrough
===========

To Construct the XMOS Links
---------------------------

The XMOS link cables must be connected in a hypercube topology. That is there are
4 links between the four boards with each board connected to two others. See page
6 of the [XS-1 Link Performance and Design Guidelines][link] (pdf) for a diagram of 
this.

Each cable must be connected between X3PortA and X3PortB for the purpose of this
example. Note that the cables must have a twist in them. See page 9 of the 
[XC-1A Hardware Manual][manual] (pdf) for I/O pin mapping.

To Build
--------

	build.bat

This must be run from the XMOS command prompt.

The script compiles the example program, splits it into parts and then creates 4 new
executables. Executables named 'boardX.xe' are first stage loaders for each board.
They establish the XMOS links. Executables named 'appX.xe' contain the main program.
Usually, xgdb deals with loading and running these but we have to use seperate 
debugger sessions and so it must be done manually.

To Run
------

Find the adapter IDs of each of the XMOS boards by running this command in an XMOS 
command prompt, with all boards attached via USB:

	xrun -l

Start four xgdb sessions in seperate XMOS command prompts:

	xgdb boardA.xe

	xgdb boardB.xe

	xgdb boardC.xe

	xgdb boardD.xe

Connect one session to each XC-1A board:

	connect --adapter-id <adapterid>

All first stage loaders must now be run within one second of each other. This is
because the XMOS links are muxed with ports and the ports have to be driven low on 
both sides before the links are enabled. The first stage loader drives the ports low 
waits 1 second then enables the ports. 

The easiest method is to type 'run' in each command prompt first, and then attempt to
press return in them both as fast as possible. 

If that works, halt all sessions (ctrl + c).

Select the appropriate executable in each command prompt:

	file appA.xe

	file appB.xe

	file appC.xe

	file appD.xe

Reconnect all of the XMOS boards (make sure to use the same adapter ID!):

	connect --adapter-id <adapterid> --noreset

Load the program in each session

	load

Finally, run them

	continue

If all has gone well, you will see output printed to the command prompt and button
lights illuminate on all boards.

[me]:http://www.tomcarter.org.uk
[link]:https://www.xmos.com/download/public/XS1-G-Link-Performance-Design-Guidelines%281.1%29.pdf
[manual]:https://www.xmos.com/download/public/XC-1A-Hardware-Manual(1).pdf
