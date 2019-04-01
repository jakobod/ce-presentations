onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/clk_s
add wave -noupdate /tb/nres_s
add wave -noupdate /tb/tick_s
add wave -noupdate -divider -height 40 outputs
add wave -noupdate -expand /tb/segments_s
add wave -noupdate -expand /tb/anode_s
add wave -noupdate -expand /tb/ledOut_s
add wave -noupdate -divider -height 40 inputs
add wave -noupdate /tb/values_s
add wave -noupdate /tb/valLd_s
add wave -noupdate /tb/id_s
add wave -noupdate /tb/idLd_s
add wave -noupdate -divider -height 40 {internal signals}
add wave -noupdate /tb/device/nibbles/id
add wave -noupdate /tb/device/nibbles/idLd
add wave -noupdate /tb/device/nibbles/nibbleValues_cs
add wave -noupdate -expand /tb/device/nibbles/nibbleValues_ns
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1348712600 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 275
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {1348712516 ns} {1348713232 ns}
