module reset_module(
						clk,rst_n,locked
);

input clk;
input locked;
output rst_n;

reg[3:0] count;
reg rst_n;

always@(posedge clk or negedge locked)
begin
	if(!locked) 
	begin
		rst_n<=0;
		count<=0;
	end
	else if(count == 5) rst_n <= 1;
	else count <= count + 1;
end


endmodule
