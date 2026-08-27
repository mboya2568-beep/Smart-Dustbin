`timescale 1ns/1ps

module smart_dustbin_tb;

reg clk;
reg reset;
reg object_detected;
reg full_sensor;

wire lid_open;
wire full_led;

smart_dustbin #(.OPEN_TIME(5)) dut (
    .clk(clk),
    .reset(reset),
    .object_detected(object_detected),
    .full_sensor(full_sensor),
    .lid_open(lid_open),
    .full_led(full_led)
);

always #5 clk = ~clk;

initial begin

    $dumpfile("smart_dustbin.vcd");
    $dumpvars(0, smart_dustbin_tb);

    clk = 0;
    reset = 1;
    object_detected = 0;
    full_sensor = 0;

    #12 reset = 0;

    // Object detected
    #10 object_detected = 1;
    #10 object_detected = 0;

    // Wait for lid to close
    #60;

    // Dustbin becomes full
    full_sensor = 1;
    #20;

    // Dustbin emptied
    full_sensor = 0;
    #20;

    $finish;
end

initial begin
    $monitor("Time=%0t | Object=%b | Full=%b | Lid=%b | Full_LED=%b",
             $time, object_detected, full_sensor,
             lid_open, full_led);
end

endmodule