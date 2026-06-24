#placing physical cells End and Well caps
addEndCap -coreBoundaryOnly -preCap {FILL2}  -postCap {FILL2} -prefix ENDCAP > EndCap.rpt

set_well_tap_mode -rule 100
addWellTap -cell FILL2 -cellInterval 20 -fixedGap -prefix WELLTAP > welltap.rpt
 
verifyEndCap > sanityEndCap.rpt
verifyWellTap -rule 20 -cell FILL2 > sanityWellTap.rpt

# sanity checking for Design Init, before Placement, before CTS, Before route, after route
checkDesign -netlist > sanity_check_for_netlist_BeforePlacement
checkDesign -physicalLibrary > sanity_check_for_leffiles_BeforePlacement
checkDesign -timingLibrary > sanity_check_for_libfiles_BeforePlacement
check_timing > sanity_check_for_timing_BeforePlacement
checkDesign -floorplan > sanity_check_for_floorplan_BeforePlacement
 
setMaxRouteLayer 5

#Placement
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
