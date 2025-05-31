`timescale 1ns / 1ps

module tb_fifo_middle;

    reg clk, rst, en;
    reg [7:0] wdata;
    wire [7:0] rdata;
    wire [3:0] waddr, raddr;

    fifo_middle dut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .wdata(wdata),
        .rdata(rdata),
        .waddr(waddr),
        .raddr(raddr)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk; // 10ns clock

    integer i;

    initial begin
        $dumpfile("fifo_middle.vcd");
        $dumpvars(0, tb_fifo_middle);

        // Reset
        rst = 1;
        en = 0;
        wdata = 0;
        #20;
        rst = 0;

        // Write values 2, 4, ..., 20 (10 values)
        for (i = 1; i < 10; i = i + 1) begin
            @(posedge clk);
            en = 1;
            wdata = (i * i);
            $display("WRITE: waddr=%0d, wdata=%0d", waddr, wdata);
        end

        // Stop writing
        @(posedge clk);
        en = 0;

        #40;

        // Read 10 values
        for (i = 1; i < 10; i = i + 1) begin
            @(posedge clk);
            en = 0;
            @(negedge clk);
            $display("READ : raddr=%0d, rdata=%0d", raddr, rdata);
        end

        #20;
        $finish;
    end

endmodule
