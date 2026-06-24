#!/usr/bin/tclsh
#1st Project =>  Project 
#Importing Design for Floorplan

set init_lef_file {
/opt/eda/cadence/local/GSCLIB045_Fall2024_SymbolwithVDDVSS/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_all_v4.4/gsclib045/lef/gsclib045_tech.lef
/opt/eda/cadence/local/GSCLIB045_Fall2024_SymbolwithVDDVSS/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_all_v4.4/gsclib045/lef/gsclib045_macro.lef
/opt/eda/cadence/local/GSCLIB045_Fall2024_SymbolwithVDDVSS/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_all_v4.4/gsclib045/lef/gsclib045_multibitsDFF.lef

}
set init_verilog /home/shivansa/CUSTOM-CIRCUIT-DESIGN/Project_shivansa/Innovus/InputFiles/nbit_stack_map.v
set init_mmmc_file /home/shivansa/CUSTOM-CIRCUIT-DESIGN/Project_shivansa/Innovus/InputFiles/nbit_stack_map.view
set init_pwr_net VDD
set init_gnd_net VSS
init_design

# sanity check for UPF, SDC (timing)
checkDesign -all > ChkDsgnlafterinit.rpt

group_path -name r2r -from [all_registers] -to [all_register]
group_path -name r2o -from [all_registers] -to [all_outputs]
group_path -name i2r -from [all_inputs] -to [all_registers]
group_path -name i2o -from [all_inputs] -to [all_outputs]

timeDesign -prePlace -outDir /home/shivansa/CUSTOM-CIRCUIT-DESIGN/Project_shivansa/Innovus/OutputFiles/Preplace/TimingReport.rpt
report_area > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/Project_shivansa/Innovus/OutputFiles/Preplace/PDArea.rpt 
report_power > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/Project_shivansa/Innovus/OutputFiles/Preplace/PDPower.rpt
 
# Setting the core area aspect ratio, gsclib045site varies based on technology
floorPlan -site CoreSite -r 0.924324324324 0.493243 4.0 4.04 4.0 4.04
loadIoFile /home/shivansa/CUSTOM-CIRCUIT-DESIGN/Project_shivansa/Innovus/Run2/nbit_stack.save.io

#DO IO PLACEMENT => loadIoFile,
 
# Power_connect Global nets
clearGlobalNets
globalNetConnect VDD -type tiehi -pin VDD -inst * -module {}
globalNetConnect VDD -type pgpin -pin VDD -inst * -module {}
globalNetConnect VSS -type pgpin -pin VSS -inst * -module {}
globalNetConnect VSS -type tielo -pin VSS -inst * -module {}
 
#checkFplan (sanity check after macro placement)


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
#The ring targets are set to core/block ring wires.
#addRing command will consider rows while creating rings.
#addRing command will disallow rings to go over rows.
#addRing command will ignore shorts while creating rings.
addRing -nets {VDD VSS} -type core_rings -follow core -layer {top Metal11 bottom Metal11 left Metal10 right Metal10} -width {top 1 bottom 1 left 1 right 1} -spacing {top 1.25 bottom 1.25 left 1.25 right 1.25} -offset {top 0.6 bottom 0.6 left 0.6 right 0.6} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None


 
# Adding Power Stripes (only for Block level)
#addStripe -layer M11 -set_to_set_distance  5 -width 0.2 -spacing 0.1 -nets {VDD VSS} -direction horizontal
#addStripe -layer M10 -set_to_set_distance  5 -width 0.2 -spacing 0.1 -nets {VDD VSS} -direction vertical
#addStripe -layer M9 -set_to_set_distance  5 -width 2 -spacing 5 -nets {VDD VSS} -direction horizontal
#addStripe -layer M8 -set_to_set_distance  5 -width 2 -spacing 5 -nets {VDD VSS} -direction vertical
#addStripe -layer M7 -set_to_set_distance  5 -width 2 -spacing 5 -nets {VDD VSS} -direction horizontal
#addStripe -layer M6 -set_to_set_distance  10 -width 2 -spacing 5 -nets {VDD VSS} -direction vertical
#addStripe -layer M5 -set_to_set_distance  10 -width 2 -spacing 5 -nets {VDD VSS} -direction horizontal
 
sroute > sroute.rpt
#manually check via's at orthogonal area
#verifyConnectivity (sanitychecks for PG only power but not all)
#verifyPGShorts
 
#placing physical cells End and Well caps
#setEndCapMode -rightEdge FILL2 -flipY true
#left top right and bottom, place TAP CELLS
addEndCap -coreBoundaryOnly -preCap {FILL2}  -postCap {FILL2} -prefix ENDCAP > EndCap.rpt
#addEndCap -coreBoundaryOnly -prefix ENDCAP > rightendcap.rpt
#setEndCapMode -leftEdge FILL2 -flipY true
#addEndCap -coreBoundaryOnly -prefix ENDCAP > leftendcap.rpt
set_well_tap_mode -rule 100
addWellTap -cell FILL2 -cellInterval 20 -fixedGap -prefix WELLTAP > welltap.rpt
 
verifyEndCap > sanityEndCap.rpt
verifyWellTap -rule 20 -cell FILL2 > sanityWellTap.rpt
#checkPlace (to check overlap cells)
# sanity checking for Design Init, before Placement, before CTS, Before route, after route
checkDesign -netlist > sanity_check_for_netlist_BeforePlacement
checkDesign -physicalLibrary > sanity_check_for_leffiles_BeforePlacement
checkDesign -timingLibrary > sanity_check_for_libfiles_BeforePlacement
check_timing > sanity_check_for_timing_BeforePlacement
checkDesign -floorplan > sanity_check_for_floorplan_BeforePlacement
 
setMaxRouteLayer 5



#Placement
#setPlaceMode
placeDesign > PlaceDesign.rpt
#Checks any overlaps and mishappenings in placement
checkPlace > checkplace.rpt
describeCongestion > congestionafterplace.rpt
reportCongestion -overflow 
reportCongestion -hotSpot

timeDesign -preCTS -drvReports -slackReports -expandedviews -outDir /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/Placement/PDTiming_timeDesign.rpt

report_timing > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/Placement/PDTiming_reportTiming.rpt 
report_area > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/Placement/PDArea.rpt 
report_power > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/Placement/PDPower.rpt
 
checkDesign -netlist > sanity_check_for_netlist_AfterPlacement
checkDesign -physicalLibrary > sanity_check_for_leffiles_AfterPlacement
checkDesign -timingLibrary > sanity_check_for_libfiles_AfterPlacement
check_timing > sanity_check_for_timing_AfterPlacement
checkDesign -floorplan > sanity_check_for_floorplan_AfterPlacement

if 0 {
#This If block will not be executed
puts "Printing in IF Statement"
setOptMode
optDesign -preCTS
checkPlace > checkplace.rpt
describeCongestion > congestionafterplace.rpt
reportCongestion -overflow 
reportCongestion -hotSpot

 
checkDesign -netlist > sanity_check_for_netlist
checkDesign -physicalLibrary > sanity_check_for_leffiles
checkDesign -timingLibrary > sanity_check_for_libfiles
check_timing > sanity_check_for_timing
checkDesign -floorplan > sanity_check_for_floorplan
}

setAnalysisMode -analysisType onChipVariation -cppr both

routeDesign > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/Project_shivansa/Innovus/OutputFiles/Route/routedesign.rpt
checkRoute  > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/Project_shivansa/Innovus/OutputFiles/Route/routereport.rpt
timeDesign -postRoute -drvReports -slackReports -expandedviews -outDir /home/shivansa/CUSTOM-CIRCUIT-DESIGN/Project_shivansa/Innovus/OutputFiles/Route/PDTiming_Setup.rpt
timeDesign -postRoute -hold -slackReports -expandedviews -outDir /home/shivansa/CUSTOM-CIRCUIT-DESIGN/Project_shivansa/Innovus/OutputFiles/Route/PDTiming_Hold.rpt
report_timing -path_group r2r -max_paths  200  > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/Project_shivansa/Innovus/OutputFiles/Route/r2r_setup.rpt
report_timing -path_group r2o -max_paths  200  > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/Project_shivansa/Innovus/OutputFiles/Route/r2o_setup.rpt
report_timing -path_group i2r -max_paths  200  > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/Project_shivansa/Innovus/OutputFiles/Route/i2r_setup.rpt
report_timing -path_group i2o -max_paths  200  > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/Project_shivansa/Innovus/OutputFiles/Route/i2o_setup.rpt
report_area  > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/Project_shivansa/Innovus/OutputFiles/Route/area.rpt
report_power > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/Project_shivansa/Innovus/OutputFiles/Route/power.rpt
verify_PG_short > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/Project_shivansa/Innovus/OutputFiles/Route/pgshort.rpt
verify_connectivity -allPGPinPort > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/Project_shivansa/Innovus/OutputFiles/Route/connectivity.rpt
verify_drc > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/Project_shivansa/Innovus/OutputFiles/Route/drc.rpt
checkDesign -netlist > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/Project_shivansa/Innovus/OutputFiles/Route/netlist.rpt
saveNetlist /home/shivansa/CUSTOM-CIRCUIT-DESIGN/Project_shivansaProject_shivansaProject_shivansa/Innovus/OutputFiles/Route/nbit_stack_Routed_netlist.v
#Dumps Post Routed Netlist 
 
 
#setAnalysisMode -analysisType onChipVariation -cppr both
#optDesign -postRoute > leonfresh2reports/postroute/setupreport.rpt
#optDesign -postRoute -hold > leonfresh2reports/postroute/holdreport.rpt
#report_timing
#report_timing -path_group r2r -max_paths  11166  > leonfresh2reports/postroute/r2r.v
#report_timing -path_group r2o -max_paths  486  > leonfresh2reports/postroute/r2o.v
#report_timing -path_group i2r -max_paths  321  > leonfresh2reports/postroute/i2r.v
#report_area  > leonfresh2reports/postroute/area.rpt
#report_power > leonfresh2reports/postroute/power.rpt
#verify_PG_short > leonfresh2reports/postroute/pgshort.rpt
#verify_connectivity -allPGPinPort > leonfresh2reports/postroute/connectivity.rpt
#verify_drc > leonfresh2reports/postroute/drc.rpt
#describeCongestion > leonfresh2reports/postroute/describe.rpt
#checkDesign -netlist > leonfresh2reports/postroute/netlist.rpt
#saveNetlist leonfresh2reports/postroute/leonnetlist.v
