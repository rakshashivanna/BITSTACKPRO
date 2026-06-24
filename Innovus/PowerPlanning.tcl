# Power_connect Global nets
clearGlobalNets
globalNetConnect VDD -type tiehi -pin VDD -inst * -module {}
globalNetConnect VDD -type pgpin -pin VDD -inst * -module {}
globalNetConnect VSS -type pgpin -pin VSS -inst * -module {}
globalNetConnect VSS -type tielo -pin VSS -inst * -module {}

#Adding power Ring
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer Metal11 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }

addRing -nets {VDD VSS} -type core_rings -follow core -layer {top Metal11 bottom Metal11 left Metal10 right Metal10} -width {top 1 bottom 1 left 1 right 1} -spacing {top 1.25 bottom 1.25 left 1.25 right 1.25} -offset {top 0.6 bottom 0.6 left 0.6 right 0.6} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None
 
# Adding Power Stripes (only for Block level)
#addStripe -layer M11 -set_to_set_distance  5 -width 0.22 -spacing 0.20 -nets {VDD VSS} -direction horizontal
#addStripe -layer M10 -set_to_set_distance  5 -width 0.22 -spacing 0.20 -nets {VDD VSS} -direction vertical
 
sroute > sroute.rpt
#manually check via's at orthogonal area
#verifyConnectivity (sanitychecks for PG only power but not all)
#verifyPGShorts
