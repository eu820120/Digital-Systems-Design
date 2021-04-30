onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /synth_tb/clk
add wave -noupdate /synth_tb/phoneme_sel
add wave -noupdate /synth_tb/start
add wave -noupdate /synth_tb/flash_ok
add wave -noupdate /synth_tb/tick
add wave -noupdate -radix unsigned /synth_tb/start_word
add wave -noupdate -radix unsigned /synth_tb/end_word
add wave -noupdate /synth_tb/start_num
add wave -noupdate /synth_tb/end_num
add wave -noupdate /synth_tb/finish
add wave -noupdate /synth_tb/flash_start
add wave -noupdate -radix unsigned /synth_tb/flash_mem_address
add wave -noupdate /synth_tb/flash_mem_read
add wave -noupdate /synth_tb/num_mux
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {18167 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 144
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
WaveRestoreZoom {0 ps} {19154 ps}
