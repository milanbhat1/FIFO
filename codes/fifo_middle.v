module fifo_middle (
    input wire clk,
    input wire rst,
    input wire en,              // 1 = write, 0 = read
    input wire [7:0] wdata,
    output reg [7:0] rdata,
    output reg [3:0] waddr,
    output reg [3:0] raddr
);

    reg [7:0] mem [15:0];

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            waddr <= 0;
            raddr <= 0;
            rdata <= 0;
        end else begin
            if (en) begin
                // Write on en = 1
                mem[waddr] <= wdata;
                waddr <= waddr + 1;
            end else begin
                // Read on en = 0
                rdata <= mem[raddr];
                raddr <= raddr + 1;
            end
        end
    end

endmodule
