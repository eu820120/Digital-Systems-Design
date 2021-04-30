onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mod_tb/clk
add wave -noupdate /mod_tb/reset
add wave -noupdate /mod_tb/mod_sig
add wave -noupdate /mod_tb/one_hz
add wave -noupdate -format Analog-Step -height 74 -max 2047.0 -min -2047.0 /mod_tb/sin_out
add wave -noupdate -format Analog-Step -height 74 -max 2047.0 -min -2047.0 /mod_tb/sin_mod
add wave -noupdate -format Analog-Step -height 74 -max 2047.0 -min -2047.0 /mod_tb/sin_mod2
add wave -noupdate /mod_tb/lfsr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4016439420263 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {4993202638460 ps} {5035132106548 ps}
