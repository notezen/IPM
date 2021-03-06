EESchema Schematic File Version 2  date 20/06/2012 15:14:54
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:con-usb
LIBS:con-usb-2
LIBS:con-usb-3
LIBS:mc34152
LIBS:my_comps
LIBS:ncp3063
LIBS:sdc
LIBS:stm
LIBS:usb
LIBS:valve-power-cache
EELAYER 25  0
EELAYER END
$Descr A4 11700 8267
encoding utf-8
Sheet 2 17
Title ""
Date "20 jun 2012"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 4150 2550 1    60   ~ 0
Gate supply filtering because \nit comes through long wires.
Text GLabel 4500 1500 1    60   Input ~ 0
10V
$Comp
L GND #PWR08
U 1 1 4FDE3727
P 4500 2500
AR Path="/4FDB2BC5/4FDE3727" Ref="#PWR08"  Part="1" 
AR Path="/4FDC7CDA/4FDE3727" Ref="#PWR038"  Part="1" 
AR Path="/4FDC7CD9/4FDE3727" Ref="#PWR044"  Part="1" 
AR Path="/4FDB33F6/4FDE3727" Ref="#PWR050"  Part="1" 
F 0 "#PWR038" H 4500 2500 30  0001 C CNN
F 1 "GND" H 4500 2430 30  0001 C CNN
	1    4500 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 2200 4500 2500
Wire Wire Line
	5000 4700 5000 4900
Connection ~ 4700 3550
Wire Wire Line
	4700 4200 4700 3550
Wire Wire Line
	5800 4400 5800 4900
Connection ~ 7400 1800
Wire Wire Line
	7400 1800 8300 1800
Wire Wire Line
	7400 1900 7400 1700
Wire Wire Line
	6400 2100 6200 2100
Wire Wire Line
	6550 4000 7100 4000
Wire Wire Line
	5100 4000 4500 4000
Wire Wire Line
	5100 3550 4500 3550
Wire Wire Line
	6550 3550 7100 3550
Wire Wire Line
	7100 2100 6900 2100
Wire Wire Line
	7400 2300 7400 2550
Wire Wire Line
	7400 1300 7400 950 
Wire Wire Line
	5800 2750 5800 2250
Wire Wire Line
	9900 1300 9900 950 
Wire Wire Line
	9900 2300 9900 2550
Wire Wire Line
	9600 2100 9400 2100
Wire Wire Line
	8900 2100 8700 2100
Wire Wire Line
	9900 1900 9900 1700
Wire Wire Line
	9900 1800 10800 1800
Connection ~ 9900 1800
Wire Wire Line
	5000 4200 5000 4000
Connection ~ 5000 4000
Wire Wire Line
	4700 4700 4700 4900
Wire Wire Line
	4500 1800 4500 1500
$Comp
L C C11
U 1 1 4FDE3711
P 4500 2000
AR Path="/4FDB2BC5/4FDE3711" Ref="C11"  Part="1" 
AR Path="/4FDC7CDA/4FDE3711" Ref="C12"  Part="1" 
AR Path="/4FDC7CD9/4FDE3711" Ref="C13"  Part="1" 
AR Path="/4FDB33F6/4FDE3711" Ref="C14"  Part="1" 
F 0 "C12" H 4550 2100 50  0000 L CNN
F 1 "100n" H 4550 1900 50  0000 L CNN
	1    4500 2000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR039
U 1 1 4FDCD69E
P 4700 4900
AR Path="/4FDC7CDA/4FDCD69E" Ref="#PWR039"  Part="1" 
AR Path="/4FDC7CD9/4FDCD69E" Ref="#PWR045"  Part="1" 
AR Path="/4FDB2BC5/4FDCD69E" Ref="#PWR09"  Part="1" 
AR Path="/4FDB33F6/4FDCD69E" Ref="#PWR051"  Part="1" 
F 0 "#PWR039" H 4700 4900 30  0001 C CNN
F 1 "GND" H 4700 4830 30  0001 C CNN
	1    4700 4900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR040
U 1 1 4FDC4E02
P 5000 4900
AR Path="/4FDC7CDA/4FDC4E02" Ref="#PWR040"  Part="1" 
AR Path="/4FDC7CD9/4FDC4E02" Ref="#PWR046"  Part="1" 
AR Path="/4FDB2BC5/4FDC4E02" Ref="#PWR010"  Part="1" 
AR Path="/4FDB33F6/4FDC4E02" Ref="#PWR052"  Part="1" 
F 0 "#PWR040" H 5000 4900 30  0001 C CNN
F 1 "GND" H 5000 4830 30  0001 C CNN
	1    5000 4900
	1    0    0    -1  
$EndComp
$Comp
L R R44
U 1 1 4FDC4DF4
P 5000 4450
AR Path="/4FDC7CDA/4FDC4DF4" Ref="R44"  Part="1" 
AR Path="/4FDC7CD9/4FDC4DF4" Ref="R48"  Part="1" 
AR Path="/4FDB2BC5/4FDC4DF4" Ref="R52"  Part="1" 
AR Path="/4FDB33F6/4FDC4DF4" Ref="R56"  Part="1" 
F 0 "R44" V 5080 4450 50  0000 C CNN
F 1 "33k" V 5000 4450 50  0000 C CNN
	1    5000 4450
	-1   0    0    1   
$EndComp
$Comp
L R R43
U 1 1 4FDC4DD8
P 4700 4450
AR Path="/4FDC7CDA/4FDC4DD8" Ref="R43"  Part="1" 
AR Path="/4FDC7CD9/4FDC4DD8" Ref="R47"  Part="1" 
AR Path="/4FDB2BC5/4FDC4DD8" Ref="R51"  Part="1" 
AR Path="/4FDB33F6/4FDC4DD8" Ref="R55"  Part="1" 
F 0 "R43" V 4780 4450 50  0000 C CNN
F 1 "33k" V 4700 4450 50  0000 C CNN
	1    4700 4450
	-1   0    0    1   
$EndComp
Text HLabel 10800 1800 2    60   Input ~ 0
out2
Text HLabel 8300 1800 2    60   Input ~ 0
out1
NoConn ~ 5100 3300
NoConn ~ 5100 3150
$Comp
L GND #PWR041
U 1 1 4FDB2F05
P 5800 4900
AR Path="/4FDC7CDA/4FDB2F05" Ref="#PWR041"  Part="1" 
AR Path="/4FDC7CD9/4FDB2F05" Ref="#PWR047"  Part="1" 
AR Path="/4FDB2BC5/4FDB2F05" Ref="#PWR011"  Part="1" 
AR Path="/4FDB33F6/4FDB2F05" Ref="#PWR053"  Part="1" 
F 0 "#PWR041" H 5800 4900 30  0001 C CNN
F 1 "GND" H 5800 4830 30  0001 C CNN
	1    5800 4900
	1    0    0    -1  
$EndComp
Text Label 6900 4000 0    60   ~ 0
outB
Text Label 6900 3550 0    60   ~ 0
outA
$Comp
L R R46
U 1 1 4FDB2ED0
P 9150 2100
AR Path="/4FDC7CDA/4FDB2ED0" Ref="R46"  Part="1" 
AR Path="/4FDC7CD9/4FDB2ED0" Ref="R50"  Part="1" 
AR Path="/4FDB2BC5/4FDB2ED0" Ref="R54"  Part="1" 
AR Path="/4FDB33F6/4FDB2ED0" Ref="R58"  Part="1" 
F 0 "R46" V 9230 2100 50  0000 C CNN
F 1 "10" V 9150 2100 50  0000 C CNN
	1    9150 2100
	0    -1   -1   0   
$EndComp
$Comp
L MOSFET_N Q10
U 1 1 4FDB2ECF
P 9800 2100
AR Path="/4FDC7CDA/4FDB2ECF" Ref="Q10"  Part="1" 
AR Path="/4FDC7CD9/4FDB2ECF" Ref="Q12"  Part="1" 
AR Path="/4FDB2BC5/4FDB2ECF" Ref="Q14"  Part="1" 
AR Path="/4FDB33F6/4FDB2ECF" Ref="Q16"  Part="1" 
F 0 "Q10" H 9810 2270 60  0000 R CNN
F 1 "MOSFET_N" H 9810 1950 60  0000 R CNN
	1    9800 2100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR042
U 1 1 4FDB2ECE
P 9900 2550
AR Path="/4FDC7CDA/4FDB2ECE" Ref="#PWR042"  Part="1" 
AR Path="/4FDC7CD9/4FDB2ECE" Ref="#PWR048"  Part="1" 
AR Path="/4FDB2BC5/4FDB2ECE" Ref="#PWR012"  Part="1" 
AR Path="/4FDB33F6/4FDB2ECE" Ref="#PWR054"  Part="1" 
F 0 "#PWR042" H 9900 2550 30  0001 C CNN
F 1 "GND" H 9900 2480 30  0001 C CNN
	1    9900 2550
	1    0    0    -1  
$EndComp
$Comp
L DIODE D4
U 1 1 4FDB2ECD
P 9900 1500
AR Path="/4FDC7CDA/4FDB2ECD" Ref="D4"  Part="1" 
AR Path="/4FDC7CD9/4FDB2ECD" Ref="D6"  Part="1" 
AR Path="/4FDB2BC5/4FDB2ECD" Ref="D8"  Part="1" 
AR Path="/4FDB33F6/4FDB2ECD" Ref="D10"  Part="1" 
F 0 "D4" H 9900 1600 40  0000 C CNN
F 1 "1N4148" H 9900 1400 40  0000 C CNN
	1    9900 1500
	0    -1   -1   0   
$EndComp
Text GLabel 9900 950  1    60   Input ~ 0
24V
Text Label 8700 2100 0    60   ~ 0
outB
Text GLabel 5800 2250 1    60   Input ~ 0
10V
Text HLabel 4500 4000 0    60   Input ~ 0
in2
Text HLabel 4500 3550 0    60   Input ~ 0
in1
Text Label 6200 2100 0    60   ~ 0
outA
Text GLabel 7400 950  1    60   Input ~ 0
24V
$Comp
L DIODE D3
U 1 1 4FDB2DC3
P 7400 1500
AR Path="/4FDC7CDA/4FDB2DC3" Ref="D3"  Part="1" 
AR Path="/4FDC7CD9/4FDB2DC3" Ref="D5"  Part="1" 
AR Path="/4FDB2BC5/4FDB2DC3" Ref="D7"  Part="1" 
AR Path="/4FDB33F6/4FDB2DC3" Ref="D9"  Part="1" 
F 0 "D3" H 7400 1600 40  0000 C CNN
F 1 "1N4148" H 7400 1400 40  0000 C CNN
	1    7400 1500
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR043
U 1 1 4FDB2D3E
P 7400 2550
AR Path="/4FDC7CDA/4FDB2D3E" Ref="#PWR043"  Part="1" 
AR Path="/4FDC7CD9/4FDB2D3E" Ref="#PWR049"  Part="1" 
AR Path="/4FDB2BC5/4FDB2D3E" Ref="#PWR013"  Part="1" 
AR Path="/4FDB33F6/4FDB2D3E" Ref="#PWR055"  Part="1" 
F 0 "#PWR043" H 7400 2550 30  0001 C CNN
F 1 "GND" H 7400 2480 30  0001 C CNN
	1    7400 2550
	1    0    0    -1  
$EndComp
$Comp
L MOSFET_N Q9
U 1 1 4FDB2C4B
P 7300 2100
AR Path="/4FDC7CDA/4FDB2C4B" Ref="Q9"  Part="1" 
AR Path="/4FDC7CD9/4FDB2C4B" Ref="Q11"  Part="1" 
AR Path="/4FDB2BC5/4FDB2C4B" Ref="Q13"  Part="1" 
AR Path="/4FDB33F6/4FDB2C4B" Ref="Q15"  Part="1" 
F 0 "Q9" H 7310 2270 60  0000 R CNN
F 1 "MOSFET_N" H 7310 1950 60  0000 R CNN
	1    7300 2100
	1    0    0    -1  
$EndComp
$Comp
L R R45
U 1 1 4FDB2C18
P 6650 2100
AR Path="/4FDC7CDA/4FDB2C18" Ref="R45"  Part="1" 
AR Path="/4FDC7CD9/4FDB2C18" Ref="R49"  Part="1" 
AR Path="/4FDB2BC5/4FDB2C18" Ref="R53"  Part="1" 
AR Path="/4FDB33F6/4FDB2C18" Ref="R57"  Part="1" 
F 0 "R45" V 6730 2100 50  0000 C CNN
F 1 "10" V 6650 2100 50  0000 C CNN
	1    6650 2100
	0    -1   -1   0   
$EndComp
$Comp
L MC34152 U3
U 1 1 4FDB2BFB
P 5800 3750
AR Path="/4FDC7CDA/4FDB2BFB" Ref="U3"  Part="1" 
AR Path="/4FDC7CD9/4FDB2BFB" Ref="U4"  Part="1" 
AR Path="/4FDB2BC5/4FDB2BFB" Ref="U5"  Part="1" 
AR Path="/4FDB33F6/4FDB2BFB" Ref="U6"  Part="1" 
F 0 "U3" H 5800 4100 60  0000 C CNN
F 1 "MC34152" H 5800 3750 60  0000 C CNN
	1    5800 3750
	1    0    0    -1  
$EndComp
$EndSCHEMATC
