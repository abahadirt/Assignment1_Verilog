module counter_d(input reset, input clk, input mode, output [2:0] count);

    // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!
    wire D0,D1,D2;

    
    or o1(D0,( (~count[0]) & ~mode) , (  ( (count[2] & count[1]) | ( ~count[2] & ~count[1]) )  & mode ));
    
    or o2(D1, ((~count[1]|~count[0]) & (count[1]|count[0])) & ~mode, ((~count[2] & count[0]) | ( count[1] & ~count[0]))  & mode);
    
    or o3(D2, ( (~count[2]|~count[1]|~count[0]) & (count[2]|count[1]) & (count[2]|count[0]) ) & ~mode,  ((count[2] & count[1]) | (count[2] & ~count[1] & count[0]) | ( ~count[2] & count[1] & ~count[0]))  & mode);
    
    
    
    
    
    dff_sync_res flip1 ( .D (D0 ) , .clk(clk) , .sync_reset(reset) , .Q(count[0]));

    dff_sync_res flip2 ( .D (D1) , .clk(clk) , .sync_reset(reset) , .Q(count[1]));

    dff_sync_res flip3 ( .D (D2) , .clk(clk) , .sync_reset(reset) , .Q(count[2]));
endmodule