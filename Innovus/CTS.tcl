###########################Add them and Modify according to your design and process node you are working on################
# NDR stands for Non Default Rule######################
#add_ndr -width_multiplier {M9:M8 2} -spacing_multiplier {M9:M8 2} -name top_route_ndr
#add_ndr -width_multiplier {M7:M6 2} -spacing_multiplier {M7:M6 2} -name trunk_route_ndr
#add_ndr -width_multiplier {M5:M4 2} -spacing_multiplier {M5:M4 2} -name leaf_route_ndr
#create_route_type -name top_route_type -non_default_rule top_route_ndr
#create_route_type -name trunk_route_type -non_default_rule trunk_route_ndr
#create_route_type -name leaf_route_type -non_default_rule leaf_route_ndr
#set_ccopt_property -route_type top_route_type -net_type top
#set_ccopt_property -route_type trunk_route_type -net_type trunk
#set_ccopt_property -route_type leaf_route_type -net_type leaf

#Clock skew: The difference in arrival times of clock signals at different components or registers. Generally 10% of Clock Period
#Skew balancing is one of the challenges in clock tree optimization. We provide a target skew as a clock tree constraint. PnR tool will try to balance the skew within the given limit of #skew.
set_ccopt_property -target_skew 0.730

set_ccopt_property -target_max_trans 0.1
set_ccopt_property inverter_cells {CLKINVX1 CLKINVX2 CLKINVX12 CLKINVX16 CLKINVX20 CLKINVX4 CLKINVX3 CLKINVX6 CLKINVX8 INVX1 INVX2 INVX12 INVX16 INVX20 INVXL INVX3 INVX4 INVX6 INVX8}
set_ccopt_property buffer_cells {BUFX2 BUFX12 BUFX16 BUFX20 CLKBUFX2 BUFX3 BUFX4 BUFX6 BUFX8 CLKBUFX12 CLKBUFX16 CLKBUFX20 CLKBUFX3 CLKBUFX4 CLKBUFX6 CLKBUFX8}
setOptMode -usefulSkew true
create_ccopt_clock_tree_spec -file NBIT_STACK_CTS.spec
source NBIT_STACK_CTS.spec
#Innovus Clock Concurrent Optimization Technology[CCOPT] for Clock Tree Synthesis
ccopt_design > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/CTS/CTS_Report.rpt
reportCongestion -trialRoute

##########################################If You want to perform Optimization on done CTS ##########################################
#setOptMode -fixFanoutLoad true
#optDesign -postCTS  
#optDesign -postCTS -hold 
########################################## Reporting Timing, Power, Area ############################################################# 
reportCongestion -trialRoute
timeDesign -postCTS -slackReports -drvReports -outDir /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/CTS/TimingReport_Setup.rpt
timeDesign -postCTS -hold -outDir /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/CTS/TimingReport_Hold.rpt
report_area > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/CTS/PDArea.rpt 
report_power > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/CTS/PDPower.rpt


group_path -name r2r -from [all_registers] -to [all_register]
group_path -name r2o -from [all_registers] -to [all_outputs]
group_path -name i2r -from [all_inputs] -to [all_registers]
group_path -name i2o -from [all_inputs] -to [all_outputs]

report_timing -late -path_group r2r -max_paths  20000  > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/CTS/r2r_setup.rpt
report_timing -late -path_group r2o -max_paths  20000  > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/CTS/r2o_setup.rpt
report_timing -late -path_group i2r -max_paths  20000  > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/CTS/i2r_setup.rpt
report_timing -late -path_group i2o -max_paths  20000  > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/CTS/i2o_setup.rpt


report_timing -early -path_group r2r -max_paths  20000  > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/CTS/r2r_hold.rpt
report_timing -early -path_group r2o -max_paths  20000  > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/CTS/r2o_hold.rpt
report_timing -early -path_group i2r -max_paths  20000  > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/CTS/i2r_hold.rpt
report_timing -early -path_group i2o -max_paths  20000  > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/CTS/i2o_hold.rpt

report_ccopt_skew_groups -summary
get_ccopt_clock_tree_cells * -node_types buffer
get_ccopt_clock_tree_cells * -node_types inverter

verify_PG_short > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/CTS/pgshort.rpt
verify_connectivity -allPGPinPort > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/CTS/connectivity.rpt
verify_drc > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/CTS/drc.rpt
saveNetlist /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/CTS/NBIT_STACK_Netlist.v
