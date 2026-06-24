`timescale 1ns / 1ps

module testbench;

    parameter WIDTH = 4;   // Width of the data
    parameter DEPTH = 16;  // Depth of the stack

    // Signals
    reg clk, reset, push, pop, test_mode;
    reg [WIDTH-1:0] data_in, scan_in;
    wire [WIDTH-1:0] data_out, scan_out;
    wire full, null;

    // Instantiate the stack
    nbit_stack #(.WIDTH(WIDTH), .DEPTH(DEPTH)) stack (
        .clk(clk),
        .reset(reset),
        .push(push),
        .pop(pop),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .null(null),
        .scan_in(scan_in),
        .scan_out(scan_out),
        .test_mode(test_mode)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Clock with a 10ns period
    end

    // Main forever loop for operations
    initial begin
        // Initialization
        reset = 1;
        push = 0;
        pop = 0;
        test_mode = 0;
        data_in = 4'b0000;  // Set initial data_in value to 0000
        scan_in = 4'b0000;

        // Apply reset
        #20 reset = 0;

        // Push and pop operations in parallel
        forever begin
            // Push operation for 5 cycles
            repeat (5) begin
                if (!full) begin
                    push = 1;
                    // Control the sequence of data_in values (e.g., incrementing data_in)
                    data_in = data_in + 1;  // Increment the data_in for each push
                end
                #10 push = 0;
                #10;
            end

            // Pop operation for 3-4 cycles
            repeat ($urandom_range(3, 4)) begin
                if (!null) begin
                    pop = 1;
                end
                #10 pop = 0;
                #10;
            end

            // Assign random values to scan_in during test mode
            if (test_mode) begin
                scan_in = 4'b1010;  // You can set a fixed value for scan_in in test mode
                #10;
            end

            // Randomly toggle test_mode
            if ($random % 2) begin
                test_mode = ~test_mode;
            end
        end
    end

    // Debugging output
    initial begin
        $monitor("Time: %0t | Push: %b | Pop: %b | Data In: %b | Data Out: %b | Full: %b | Null: %b | Test Mode: %b | Scan In: %b | Scan Out: %b",
                 $time, push, pop, data_in, data_out, full, null, test_mode, scan_in, scan_out);
    end
endmodule

