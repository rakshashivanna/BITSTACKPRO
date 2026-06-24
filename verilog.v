`timescale 1ns / 1ps
module nbit_stack #(
    parameter WIDTH = 4,   // Width of data (4 bits)
    parameter DEPTH = 16    // Depth of stack 
)(
    input wire clk,
    input wire reset,
    input wire push,
    input wire pop,
    input wire [WIDTH-1:0] data_in,
    output reg [WIDTH-1:0] data_out,
    output wire full,
    output wire null,

    // Test mode signals (for scan chain)
    input wire test_mode,       // Test mode control
    input wire scan_in,         // Input for scan chain
    output wire scan_out        // Output for scan chain
);

    // Memory to store data in the stack
    reg [WIDTH-1:0] memory [0:DEPTH-1];  // Stack with DEPTH elements, each WIDTH bits wide
    integer sp = 0;  // Stack pointer

    // Full and null signals based on the stack pointer
    assign full = (sp == DEPTH);  // The stack is full when sp == DEPTH
    assign null = (sp == 0);     // The stack is empty when sp == 0

    // Scan registers for test mode
    reg [WIDTH-1:0] scan_reg_data_out;   // Data to shift out in test mode
    reg [WIDTH-1:0] scan_reg_sp;         // Stack pointer to shift out in test mode

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            sp <= 0;  // Reset the stack pointer to 0 (empty stack)
            data_out <= 0;  // Reset data_out
            scan_reg_sp <= 0; // Initialize scan register stack pointer to 0
            scan_reg_data_out <= 0; // Initialize scan register data to 0
        end else if (!test_mode) begin
            // Normal stack operations (push and pop)
            if (push && !full) begin
                memory[sp] <= data_in;  // Push data into the stack
                sp <= sp + 1;            // Increment stack pointer
            end
            if (pop && !null) begin
                data_out <= memory[sp-1]; // Pop data from the stack
                sp <= sp - 1;            // Decrement stack pointer
            end
        end else begin
            // Test Mode (scan mode)
            // Shift stack pointer and data in scan chain
            scan_reg_sp <= {scan_reg_sp[WIDTH-2:0], scan_in};  // Shift stack pointer in scan chain
            scan_reg_data_out <= {scan_reg_data_out[WIDTH-2:0], scan_in};  // Shift data in scan chain
            data_out <= scan_reg_data_out;  // Output data from scan chain
        end
    end

    // Scan Chain Output (only in test mode)
    assign scan_out = (test_mode) ? scan_reg_sp[0] : 1'b1; // Stack pointer LSB or 1 in normal mode

    // Trigger an error message when the stack is full or null
    always @(posedge clk) begin
        if (full && push) begin
            $display("ERROR: Stack is full at time %t", $time);
            $stop;  // Stop the simulation 
        end
        if (null && pop) begin
            $display("ERROR: Stack is empty at time %t", $time);
            $stop;  // Stop the simulation 
        end
    end

endmodule

