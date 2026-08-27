module smart_dustbin (
    input  wire clk,
    input  wire reset,
    input  wire object_detected,
    input  wire full_sensor,

    output reg lid_open,
    output reg full_led
);

parameter OPEN_TIME = 5;
reg [7:0] counter;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        lid_open <= 1'b0;
        full_led <= 1'b0;
        counter  <= 8'd0;
    end
    else begin

        // Full-bin indication
        full_led <= full_sensor;

        // Open lid when object is detected
        if (object_detected && !lid_open) begin
            lid_open <= 1'b1;
            counter  <= OPEN_TIME - 1;
        end

        // Automatically close lid
        else if (lid_open) begin
            if (counter == 0) begin
                lid_open <= 1'b0;
            end
            else begin
                counter <= counter - 1'b1;
            end
        end
    end
end

endmodule