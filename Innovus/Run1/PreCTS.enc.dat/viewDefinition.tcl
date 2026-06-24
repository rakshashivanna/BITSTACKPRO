if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name nbit_stack_slowLib\
   -timing\
    [list ${::IMEX::libVar}/mmmc/slow_vdd1v2_basicCells.lib]
create_rc_corner -name nbit_stack_rc_corner\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -qx_tech_file ${::IMEX::libVar}/mmmc/nbit_stack_rc_corner/gpdk045.tch
create_delay_corner -name nbit_stack_delayCorner\
   -library_set nbit_stack_slowLib\
   -rc_corner nbit_stack_rc_corner
create_constraint_mode -name common\
   -sdc_files\
    [list ${::IMEX::libVar}/mmmc/nbit_stack_map.sdc]
create_analysis_view -name nbit_stack_view_setup -constraint_mode common -delay_corner nbit_stack_delayCorner
create_analysis_view -name nbit_stack_view_hold -constraint_mode common -delay_corner nbit_stack_delayCorner
set_analysis_view -setup [list nbit_stack_view_setup] -hold [list nbit_stack_view_hold]
