onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cdc_tb/clk1
add wave -noupdate /cdc_tb/clk2
add wave -noupdate /cdc_tb/reset
add wave -noupdate -format Analog-Step -height 74 -max 1973.0 /cdc_tb/sin_out
add wave -noupdate -format Analog-Step -height 74 -max 1983.0 -min 191.0 /cdc_tb/ssin
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 49
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {187664587962 ps}
