EESchema Schematic File Version 2  date Sat 03 Dec 2011 05:16:07 PM CET
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
LIBS:Led Cube-cache
EELAYER 25  0
EELAYER END
$Descr A4 11700 8267
encoding utf-8
Sheet 3 4
Title "Floor control"
Date "3 dec 2011"
Rev "1.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	2250 3350 2400 3350
Wire Wire Line
	2250 3700 2250 3350
Wire Wire Line
	1500 3450 2050 3450
Connection ~ 6450 6700
Wire Wire Line
	6450 6700 5950 6700
Wire Wire Line
	5950 6700 5950 6650
Connection ~ 6450 5100
Wire Wire Line
	6450 5100 5950 5100
Wire Wire Line
	5950 5100 5950 5050
Connection ~ 6450 3500
Wire Wire Line
	6450 3500 5950 3500
Wire Wire Line
	5950 3500 5950 3450
Connection ~ 6450 2050
Wire Wire Line
	6450 2050 5950 2050
Wire Wire Line
	5950 2050 5950 2000
Wire Wire Line
	2850 2600 2850 2700
Wire Wire Line
	1700 2100 1700 2300
Wire Wire Line
	1700 2300 1500 2300
Wire Wire Line
	2400 3550 2050 3550
Wire Wire Line
	2050 3550 2050 3450
Wire Wire Line
	5650 5650 4650 5650
Wire Wire Line
	4650 5650 4650 3950
Wire Wire Line
	4650 3950 3700 3950
Wire Wire Line
	3700 3750 4850 3750
Wire Wire Line
	4850 3750 4850 4050
Wire Wire Line
	4850 4050 5650 4050
Wire Wire Line
	3700 3550 4800 3550
Wire Wire Line
	4800 3550 4800 2500
Wire Wire Line
	4800 2500 5650 2500
Wire Wire Line
	3700 3350 4600 3350
Wire Wire Line
	4600 3350 4600 1050
Wire Wire Line
	4600 1050 5650 1050
Wire Wire Line
	5650 1800 4700 1800
Wire Wire Line
	4700 1800 4700 3450
Wire Wire Line
	4700 3450 3700 3450
Wire Wire Line
	5650 3250 5650 3350
Wire Wire Line
	5650 3350 4900 3350
Wire Wire Line
	4900 3350 4900 3650
Wire Wire Line
	4900 3650 3700 3650
Wire Wire Line
	5650 4850 4750 4850
Wire Wire Line
	4750 4850 4750 3850
Wire Wire Line
	4750 3850 3700 3850
Wire Wire Line
	5650 6450 4550 6450
Wire Wire Line
	4550 6450 4550 4050
Wire Wire Line
	4550 4050 3700 4050
Wire Wire Line
	1500 2500 1700 2500
Wire Wire Line
	1700 2500 1700 2700
Wire Wire Line
	2850 2100 2850 2200
Wire Wire Line
	5950 1250 6450 1250
Wire Wire Line
	6450 1250 6450 7000
Wire Wire Line
	5950 2700 5950 2750
Wire Wire Line
	5950 2750 6450 2750
Connection ~ 6450 2750
Wire Wire Line
	5950 4250 5950 4300
Wire Wire Line
	5950 4300 6450 4300
Connection ~ 6450 4300
Wire Wire Line
	5950 5850 5950 5900
Wire Wire Line
	5950 5900 6450 5900
Connection ~ 6450 5900
Wire Wire Line
	5950 1600 6700 1600
Wire Wire Line
	6700 1600 6700 1400
Wire Wire Line
	6700 650  6700 850 
Wire Wire Line
	6700 850  5950 850 
Wire Wire Line
	5950 2300 6700 2300
Wire Wire Line
	6700 2300 6700 2100
Wire Wire Line
	6700 2850 6700 3050
Wire Wire Line
	6700 3050 5950 3050
Wire Wire Line
	5950 6250 6700 6250
Wire Wire Line
	6700 6250 6700 6050
Wire Wire Line
	6700 5250 6700 5450
Wire Wire Line
	6700 5450 5950 5450
Wire Wire Line
	5950 3850 6700 3850
Wire Wire Line
	6700 3850 6700 3650
Wire Wire Line
	6700 4450 6700 4650
Wire Wire Line
	6700 4650 5950 4650
Wire Wire Line
	2400 3250 1500 3250
$Comp
L GND #PWR?
U 1 1 4EDA4AB7
P 2250 3700
F 0 "#PWR?" H 2250 3700 30  0001 C CNN
F 1 "GND" H 2250 3630 30  0001 C CNN
	1    2250 3700
	1    0    0    -1  
$EndComp
$Comp
L CONN_2 LCTRL
U 1 1 4EDA4AA3
P 1150 3350
F 0 "LCTRL" V 1100 3350 40  0000 C CNN
F 1 "CON1" V 1200 3350 40  0000 C CNN
	1    1150 3350
	-1   0    0    1   
$EndComp
Text Notes 6850 6050 0    60   ~ 0
Layer 8
Text Notes 6850 5250 0    60   ~ 0
Layer 7
Text Notes 6850 4450 0    60   ~ 0
Layer 6
Text Notes 6850 3650 0    60   ~ 0
Layer 5
Text Notes 6850 2850 0    60   ~ 0
Layer 4
Text Notes 6850 2100 0    60   ~ 0
Layer 3
Text Notes 6850 1400 0    60   ~ 0
Layer 2
Text Notes 6850 650  0    60   ~ 0
Layer 1
$Comp
L GND #PWR?
U 1 1 4ED0EFAF
P 6700 4450
F 0 "#PWR?" H 6700 4450 30  0001 C CNN
F 1 "GND" H 6700 4380 30  0001 C CNN
	1    6700 4450
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 4ED0EFAE
P 6700 3650
F 0 "#PWR?" H 6700 3650 30  0001 C CNN
F 1 "GND" H 6700 3580 30  0001 C CNN
	1    6700 3650
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 4ED0EFAD
P 6700 5250
F 0 "#PWR?" H 6700 5250 30  0001 C CNN
F 1 "GND" H 6700 5180 30  0001 C CNN
	1    6700 5250
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 4ED0EFAC
P 6700 6050
F 0 "#PWR?" H 6700 6050 30  0001 C CNN
F 1 "GND" H 6700 5980 30  0001 C CNN
	1    6700 6050
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 4ED0EF95
P 6700 2850
F 0 "#PWR?" H 6700 2850 30  0001 C CNN
F 1 "GND" H 6700 2780 30  0001 C CNN
	1    6700 2850
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 4ED0EF94
P 6700 2100
F 0 "#PWR?" H 6700 2100 30  0001 C CNN
F 1 "GND" H 6700 2030 30  0001 C CNN
	1    6700 2100
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 4ED0EF84
P 6700 650
F 0 "#PWR?" H 6700 650 30  0001 C CNN
F 1 "GND" H 6700 580 30  0001 C CNN
	1    6700 650 
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 4ED0EF5D
P 6700 1400
F 0 "#PWR?" H 6700 1400 30  0001 C CNN
F 1 "GND" H 6700 1330 30  0001 C CNN
	1    6700 1400
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 4ED0EB83
P 6450 7000
F 0 "#PWR?" H 6450 7000 30  0001 C CNN
F 1 "GND" H 6450 6930 30  0001 C CNN
	1    6450 7000
	1    0    0    -1  
$EndComp
Text Notes 2800 1900 0    60   ~ 0
U1
$Comp
L +5V #PWR?
U 1 1 4ED0EB2A
P 2850 2100
F 0 "#PWR?" H 2850 2190 20  0001 C CNN
F 1 "+5V" H 2850 2190 30  0000 C CNN
	1    2850 2100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 4ED0EB24
P 2850 2700
F 0 "#PWR?" H 2850 2700 30  0001 C CNN
F 1 "GND" H 2850 2630 30  0001 C CNN
	1    2850 2700
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 4ED0EB18
P 2850 2400
F 0 "C1" H 2900 2500 50  0000 L CNN
F 1 "100nF" H 2900 2300 50  0000 L CNN
	1    2850 2400
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 4ED0EAC2
P 1700 2100
F 0 "#PWR?" H 1700 2190 20  0001 C CNN
F 1 "+5V" H 1700 2190 30  0000 C CNN
	1    1700 2100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 4ED0EA37
P 1700 2700
F 0 "#PWR?" H 1700 2700 30  0001 C CNN
F 1 "GND" H 1700 2630 30  0001 C CNN
	1    1700 2700
	1    0    0    -1  
$EndComp
$Comp
L CONN_2 CON2
U 1 1 4ED0E984
P 1150 2400
F 0 "CON2" V 1100 2400 40  0000 C CNN
F 1 "PWR" V 1200 2400 40  0000 C CNN
	1    1150 2400
	-1   0    0    1   
$EndComp
$Comp
L MOSFET_N Q8
U 1 1 4ECD153A
P 5850 6450
F 0 "Q8" H 5860 6620 60  0000 R CNN
F 1 "MOSFET_N" H 5860 6300 60  0000 R CNN
	1    5850 6450
	1    0    0    -1  
$EndComp
$Comp
L MOSFET_N Q1
U 1 1 4ECD1535
P 5850 1050
F 0 "Q1" H 5860 1220 60  0000 R CNN
F 1 "MOSFET_N" H 5860 900 60  0000 R CNN
	1    5850 1050
	1    0    0    -1  
$EndComp
$Comp
L MOSFET_N Q7
U 1 1 4ECD1530
P 5850 5650
F 0 "Q7" H 5860 5820 60  0000 R CNN
F 1 "MOSFET_N" H 5860 5500 60  0000 R CNN
	1    5850 5650
	1    0    0    -1  
$EndComp
$Comp
L MOSFET_N Q6
U 1 1 4ECD152F
P 5850 4850
F 0 "Q6" H 5860 5020 60  0000 R CNN
F 1 "MOSFET_N" H 5860 4700 60  0000 R CNN
	1    5850 4850
	1    0    0    -1  
$EndComp
$Comp
L MOSFET_N Q5
U 1 1 4ECD152B
P 5850 4050
F 0 "Q5" H 5860 4220 60  0000 R CNN
F 1 "MOSFET_N" H 5860 3900 60  0000 R CNN
	1    5850 4050
	1    0    0    -1  
$EndComp
$Comp
L MOSFET_N Q4
U 1 1 4ECD1529
P 5850 3250
F 0 "Q4" H 5860 3420 60  0000 R CNN
F 1 "MOSFET_N" H 5860 3100 60  0000 R CNN
	1    5850 3250
	1    0    0    -1  
$EndComp
$Comp
L MOSFET_N Q3
U 1 1 4ECD1525
P 5850 2500
F 0 "Q3" H 5860 2670 60  0000 R CNN
F 1 "MOSFET_N" H 5860 2350 60  0000 R CNN
	1    5850 2500
	1    0    0    -1  
$EndComp
$Comp
L MOSFET_N Q2
U 1 1 4ECD14C3
P 5850 1800
F 0 "Q2" H 5860 1970 60  0000 R CNN
F 1 "MOSFET_N" H 5860 1650 60  0000 R CNN
	1    5850 1800
	1    0    0    -1  
$EndComp
$Comp
L 4017 U1
U 1 1 4EC2E825
P 3050 3800
F 0 "U1" H 2950 3650 60  0000 C CNN
F 1 "4017" H 2950 3500 60  0000 C CNN
	1    3050 3800
	1    0    0    -1  
$EndComp
$EndSCHEMATC
