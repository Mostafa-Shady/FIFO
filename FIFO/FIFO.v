module FIFO #(
    parameter FIFO_WIDTH =16,
    parameter FIFO_DEPTH=512 
) (
    input [FIFO_WIDTH-1:0] din_a,
    input wen_a,ren_b,clk_a,clk_b,rst,
    output reg [FIFO_WIDTH-1:0] dout_b,
    output full,empty
);
    reg [FIFO_WIDTH-1:0] mem[FIFO_DEPTH-1:0];
    reg [$clog2(FIFO_DEPTH)-1:0] cnt_a,cnt_b;
    ////////////////////
    //write operation&Read
    ////////////////////
    always @(posedge clk_a) begin
        if (rst) begin
            cnt_a<=0;
            dout_b=0;
        end
        else  begin
            if (full==0&&wen_a==1) begin
                mem[cnt_a]=din_a;
                cnt_a<=cnt_a+1;
            end
      end
  end
        always @(posedge clk_b)begin
                   if (rst) begin
                        cnt_b<=0;
                        dout_b=0;
                    end
              else begin
                    if (empty==0&&ren_b==1) begin
                        cnt_b<=cnt_b+1;
                        dout_b<=mem[cnt_b];
                    end
                end    
            end
    assign full=((cnt_a+1)==cnt_b);
    assign empty=(cnt_a==cnt_b);
endmodule