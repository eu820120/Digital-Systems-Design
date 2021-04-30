onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /write_mem_tb/clk
add wave -noupdate /write_mem_tb/address
add wave -noupdate /write_mem_tb/data
add wave -noupdate /write_mem_tb/write_en
add wave -noupdate /write_mem_tb/readd
add wave -noupdate /write_mem_tb/read_m
add wave -noupdate /write_mem_tb/address_m
add wave -noupdate /write_mem_tb/read_d
add wave -noupdate /write_mem_tb/address_d
add wave -noupdate /write_mem_tb/data_d
add wave -noupdate /write_mem_tb/wren_d
add wave -noupdate /write_mem_tb/secret_key
add wave -noupdate /write_mem_tb/led_bad
add wave -noupdate /write_mem_tb/led_good
add wave -noupdate /write_mem_tb/si
add wave -noupdate /write_mem_tb/j_next
add wave -noupdate /write_mem_tb/j
add wave -noupdate /write_mem_tb/i
add wave -noupdate /write_mem_tb/state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7879 ps} 0}
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
configure wave -timelineunits ns
update
WaveRestoreZoom {7872 ps} {7905 ps}
