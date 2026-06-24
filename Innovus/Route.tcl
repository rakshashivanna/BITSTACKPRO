setAnalysisMode -analysisType onChipVariation -cppr both

routeDesign > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/Route/routedesign.rpt
checkRoute  > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/Route/routereport.rpt
timeDesign -postRoute -drvReports -slackReports -expandedviews -outDir /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/Route/PDTiming_Setup.rpt
timeDesign -postRoute -hold -slackReports -expandedviews -outDir /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/Route/PDTiming_Hold.rpt
group_path -name r2r -from [all_registers] -to [all_register]
group_path -name r2o -from [all_registers] -to [all_outputs]
group_path -name i2r -from [all_inputs] -to [all_registers]
group_path -name i2o -from [all_inputs] -to [all_outputs]

report_timing -path_group r2r -max_paths  20000  > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/Route/r2r_setup.rpt
report_timing -path_group r2o -max_paths  20000  > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/Route/r2o_setup.rpt
report_timing -path_group i2r -max_paths  20000  > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/Route/i2r_setup.rpt
report_timing -path_group i2o -max_paths  20000  > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/Route/i2o_setup.rpt

report_area  > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/Route/area.rpt
report_power > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/Route/power.rpt
verify_PG_short > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/Route/pgshort.rpt
verify_connectivity -allPGPinPort > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/Route/connectivity.rpt
verify_drc > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/Route/drc.rpt
checkDesign -netlist > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/Route/netlist.rpt
saveNetlist /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/Route/nbit_stack_Routed_netlist.v
