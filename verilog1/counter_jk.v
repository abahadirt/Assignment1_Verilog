module counter_jk(input reset, input clk, input mode, output [2:0] count);

    // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!
    wire D0,D1,D2;

    
    or o4(D0,( (~count[0]) & ~mode) , (  ( (count[2] & count[1]) | ( ~count[2] & ~count[1]) )  & mode ));
    
    or o5(D1, ((~count[1]|~count[0]) & (count[1]|count[0])) & ~mode, ((~count[2] & count[0]) | ( count[1] & ~count[0]))  & mode);
    
    or o6(D2, ( (~count[2]|~count[1]|~count[0]) & (count[2]|count[1]) & (count[2]|count[0]) ) & ~mode,  ((count[2] & count[1]) | (count[2] & ~count[1] & count[0]) | ( ~count[2] & count[1] & ~count[0]))  & mode);
    
    
    
    
    
    jk_sync_res flip4 ( .J (D0 ), .K (~D0 ) , .clk(clk) , .sync_reset(reset) , .Q(count[0]));

    jk_sync_res flip5 ( .J (D1), .K (~D1 ) , .clk(clk) , .sync_reset(reset) , .Q(count[1]));

    jk_sync_res flip6 ( .J (D2), .K (~D2 ) , .clk(clk) , .sync_reset(reset) , .Q(count[2]));
endmodule