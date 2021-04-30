onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /phoneme_ctrl_tb/start
add wave -noupdate /phoneme_ctrl_tb/converter_ok
add wave -noupdate /phoneme_ctrl_tb/clk
add wave -noupdate /phoneme_ctrl_tb/start_converter
add wave -noupdate /phoneme_ctrl_tb/finish
add wave -noupdate /phoneme_ctrl_tb/state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {11 ps} 0}
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
WaveRestoreZoom {0 ps} {20 ps}
