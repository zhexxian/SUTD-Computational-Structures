/*
   This file was generated automatically by the Mojo IDE version B1.2.3.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] input_pin,
    output reg [3:0] output_set1,
    output reg [3:0] output_set2,
    output reg [7:0] output_set3
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_edge_detector_out;
  reg [1-1:0] M_edge_detector_in;
  edge_detector_2 edge_detector (
    .clk(clk),
    .in(M_edge_detector_in),
    .out(M_edge_detector_out)
  );
  wire [2-1:0] M_ctr_value;
  counter_3 ctr (
    .clk(clk),
    .rst(rst),
    .value(M_ctr_value)
  );
  wire [8-1:0] M_test_cases_ctr_value;
  wire [1-1:0] M_test_cases_ctr_full;
  reg [1-1:0] M_test_cases_ctr_ok;
  reg [1-1:0] M_test_cases_ctr_inc;
  special_counter_4 test_cases_ctr (
    .clk(clk),
    .rst(rst),
    .ok(M_test_cases_ctr_ok),
    .inc(M_test_cases_ctr_inc),
    .value(M_test_cases_ctr_value),
    .full(M_test_cases_ctr_full)
  );
  wire [8-1:0] M_waver_out;
  wave_5 waver (
    .clk(clk),
    .rst(rst),
    .out(M_waver_out)
  );
  
  wire [5-1:0] M_adder_out;
  reg [4-1:0] M_adder_in1;
  reg [4-1:0] M_adder_in2;
  adder4bit_6 adder (
    .in1(M_adder_in1),
    .in2(M_adder_in2),
    .out(M_adder_out)
  );
  
  wire [4-1:0] M_test_out1;
  wire [4-1:0] M_test_out2;
  reg [8-1:0] M_test_value;
  test_generator_7 test (
    .value(M_test_value),
    .out1(M_test_out1),
    .out2(M_test_out2)
  );
  
  wire [1-1:0] M_compare_out;
  reg [5-1:0] M_compare_in1;
  reg [5-1:0] M_compare_in2;
  compare_8 compare (
    .in1(M_compare_in1),
    .in2(M_compare_in2),
    .out(M_compare_out)
  );
  
  wire [7-1:0] M_sevenseg2_segs;
  reg [4-1:0] M_sevenseg2_char;
  seven_seg_9 sevenseg2 (
    .char(M_sevenseg2_char),
    .segs(M_sevenseg2_segs)
  );
  
  wire [7-1:0] M_sevenseg1_segs;
  reg [4-1:0] M_sevenseg1_char;
  seven_seg_9 sevenseg1 (
    .char(M_sevenseg1_char),
    .segs(M_sevenseg1_segs)
  );
  
  wire [7-1:0] M_sevenseg0_segs;
  reg [4-1:0] M_sevenseg0_char;
  seven_seg_9 sevenseg0 (
    .char(M_sevenseg0_char),
    .segs(M_sevenseg0_segs)
  );
  
  wire [4-1:0] M_decsplit_new_out2;
  wire [4-1:0] M_decsplit_new_out1;
  wire [4-1:0] M_decsplit_new_out0;
  reg [8-1:0] M_decsplit_new_a;
  decimal2_8bit_12 decsplit_new (
    .a(M_decsplit_new_a),
    .out2(M_decsplit_new_out2),
    .out1(M_decsplit_new_out1),
    .out0(M_decsplit_new_out0)
  );
  
  always @* begin
    M_decsplit_new_a = M_test_cases_ctr_value;
    M_sevenseg2_char = M_decsplit_new_out2;
    M_sevenseg1_char = M_decsplit_new_out1;
    M_sevenseg0_char = M_decsplit_new_out0;
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    M_edge_detector_in = M_ctr_value[0+0-:1];
    M_test_cases_ctr_inc = M_edge_detector_out;
    M_test_value = M_test_cases_ctr_value;
    output_set1 = M_test_out1;
    output_set2 = M_test_out2;
    M_adder_in1 = M_test_out1;
    M_adder_in2 = M_test_out2;
    M_compare_in1 = M_adder_out;
    M_compare_in2 = input_pin;
    M_test_cases_ctr_ok = M_compare_out;
    if (M_compare_out == 1'h1) begin
      
      case (M_ctr_value)
        1'h0: begin
          io_seg = ~M_sevenseg0_segs;
          io_sel = 4'he;
        end
        1'h1: begin
          io_seg = ~M_sevenseg1_segs;
          io_sel = 4'hd;
        end
        2'h2: begin
          io_seg = ~M_sevenseg2_segs;
          io_sel = 4'hb;
        end
        default: begin
          io_seg = 8'hff;
          io_sel = 4'hf;
        end
      endcase
    end else begin
      io_seg = 8'hbf;
      io_sel = 4'h0;
    end
    if (M_test_cases_ctr_full == 1'h1) begin
      output_set1 = M_waver_out;
      output_set2 = M_waver_out;
      output_set3 = M_waver_out;
      M_test_cases_ctr_inc = 1'h0;
      
      case (M_ctr_value)
        1'h0: begin
          io_seg = 8'h21;
          io_sel = 4'he;
        end
        1'h1: begin
          io_seg = 8'hab;
          io_sel = 4'hd;
        end
        2'h2: begin
          io_seg = 8'h86;
          io_sel = 4'hb;
        end
        default: begin
          io_seg = 8'hff;
          io_sel = 4'hf;
        end
      endcase
    end else begin
      output_set3 = input_pin;
    end
  end
endmodule