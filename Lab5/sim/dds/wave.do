onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /dds_tb/clk
add wave -noupdate /dds_tb/reset
add wave -noupdate /dds_tb/en
add wave -noupdate /dds_tb/phase_inc
add wave -noupdate -format Analog-Step -height 74 -max 2047.0 -min -2047.0 /dds_tb/sin_out
add wave -noupdate -format Analog-Step -height 74 -max 2047.0 -min -2047.0 /dds_tb/cos_out
add wave -noupdate -format Analog-Step -height 74 -max 2046.9999999999995 -min -2048.0 /dds_tb/squ_out
add wave -noupdate -format Analog-Step -height 74 -max 2046.9999999999998 -min -2044.0 /dds_tb/saw_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {0 ps} {3095 ps}
