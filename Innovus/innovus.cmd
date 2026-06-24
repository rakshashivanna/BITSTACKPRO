#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Sun Dec  1 20:51:34 2024                
#                                                     
#######################################################

#@(#)CDS: Innovus v21.19-s058_1 (64bit) 04/04/2024 09:59 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: NanoRoute 21.19-s058_1 NR231113-0413/21_19-UB (database version 18.20.605) {superthreading v2.17}
#@(#)CDS: AAE 21.19-s004 (64bit) 04/04/2024 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: CTE 21.19-s010_1 () Mar 27 2024 01:55:37 ( )
#@(#)CDS: SYNTECH 21.19-s002_1 () Sep  6 2023 22:17:00 ( )
#@(#)CDS: CPE v21.19-s026
#@(#)CDS: IQuantus/TQuantus 21.1.1-s966 (64bit) Wed Mar 8 10:22:20 PST 2023 (Linux 3.10.0-693.el7.x86_64)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
save_global OutputFiles/Run2_v1.globals
set init_gnd_net VSS
set init_lef_file {/opt/eda/cadence/local/GSCLIB045_Fall2024_SymbolwithVDDVSS/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_all_v4.4/gsclib045/lef/gsclib045_tech.lef /opt/eda/cadence/local/GSCLIB045_Fall2024_SymbolwithVDDVSS/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_all_v4.4/gsclib045/lef/gsclib045_macro.lef /opt/eda/cadence/local/GSCLIB045_Fall2024_SymbolwithVDDVSS/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_all_v4.4/gsclib045/lef/gsclib045_multibitsDFF.lef}
set init_verilog InputFiles/nbit_stack_map.v
set init_mmmc_file InputFiles/recognizer_map.view
set init_top_cell nbit_stack
set init_pwr_net VDD
init_design
init_design
