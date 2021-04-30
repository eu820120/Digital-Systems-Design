onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /fsm_address_tb/clk
add wave -noupdate /fsm_address_tb/start
add wave -noupdate /fsm_address_tb/stop
add wave -noupdate /fsm_address_tb/forw
add wave -noupdate /fsm_address_tb/backw
add wave -noupdate /fsm_address_tb/restart
add wave -noupdate /fsm_address_tb/stimulus
add wave -noupdate -expand /fsm_address_tb/address
add wave -noupdate /fsm_address_tb/state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
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
WaveRestoreZoom {0 ps} {160 ps}
