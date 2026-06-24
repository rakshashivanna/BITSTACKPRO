#!/usr/bin/tclsh
#1st Project =>  Project 
#Importing Design for Floorplan

set init_lef_file {
/opt/eda/cadence/local/GSCLIB045_Fall2024_SymbolwithVDDVSS/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_all_v4.4/gsclib045/lef/gsclib045_tech.lef
/opt/eda/cadence/local/GSCLIB045_Fall2024_SymbolwithVDDVSS/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_all_v4.4/gsclib045/lef/gsclib045_macro.lef
/opt/eda/cadence/local/GSCLIB045_Fall2024_SymbolwithVDDVSS/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_all_v4.4/gsclib045/lef/gsclib045_multibitsDFF.lef

}
set init_verilog /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/InputFiles/nbit_stack_map.v
set init_mmmc_file /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/InputFiles/nbit_stack_map.view
set init_pwr_net VDD
set init_gnd_net VSS
init_design

# sanity check for UPF, SDC (timing)
checkDesign -all > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/Preplace/ChkDsgnlafterinit.rpt

group_path -name r2r -from [all_registers] -to [all_register]
group_path -name r2o -from [all_registers] -to [all_outputs]
group_path -name i2r -from [all_inputs] -to [all_registers]
group_path -name i2o -from [all_inputs] -to [all_outputs]

timeDesign -prePlace -outDir /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/Preplace/TimingReport.rpt
report_area > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/Preplace/PDArea.rpt 
report_power > /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/OutputFiles/Preplace/PDPower.rpt

# Setting the core area aspect ratio, gsclib045site varies based on technology
floorPlan -site CoreSite -r 0.924324324324 0.493243 4.0 4.04 4.0 4.04

#DO IO PLACEMENT => loadIoFile
loadIoFile /home/shivansa/CUSTOM-CIRCUIT-DESIGN/PROJECT_shivansa/Innovus/Run2/nbit_stack.save.io


