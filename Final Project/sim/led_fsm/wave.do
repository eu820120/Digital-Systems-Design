onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /led_fsm_tb/qwerasd/audio_data
add wave -noupdate /led_fsm_tb/qwerasd/clk
add wave -noupdate /led_fsm_tb/qwerasd/led_dis
add wave -noupdate /led_fsm_tb/qwerasd/state
add wave -noupdate -radix unsigned /led_fsm_tb/qwerasd/count
add wave -noupdate -radix decimal -childformat {{{/led_fsm_tb/qwerasd/abso_val[7]} -radix decimal} {{/led_fsm_tb/qwerasd/abso_val[6]} -radix decimal} {{/led_fsm_tb/qwerasd/abso_val[5]} -radix decimal} {{/led_fsm_tb/qwerasd/abso_val[4]} -radix decimal} {{/led_fsm_tb/qwerasd/abso_val[3]} -radix decimal} {{/led_fsm_tb/qwerasd/abso_val[2]} -radix decimal} {{/led_fsm_tb/qwerasd/abso_val[1]} -radix decimal} {{/led_fsm_tb/qwerasd/abso_val[0]} -radix decimal}} -subitemconfig {{/led_fsm_tb/qwerasd/abso_val[7]} {-radix decimal} {/led_fsm_tb/qwerasd/abso_val[6]} {-radix decimal} {/led_fsm_tb/qwerasd/abso_val[5]} {-radix decimal} {/led_fsm_tb/qwerasd/abso_val[4]} {-radix decimal} {/led_fsm_tb/qwerasd/abso_val[3]} {-radix decimal} {/led_fsm_tb/qwerasd/abso_val[2]} {-radix decimal} {/led_fsm_tb/qwerasd/abso_val[1]} {-radix decimal} {/led_fsm_tb/qwerasd/abso_val[0]} {-radix decimal}} /led_fsm_tb/qwerasd/abso_val
add wave -noupdate -radix unsigned /led_fsm_tb/qwerasd/sum
add wave -noupdate -radix unsigned /led_fsm_tb/qwerasd/average
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2047 ps} 0}
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
WaveRestoreZoom {779 ps} {7899 ps}
