M201 X500.00 Y500.00 Z100.00 E5000.00 ;Setup machine max acceleration
M203 X500.00 Y500.00 Z10.00 E50.00 ;Setup machine max feedrate
M204 P500.00 R1000.00 T500.00 ;Setup Print/Retract/Travel acceleration
M205 X8.00 Y8.00 Z0.40 E5.00 ;Setup Jerk
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate

;------------------------------------------
;*** Start Dual Nozzle/Bed Preheating ***
M140 S{material_bed_temperature_layer_0} ; start preheating the bed
M104 S{material_print_temperature_layer_0} ﻿T0 ; start preheating hotend
G28 ; home
G29 ; Bed Level
M190 S{material_bed_temperature_layer_0} ; heat to Cura Bed setting 
M109 S{material_print_temperature_layer_0} ﻿T0 ; heat to Cura Hotend
;*** End Preheating ***

;--------------------------------------------
;*** Draw a Nozzle Cleaning line on the Left Side of Bed
G92 E0 ;Reset Extruder
G28 ; Home all axes
G1 Z2.0 F3000 ;Move Z Axis up
G1 X10.1 Y20 Z0.28 F5000.0 ;Move to start position
G1 X10.1 Y200.0 Z0.28 F1500.0 E15 ;Draw the first line
G1 X10.4 Y200.0 Z0.28 F5000.0 ;Move to side a little
G1 X10.4 Y20 Z0.28 F1500.0 E30 ;Draw the second line
G92 E0 ;Reset Extruder
G1 Z2.0 F3000 ;Move Z Axis up

;-------------------------------------------------
;*** Single Print Start Tone
M300 S1000 P500 ; chirp to indicate starting to print
;*** End Single Start Tone
;--------------------------------------------

