
//input ports
add mapped point clk clk -type PI PI
add mapped point reset reset -type PI PI
add mapped point push push -type PI PI
add mapped point pop pop -type PI PI
add mapped point data_in[3] data_in[3] -type PI PI
add mapped point data_in[2] data_in[2] -type PI PI
add mapped point data_in[1] data_in[1] -type PI PI
add mapped point data_in[0] data_in[0] -type PI PI
add mapped point test_mode test_mode -type PI PI
add mapped point scan_in scan_in -type PI PI

//output ports
add mapped point data_out[3] data_out[3] -type PO PO
add mapped point data_out[2] data_out[2] -type PO PO
add mapped point data_out[1] data_out[1] -type PO PO
add mapped point data_out[0] data_out[0] -type PO PO
add mapped point full full -type PO PO
add mapped point null null -type PO PO
add mapped point scan_out scan_out -type PO PO

//inout ports




//Sequential Pins
add mapped point data_out[0]/q data_out_reg[0]/Q -type DFF DFF
add mapped point data_out[1]/q data_out_reg[1]/Q -type DFF DFF
add mapped point data_out[2]/q data_out_reg[2]/Q -type DFF DFF
add mapped point data_out[3]/q data_out_reg[3]/Q -type DFF DFF
add mapped point memory[0][0]/q memory_reg[0][0]/Q -type DFF DFF
add mapped point memory[0][1]/q memory_reg[0][1]/Q -type DFF DFF
add mapped point memory[0][2]/q memory_reg[0][2]/Q -type DFF DFF
add mapped point memory[0][3]/q memory_reg[0][3]/Q -type DFF DFF
add mapped point memory[1][0]/q memory_reg[1][0]/Q -type DFF DFF
add mapped point memory[1][1]/q memory_reg[1][1]/Q -type DFF DFF
add mapped point memory[1][2]/q memory_reg[1][2]/Q -type DFF DFF
add mapped point memory[1][3]/q memory_reg[1][3]/Q -type DFF DFF
add mapped point memory[2][0]/q memory_reg[2][0]/Q -type DFF DFF
add mapped point memory[2][1]/q memory_reg[2][1]/Q -type DFF DFF
add mapped point memory[2][2]/q memory_reg[2][2]/Q -type DFF DFF
add mapped point memory[2][3]/q memory_reg[2][3]/Q -type DFF DFF
add mapped point memory[3][0]/q memory_reg[3][0]/Q -type DFF DFF
add mapped point memory[3][1]/q memory_reg[3][1]/Q -type DFF DFF
add mapped point memory[3][2]/q memory_reg[3][2]/Q -type DFF DFF
add mapped point memory[3][3]/q memory_reg[3][3]/Q -type DFF DFF
add mapped point memory[4][0]/q memory_reg[4][0]/Q -type DFF DFF
add mapped point memory[4][1]/q memory_reg[4][1]/Q -type DFF DFF
add mapped point memory[4][2]/q memory_reg[4][2]/Q -type DFF DFF
add mapped point memory[4][3]/q memory_reg[4][3]/Q -type DFF DFF
add mapped point memory[5][0]/q memory_reg[5][0]/Q -type DFF DFF
add mapped point memory[5][1]/q memory_reg[5][1]/Q -type DFF DFF
add mapped point memory[5][2]/q memory_reg[5][2]/Q -type DFF DFF
add mapped point memory[5][3]/q memory_reg[5][3]/Q -type DFF DFF
add mapped point memory[6][0]/q memory_reg[6][0]/Q -type DFF DFF
add mapped point memory[6][1]/q memory_reg[6][1]/Q -type DFF DFF
add mapped point memory[6][2]/q memory_reg[6][2]/Q -type DFF DFF
add mapped point memory[6][3]/q memory_reg[6][3]/Q -type DFF DFF
add mapped point memory[7][0]/q memory_reg[7][0]/Q -type DFF DFF
add mapped point memory[7][1]/q memory_reg[7][1]/Q -type DFF DFF
add mapped point memory[7][2]/q memory_reg[7][2]/Q -type DFF DFF
add mapped point memory[7][3]/q memory_reg[7][3]/Q -type DFF DFF
add mapped point memory[8][0]/q memory_reg[8][0]/Q -type DFF DFF
add mapped point memory[8][1]/q memory_reg[8][1]/Q -type DFF DFF
add mapped point memory[8][2]/q memory_reg[8][2]/Q -type DFF DFF
add mapped point memory[8][3]/q memory_reg[8][3]/Q -type DFF DFF
add mapped point memory[9][0]/q memory_reg[9][0]/Q -type DFF DFF
add mapped point memory[9][1]/q memory_reg[9][1]/Q -type DFF DFF
add mapped point memory[9][2]/q memory_reg[9][2]/Q -type DFF DFF
add mapped point memory[9][3]/q memory_reg[9][3]/Q -type DFF DFF
add mapped point memory[10][0]/q memory_reg[10][0]/Q -type DFF DFF
add mapped point memory[10][1]/q memory_reg[10][1]/Q -type DFF DFF
add mapped point memory[10][2]/q memory_reg[10][2]/Q -type DFF DFF
add mapped point memory[10][3]/q memory_reg[10][3]/Q -type DFF DFF
add mapped point memory[11][0]/q memory_reg[11][0]/Q -type DFF DFF
add mapped point memory[11][1]/q memory_reg[11][1]/Q -type DFF DFF
add mapped point memory[11][2]/q memory_reg[11][2]/Q -type DFF DFF
add mapped point memory[11][3]/q memory_reg[11][3]/Q -type DFF DFF
add mapped point memory[12][0]/q memory_reg[12][0]/Q -type DFF DFF
add mapped point memory[12][1]/q memory_reg[12][1]/Q -type DFF DFF
add mapped point memory[12][2]/q memory_reg[12][2]/Q -type DFF DFF
add mapped point memory[12][3]/q memory_reg[12][3]/Q -type DFF DFF
add mapped point memory[13][0]/q memory_reg[13][0]/Q -type DFF DFF
add mapped point memory[13][1]/q memory_reg[13][1]/Q -type DFF DFF
add mapped point memory[13][2]/q memory_reg[13][2]/Q -type DFF DFF
add mapped point memory[13][3]/q memory_reg[13][3]/Q -type DFF DFF
add mapped point memory[14][0]/q memory_reg[14][0]/Q -type DFF DFF
add mapped point memory[14][1]/q memory_reg[14][1]/Q -type DFF DFF
add mapped point memory[14][2]/q memory_reg[14][2]/Q -type DFF DFF
add mapped point memory[14][3]/q memory_reg[14][3]/Q -type DFF DFF
add mapped point memory[15][0]/q memory_reg[15][0]/Q -type DFF DFF
add mapped point memory[15][1]/q memory_reg[15][1]/Q -type DFF DFF
add mapped point memory[15][2]/q memory_reg[15][2]/Q -type DFF DFF
add mapped point memory[15][3]/q memory_reg[15][3]/Q -type DFF DFF
add mapped point scan_reg_data_out[0]/q scan_reg_data_out_reg[0]/Q -type DFF DFF
add mapped point scan_reg_data_out[1]/q scan_reg_data_out_reg[1]/Q -type DFF DFF
add mapped point scan_reg_data_out[2]/q scan_reg_data_out_reg[2]/Q -type DFF DFF
add mapped point scan_reg_data_out[3]/q scan_reg_data_out_reg[3]/Q -type DFF DFF
add mapped point sp[0]/q sp_reg[0]/Q -type DFF DFF
add mapped point sp[1]/q sp_reg[1]/Q -type DFF DFF
add mapped point sp[2]/q sp_reg[2]/Q -type DFF DFF
add mapped point sp[3]/q sp_reg[3]/Q -type DFF DFF
add mapped point sp[4]/q sp_reg[4]/Q -type DFF DFF
add mapped point sp[5]/q sp_reg[5]/Q -type DFF DFF
add mapped point sp[6]/q sp_reg[6]/Q -type DFF DFF
add mapped point sp[7]/q sp_reg[7]/Q -type DFF DFF
add mapped point sp[8]/q sp_reg[8]/Q -type DFF DFF
add mapped point sp[9]/q sp_reg[9]/Q -type DFF DFF
add mapped point sp[10]/q sp_reg[10]/Q -type DFF DFF
add mapped point sp[11]/q sp_reg[11]/Q -type DFF DFF
add mapped point sp[12]/q sp_reg[12]/Q -type DFF DFF
add mapped point sp[13]/q sp_reg[13]/Q -type DFF DFF
add mapped point sp[14]/q sp_reg[14]/Q -type DFF DFF
add mapped point sp[15]/q sp_reg[15]/Q -type DFF DFF
add mapped point sp[16]/q sp_reg[16]/Q -type DFF DFF
add mapped point sp[17]/q sp_reg[17]/Q -type DFF DFF
add mapped point sp[18]/q sp_reg[18]/Q -type DFF DFF
add mapped point sp[19]/q sp_reg[19]/Q -type DFF DFF
add mapped point sp[20]/q sp_reg[20]/Q -type DFF DFF
add mapped point sp[21]/q sp_reg[21]/Q -type DFF DFF
add mapped point sp[22]/q sp_reg[22]/Q -type DFF DFF
add mapped point sp[23]/q sp_reg[23]/Q -type DFF DFF
add mapped point sp[24]/q sp_reg[24]/Q -type DFF DFF
add mapped point sp[25]/q sp_reg[25]/Q -type DFF DFF
add mapped point sp[26]/q sp_reg[26]/Q -type DFF DFF
add mapped point sp[27]/q sp_reg[27]/Q -type DFF DFF
add mapped point sp[28]/q sp_reg[28]/Q -type DFF DFF
add mapped point sp[29]/q sp_reg[29]/Q -type DFF DFF
add mapped point sp[30]/q sp_reg[30]/Q -type DFF DFF
add mapped point sp[31]/q sp_reg[31]/Q -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
