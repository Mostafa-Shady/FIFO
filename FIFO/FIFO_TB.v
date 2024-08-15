module FIFO_TB ();
    //Signal Declaration
    reg  [15:0] din_a;
    reg wen_a,ren_b,clk_a,clk_b,rst;
    wire [15:0] dout_b;
    wire full,empty;
    integer  k;
    //DUT Instantiation
    FIFO DUT(din_a,wen_a,ren_b,clk_a,clk_b,rst,dout_b,full,empty);
    //Clock Generation
    initial begin
        clk_a=0;
        clk_b=0;
        forever begin
            #1 clk_a=~clk_a; clk_b=~clk_b;            
        end
    end
    //Test The Stimulus
    initial begin
        rst=1;
        wen_a=0;
        ren_b=0;
        @(negedge clk_a);
        rst=0;
        wen_a=1;
        for (k =0 ;k<1000 ;k=k+1 ) begin
            din_a=$random;
            @(negedge clk_a,negedge clk_b);
        end 
        wen_a=0;
        ren_b=1;
        for (k =0 ;k<1000 ;k=k+1 ) begin
            @(negedge clk_a,negedge clk_b);
        end
        wen_a=1;
        ren_b=1;
        for (k =0 ;k<1000 ;k=k+1 ) begin
            din_a=$random;
            @(negedge clk_a,negedge clk_b);
        end
        $stop;
    end
endmodule