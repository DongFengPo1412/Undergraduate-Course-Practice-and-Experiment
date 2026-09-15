// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Sat Jan 20 14:40:06 2018
// Host        : DESKTOP-H9U7CRU running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {d:/AR7TEST/DAC Test/DAC
//               Test.srcs/sources_1/ip/dds_compiler_1/dds_compiler_1_sim_netlist.v}
// Design      : dds_compiler_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tftg256-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dds_compiler_1,dds_compiler_v6_0_15,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dds_compiler_v6_0_15,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module dds_compiler_1
   (aclk,
    m_axis_data_tvalid,
    m_axis_data_tdata);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 aclk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME aclk_intf, ASSOCIATED_BUSIF M_AXIS_PHASE:S_AXIS_CONFIG:M_AXIS_DATA:S_AXIS_PHASE, ASSOCIATED_RESET aresetn, ASSOCIATED_CLKEN aclken, FREQ_HZ 100000000, PHASE 0.000" *) input aclk;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_DATA TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXIS_DATA, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef" *) output m_axis_data_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_DATA TDATA" *) output [7:0]m_axis_data_tdata;

  wire aclk;
  wire [7:0]m_axis_data_tdata;
  wire m_axis_data_tvalid;
  wire NLW_U0_debug_axi_resync_in_UNCONNECTED;
  wire NLW_U0_debug_core_nd_UNCONNECTED;
  wire NLW_U0_debug_phase_nd_UNCONNECTED;
  wire NLW_U0_event_phase_in_invalid_UNCONNECTED;
  wire NLW_U0_event_pinc_invalid_UNCONNECTED;
  wire NLW_U0_event_poff_invalid_UNCONNECTED;
  wire NLW_U0_event_s_config_tlast_missing_UNCONNECTED;
  wire NLW_U0_event_s_config_tlast_unexpected_UNCONNECTED;
  wire NLW_U0_event_s_phase_chanid_incorrect_UNCONNECTED;
  wire NLW_U0_event_s_phase_tlast_missing_UNCONNECTED;
  wire NLW_U0_event_s_phase_tlast_unexpected_UNCONNECTED;
  wire NLW_U0_m_axis_data_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_phase_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_phase_tvalid_UNCONNECTED;
  wire NLW_U0_s_axis_config_tready_UNCONNECTED;
  wire NLW_U0_s_axis_phase_tready_UNCONNECTED;
  wire [0:0]NLW_U0_debug_axi_chan_in_UNCONNECTED;
  wire [21:0]NLW_U0_debug_axi_pinc_in_UNCONNECTED;
  wire [21:0]NLW_U0_debug_axi_poff_in_UNCONNECTED;
  wire [21:0]NLW_U0_debug_phase_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_data_tuser_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_phase_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_phase_tuser_UNCONNECTED;

  (* C_ACCUMULATOR_WIDTH = "22" *) 
  (* C_AMPLITUDE = "0" *) 
  (* C_CHANNELS = "1" *) 
  (* C_CHAN_WIDTH = "1" *) 
  (* C_DEBUG_INTERFACE = "0" *) 
  (* C_HAS_ACLKEN = "0" *) 
  (* C_HAS_ARESETN = "0" *) 
  (* C_HAS_M_DATA = "1" *) 
  (* C_HAS_M_PHASE = "0" *) 
  (* C_HAS_PHASEGEN = "1" *) 
  (* C_HAS_PHASE_OUT = "0" *) 
  (* C_HAS_SINCOS = "1" *) 
  (* C_HAS_S_CONFIG = "0" *) 
  (* C_HAS_S_PHASE = "0" *) 
  (* C_HAS_TLAST = "0" *) 
  (* C_HAS_TREADY = "0" *) 
  (* C_LATENCY = "3" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MODE_OF_OPERATION = "0" *) 
  (* C_MODULUS = "9" *) 
  (* C_M_DATA_HAS_TUSER = "0" *) 
  (* C_M_DATA_TDATA_WIDTH = "8" *) 
  (* C_M_DATA_TUSER_WIDTH = "1" *) 
  (* C_M_PHASE_HAS_TUSER = "0" *) 
  (* C_M_PHASE_TDATA_WIDTH = "1" *) 
  (* C_M_PHASE_TUSER_WIDTH = "1" *) 
  (* C_NEGATIVE_COSINE = "0" *) 
  (* C_NEGATIVE_SINE = "0" *) 
  (* C_NOISE_SHAPING = "0" *) 
  (* C_OPTIMISE_GOAL = "0" *) 
  (* C_OUTPUTS_REQUIRED = "0" *) 
  (* C_OUTPUT_FORM = "0" *) 
  (* C_OUTPUT_WIDTH = "8" *) 
  (* C_PHASE_ANGLE_WIDTH = "8" *) 
  (* C_PHASE_INCREMENT = "2" *) 
  (* C_PHASE_INCREMENT_VALUE = "1010001111010111,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_PHASE_OFFSET = "0" *) 
  (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_POR_MODE = "0" *) 
  (* C_RESYNC = "0" *) 
  (* C_S_CONFIG_SYNC_MODE = "0" *) 
  (* C_S_CONFIG_TDATA_WIDTH = "1" *) 
  (* C_S_PHASE_HAS_TUSER = "0" *) 
  (* C_S_PHASE_TDATA_WIDTH = "1" *) 
  (* C_S_PHASE_TUSER_WIDTH = "1" *) 
  (* C_USE_DSP48 = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  dds_compiler_1_dds_compiler_v6_0_15 U0
       (.aclk(aclk),
        .aclken(1'b1),
        .aresetn(1'b1),
        .debug_axi_chan_in(NLW_U0_debug_axi_chan_in_UNCONNECTED[0]),
        .debug_axi_pinc_in(NLW_U0_debug_axi_pinc_in_UNCONNECTED[21:0]),
        .debug_axi_poff_in(NLW_U0_debug_axi_poff_in_UNCONNECTED[21:0]),
        .debug_axi_resync_in(NLW_U0_debug_axi_resync_in_UNCONNECTED),
        .debug_core_nd(NLW_U0_debug_core_nd_UNCONNECTED),
        .debug_phase(NLW_U0_debug_phase_UNCONNECTED[21:0]),
        .debug_phase_nd(NLW_U0_debug_phase_nd_UNCONNECTED),
        .event_phase_in_invalid(NLW_U0_event_phase_in_invalid_UNCONNECTED),
        .event_pinc_invalid(NLW_U0_event_pinc_invalid_UNCONNECTED),
        .event_poff_invalid(NLW_U0_event_poff_invalid_UNCONNECTED),
        .event_s_config_tlast_missing(NLW_U0_event_s_config_tlast_missing_UNCONNECTED),
        .event_s_config_tlast_unexpected(NLW_U0_event_s_config_tlast_unexpected_UNCONNECTED),
        .event_s_phase_chanid_incorrect(NLW_U0_event_s_phase_chanid_incorrect_UNCONNECTED),
        .event_s_phase_tlast_missing(NLW_U0_event_s_phase_tlast_missing_UNCONNECTED),
        .event_s_phase_tlast_unexpected(NLW_U0_event_s_phase_tlast_unexpected_UNCONNECTED),
        .m_axis_data_tdata(m_axis_data_tdata),
        .m_axis_data_tlast(NLW_U0_m_axis_data_tlast_UNCONNECTED),
        .m_axis_data_tready(1'b0),
        .m_axis_data_tuser(NLW_U0_m_axis_data_tuser_UNCONNECTED[0]),
        .m_axis_data_tvalid(m_axis_data_tvalid),
        .m_axis_phase_tdata(NLW_U0_m_axis_phase_tdata_UNCONNECTED[0]),
        .m_axis_phase_tlast(NLW_U0_m_axis_phase_tlast_UNCONNECTED),
        .m_axis_phase_tready(1'b0),
        .m_axis_phase_tuser(NLW_U0_m_axis_phase_tuser_UNCONNECTED[0]),
        .m_axis_phase_tvalid(NLW_U0_m_axis_phase_tvalid_UNCONNECTED),
        .s_axis_config_tdata(1'b0),
        .s_axis_config_tlast(1'b0),
        .s_axis_config_tready(NLW_U0_s_axis_config_tready_UNCONNECTED),
        .s_axis_config_tvalid(1'b0),
        .s_axis_phase_tdata(1'b0),
        .s_axis_phase_tlast(1'b0),
        .s_axis_phase_tready(NLW_U0_s_axis_phase_tready_UNCONNECTED),
        .s_axis_phase_tuser(1'b0),
        .s_axis_phase_tvalid(1'b0));
endmodule

(* C_ACCUMULATOR_WIDTH = "22" *) (* C_AMPLITUDE = "0" *) (* C_CHANNELS = "1" *) 
(* C_CHAN_WIDTH = "1" *) (* C_DEBUG_INTERFACE = "0" *) (* C_HAS_ACLKEN = "0" *) 
(* C_HAS_ARESETN = "0" *) (* C_HAS_M_DATA = "1" *) (* C_HAS_M_PHASE = "0" *) 
(* C_HAS_PHASEGEN = "1" *) (* C_HAS_PHASE_OUT = "0" *) (* C_HAS_SINCOS = "1" *) 
(* C_HAS_S_CONFIG = "0" *) (* C_HAS_S_PHASE = "0" *) (* C_HAS_TLAST = "0" *) 
(* C_HAS_TREADY = "0" *) (* C_LATENCY = "3" *) (* C_MEM_TYPE = "1" *) 
(* C_MODE_OF_OPERATION = "0" *) (* C_MODULUS = "9" *) (* C_M_DATA_HAS_TUSER = "0" *) 
(* C_M_DATA_TDATA_WIDTH = "8" *) (* C_M_DATA_TUSER_WIDTH = "1" *) (* C_M_PHASE_HAS_TUSER = "0" *) 
(* C_M_PHASE_TDATA_WIDTH = "1" *) (* C_M_PHASE_TUSER_WIDTH = "1" *) (* C_NEGATIVE_COSINE = "0" *) 
(* C_NEGATIVE_SINE = "0" *) (* C_NOISE_SHAPING = "0" *) (* C_OPTIMISE_GOAL = "0" *) 
(* C_OUTPUTS_REQUIRED = "0" *) (* C_OUTPUT_FORM = "0" *) (* C_OUTPUT_WIDTH = "8" *) 
(* C_PHASE_ANGLE_WIDTH = "8" *) (* C_PHASE_INCREMENT = "2" *) (* C_PHASE_INCREMENT_VALUE = "1010001111010111,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
(* C_PHASE_OFFSET = "0" *) (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) (* C_POR_MODE = "0" *) 
(* C_RESYNC = "0" *) (* C_S_CONFIG_SYNC_MODE = "0" *) (* C_S_CONFIG_TDATA_WIDTH = "1" *) 
(* C_S_PHASE_HAS_TUSER = "0" *) (* C_S_PHASE_TDATA_WIDTH = "1" *) (* C_S_PHASE_TUSER_WIDTH = "1" *) 
(* C_USE_DSP48 = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "dds_compiler_v6_0_15" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module dds_compiler_1_dds_compiler_v6_0_15
   (aclk,
    aclken,
    aresetn,
    s_axis_phase_tvalid,
    s_axis_phase_tready,
    s_axis_phase_tdata,
    s_axis_phase_tlast,
    s_axis_phase_tuser,
    s_axis_config_tvalid,
    s_axis_config_tready,
    s_axis_config_tdata,
    s_axis_config_tlast,
    m_axis_data_tvalid,
    m_axis_data_tready,
    m_axis_data_tdata,
    m_axis_data_tlast,
    m_axis_data_tuser,
    m_axis_phase_tvalid,
    m_axis_phase_tready,
    m_axis_phase_tdata,
    m_axis_phase_tlast,
    m_axis_phase_tuser,
    event_pinc_invalid,
    event_poff_invalid,
    event_phase_in_invalid,
    event_s_phase_tlast_missing,
    event_s_phase_tlast_unexpected,
    event_s_phase_chanid_incorrect,
    event_s_config_tlast_missing,
    event_s_config_tlast_unexpected,
    debug_axi_pinc_in,
    debug_axi_poff_in,
    debug_axi_resync_in,
    debug_axi_chan_in,
    debug_core_nd,
    debug_phase,
    debug_phase_nd);
  input aclk;
  input aclken;
  input aresetn;
  input s_axis_phase_tvalid;
  output s_axis_phase_tready;
  input [0:0]s_axis_phase_tdata;
  input s_axis_phase_tlast;
  input [0:0]s_axis_phase_tuser;
  input s_axis_config_tvalid;
  output s_axis_config_tready;
  input [0:0]s_axis_config_tdata;
  input s_axis_config_tlast;
  output m_axis_data_tvalid;
  input m_axis_data_tready;
  output [7:0]m_axis_data_tdata;
  output m_axis_data_tlast;
  output [0:0]m_axis_data_tuser;
  output m_axis_phase_tvalid;
  input m_axis_phase_tready;
  output [0:0]m_axis_phase_tdata;
  output m_axis_phase_tlast;
  output [0:0]m_axis_phase_tuser;
  output event_pinc_invalid;
  output event_poff_invalid;
  output event_phase_in_invalid;
  output event_s_phase_tlast_missing;
  output event_s_phase_tlast_unexpected;
  output event_s_phase_chanid_incorrect;
  output event_s_config_tlast_missing;
  output event_s_config_tlast_unexpected;
  output [21:0]debug_axi_pinc_in;
  output [21:0]debug_axi_poff_in;
  output debug_axi_resync_in;
  output [0:0]debug_axi_chan_in;
  output debug_core_nd;
  output [21:0]debug_phase;
  output debug_phase_nd;

  wire \<const0> ;
  wire \<const1> ;
  wire aclk;
  wire [7:0]m_axis_data_tdata;
  wire m_axis_data_tvalid;
  wire NLW_i_synth_debug_axi_resync_in_UNCONNECTED;
  wire NLW_i_synth_debug_core_nd_UNCONNECTED;
  wire NLW_i_synth_debug_phase_nd_UNCONNECTED;
  wire NLW_i_synth_event_phase_in_invalid_UNCONNECTED;
  wire NLW_i_synth_event_pinc_invalid_UNCONNECTED;
  wire NLW_i_synth_event_poff_invalid_UNCONNECTED;
  wire NLW_i_synth_event_s_config_tlast_missing_UNCONNECTED;
  wire NLW_i_synth_event_s_config_tlast_unexpected_UNCONNECTED;
  wire NLW_i_synth_event_s_phase_chanid_incorrect_UNCONNECTED;
  wire NLW_i_synth_event_s_phase_tlast_missing_UNCONNECTED;
  wire NLW_i_synth_event_s_phase_tlast_unexpected_UNCONNECTED;
  wire NLW_i_synth_m_axis_data_tlast_UNCONNECTED;
  wire NLW_i_synth_m_axis_phase_tlast_UNCONNECTED;
  wire NLW_i_synth_m_axis_phase_tvalid_UNCONNECTED;
  wire NLW_i_synth_s_axis_config_tready_UNCONNECTED;
  wire NLW_i_synth_s_axis_phase_tready_UNCONNECTED;
  wire [0:0]NLW_i_synth_debug_axi_chan_in_UNCONNECTED;
  wire [21:0]NLW_i_synth_debug_axi_pinc_in_UNCONNECTED;
  wire [21:0]NLW_i_synth_debug_axi_poff_in_UNCONNECTED;
  wire [21:0]NLW_i_synth_debug_phase_UNCONNECTED;
  wire [0:0]NLW_i_synth_m_axis_data_tuser_UNCONNECTED;
  wire [0:0]NLW_i_synth_m_axis_phase_tdata_UNCONNECTED;
  wire [0:0]NLW_i_synth_m_axis_phase_tuser_UNCONNECTED;

  assign debug_axi_chan_in[0] = \<const0> ;
  assign debug_axi_pinc_in[21] = \<const0> ;
  assign debug_axi_pinc_in[20] = \<const0> ;
  assign debug_axi_pinc_in[19] = \<const0> ;
  assign debug_axi_pinc_in[18] = \<const0> ;
  assign debug_axi_pinc_in[17] = \<const0> ;
  assign debug_axi_pinc_in[16] = \<const0> ;
  assign debug_axi_pinc_in[15] = \<const0> ;
  assign debug_axi_pinc_in[14] = \<const0> ;
  assign debug_axi_pinc_in[13] = \<const0> ;
  assign debug_axi_pinc_in[12] = \<const0> ;
  assign debug_axi_pinc_in[11] = \<const0> ;
  assign debug_axi_pinc_in[10] = \<const0> ;
  assign debug_axi_pinc_in[9] = \<const0> ;
  assign debug_axi_pinc_in[8] = \<const0> ;
  assign debug_axi_pinc_in[7] = \<const0> ;
  assign debug_axi_pinc_in[6] = \<const0> ;
  assign debug_axi_pinc_in[5] = \<const0> ;
  assign debug_axi_pinc_in[4] = \<const0> ;
  assign debug_axi_pinc_in[3] = \<const0> ;
  assign debug_axi_pinc_in[2] = \<const0> ;
  assign debug_axi_pinc_in[1] = \<const0> ;
  assign debug_axi_pinc_in[0] = \<const0> ;
  assign debug_axi_poff_in[21] = \<const0> ;
  assign debug_axi_poff_in[20] = \<const0> ;
  assign debug_axi_poff_in[19] = \<const0> ;
  assign debug_axi_poff_in[18] = \<const0> ;
  assign debug_axi_poff_in[17] = \<const0> ;
  assign debug_axi_poff_in[16] = \<const0> ;
  assign debug_axi_poff_in[15] = \<const0> ;
  assign debug_axi_poff_in[14] = \<const0> ;
  assign debug_axi_poff_in[13] = \<const0> ;
  assign debug_axi_poff_in[12] = \<const0> ;
  assign debug_axi_poff_in[11] = \<const0> ;
  assign debug_axi_poff_in[10] = \<const0> ;
  assign debug_axi_poff_in[9] = \<const0> ;
  assign debug_axi_poff_in[8] = \<const0> ;
  assign debug_axi_poff_in[7] = \<const0> ;
  assign debug_axi_poff_in[6] = \<const0> ;
  assign debug_axi_poff_in[5] = \<const0> ;
  assign debug_axi_poff_in[4] = \<const0> ;
  assign debug_axi_poff_in[3] = \<const0> ;
  assign debug_axi_poff_in[2] = \<const0> ;
  assign debug_axi_poff_in[1] = \<const0> ;
  assign debug_axi_poff_in[0] = \<const0> ;
  assign debug_axi_resync_in = \<const0> ;
  assign debug_core_nd = \<const0> ;
  assign debug_phase[21] = \<const0> ;
  assign debug_phase[20] = \<const0> ;
  assign debug_phase[19] = \<const0> ;
  assign debug_phase[18] = \<const0> ;
  assign debug_phase[17] = \<const0> ;
  assign debug_phase[16] = \<const0> ;
  assign debug_phase[15] = \<const0> ;
  assign debug_phase[14] = \<const0> ;
  assign debug_phase[13] = \<const0> ;
  assign debug_phase[12] = \<const0> ;
  assign debug_phase[11] = \<const0> ;
  assign debug_phase[10] = \<const0> ;
  assign debug_phase[9] = \<const0> ;
  assign debug_phase[8] = \<const0> ;
  assign debug_phase[7] = \<const0> ;
  assign debug_phase[6] = \<const0> ;
  assign debug_phase[5] = \<const0> ;
  assign debug_phase[4] = \<const0> ;
  assign debug_phase[3] = \<const0> ;
  assign debug_phase[2] = \<const0> ;
  assign debug_phase[1] = \<const0> ;
  assign debug_phase[0] = \<const0> ;
  assign debug_phase_nd = \<const0> ;
  assign event_phase_in_invalid = \<const0> ;
  assign event_pinc_invalid = \<const0> ;
  assign event_poff_invalid = \<const0> ;
  assign event_s_config_tlast_missing = \<const0> ;
  assign event_s_config_tlast_unexpected = \<const0> ;
  assign event_s_phase_chanid_incorrect = \<const0> ;
  assign event_s_phase_tlast_missing = \<const0> ;
  assign event_s_phase_tlast_unexpected = \<const0> ;
  assign m_axis_data_tlast = \<const0> ;
  assign m_axis_data_tuser[0] = \<const0> ;
  assign m_axis_phase_tdata[0] = \<const0> ;
  assign m_axis_phase_tlast = \<const0> ;
  assign m_axis_phase_tuser[0] = \<const0> ;
  assign m_axis_phase_tvalid = \<const0> ;
  assign s_axis_config_tready = \<const1> ;
  assign s_axis_phase_tready = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* C_ACCUMULATOR_WIDTH = "22" *) 
  (* C_AMPLITUDE = "0" *) 
  (* C_CHANNELS = "1" *) 
  (* C_CHAN_WIDTH = "1" *) 
  (* C_DEBUG_INTERFACE = "0" *) 
  (* C_HAS_ACLKEN = "0" *) 
  (* C_HAS_ARESETN = "0" *) 
  (* C_HAS_M_DATA = "1" *) 
  (* C_HAS_M_PHASE = "0" *) 
  (* C_HAS_PHASEGEN = "1" *) 
  (* C_HAS_PHASE_OUT = "0" *) 
  (* C_HAS_SINCOS = "1" *) 
  (* C_HAS_S_CONFIG = "0" *) 
  (* C_HAS_S_PHASE = "0" *) 
  (* C_HAS_TLAST = "0" *) 
  (* C_HAS_TREADY = "0" *) 
  (* C_LATENCY = "3" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MODE_OF_OPERATION = "0" *) 
  (* C_MODULUS = "9" *) 
  (* C_M_DATA_HAS_TUSER = "0" *) 
  (* C_M_DATA_TDATA_WIDTH = "8" *) 
  (* C_M_DATA_TUSER_WIDTH = "1" *) 
  (* C_M_PHASE_HAS_TUSER = "0" *) 
  (* C_M_PHASE_TDATA_WIDTH = "1" *) 
  (* C_M_PHASE_TUSER_WIDTH = "1" *) 
  (* C_NEGATIVE_COSINE = "0" *) 
  (* C_NEGATIVE_SINE = "0" *) 
  (* C_NOISE_SHAPING = "0" *) 
  (* C_OPTIMISE_GOAL = "0" *) 
  (* C_OUTPUTS_REQUIRED = "0" *) 
  (* C_OUTPUT_FORM = "0" *) 
  (* C_OUTPUT_WIDTH = "8" *) 
  (* C_PHASE_ANGLE_WIDTH = "8" *) 
  (* C_PHASE_INCREMENT = "2" *) 
  (* C_PHASE_INCREMENT_VALUE = "1010001111010111,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_PHASE_OFFSET = "0" *) 
  (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_POR_MODE = "0" *) 
  (* C_RESYNC = "0" *) 
  (* C_S_CONFIG_SYNC_MODE = "0" *) 
  (* C_S_CONFIG_TDATA_WIDTH = "1" *) 
  (* C_S_PHASE_HAS_TUSER = "0" *) 
  (* C_S_PHASE_TDATA_WIDTH = "1" *) 
  (* C_S_PHASE_TUSER_WIDTH = "1" *) 
  (* C_USE_DSP48 = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  dds_compiler_1_dds_compiler_v6_0_15_viv i_synth
       (.aclk(aclk),
        .aclken(1'b0),
        .aresetn(1'b0),
        .debug_axi_chan_in(NLW_i_synth_debug_axi_chan_in_UNCONNECTED[0]),
        .debug_axi_pinc_in(NLW_i_synth_debug_axi_pinc_in_UNCONNECTED[21:0]),
        .debug_axi_poff_in(NLW_i_synth_debug_axi_poff_in_UNCONNECTED[21:0]),
        .debug_axi_resync_in(NLW_i_synth_debug_axi_resync_in_UNCONNECTED),
        .debug_core_nd(NLW_i_synth_debug_core_nd_UNCONNECTED),
        .debug_phase(NLW_i_synth_debug_phase_UNCONNECTED[21:0]),
        .debug_phase_nd(NLW_i_synth_debug_phase_nd_UNCONNECTED),
        .event_phase_in_invalid(NLW_i_synth_event_phase_in_invalid_UNCONNECTED),
        .event_pinc_invalid(NLW_i_synth_event_pinc_invalid_UNCONNECTED),
        .event_poff_invalid(NLW_i_synth_event_poff_invalid_UNCONNECTED),
        .event_s_config_tlast_missing(NLW_i_synth_event_s_config_tlast_missing_UNCONNECTED),
        .event_s_config_tlast_unexpected(NLW_i_synth_event_s_config_tlast_unexpected_UNCONNECTED),
        .event_s_phase_chanid_incorrect(NLW_i_synth_event_s_phase_chanid_incorrect_UNCONNECTED),
        .event_s_phase_tlast_missing(NLW_i_synth_event_s_phase_tlast_missing_UNCONNECTED),
        .event_s_phase_tlast_unexpected(NLW_i_synth_event_s_phase_tlast_unexpected_UNCONNECTED),
        .m_axis_data_tdata(m_axis_data_tdata),
        .m_axis_data_tlast(NLW_i_synth_m_axis_data_tlast_UNCONNECTED),
        .m_axis_data_tready(1'b0),
        .m_axis_data_tuser(NLW_i_synth_m_axis_data_tuser_UNCONNECTED[0]),
        .m_axis_data_tvalid(m_axis_data_tvalid),
        .m_axis_phase_tdata(NLW_i_synth_m_axis_phase_tdata_UNCONNECTED[0]),
        .m_axis_phase_tlast(NLW_i_synth_m_axis_phase_tlast_UNCONNECTED),
        .m_axis_phase_tready(1'b0),
        .m_axis_phase_tuser(NLW_i_synth_m_axis_phase_tuser_UNCONNECTED[0]),
        .m_axis_phase_tvalid(NLW_i_synth_m_axis_phase_tvalid_UNCONNECTED),
        .s_axis_config_tdata(1'b0),
        .s_axis_config_tlast(1'b0),
        .s_axis_config_tready(NLW_i_synth_s_axis_config_tready_UNCONNECTED),
        .s_axis_config_tvalid(1'b0),
        .s_axis_phase_tdata(1'b0),
        .s_axis_phase_tlast(1'b0),
        .s_axis_phase_tready(NLW_i_synth_s_axis_phase_tready_UNCONNECTED),
        .s_axis_phase_tuser(1'b0),
        .s_axis_phase_tvalid(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
R7Su66EFP3j7HdSRwT0ufavHZ21RJuR7GdMa5N1qrx05vZRLzNZT/TrlIe3c6DsFCenpiZCD2noZ
QAoR4Rt+mA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
CMEJWch+GbdZ7DIDA14J94rfET0XyGxfytAfvkgCwK+buy8C6yPuTyczckBiUAmLYwq3N0YLZZjn
gsyXn6e48OgTdLuKlj0b1I+R+nOfWP/cHyUHpk91Upohu0q4i+T1Z7YlZ2KevK2O/yOn6S3pNXlM
CA1hIxQSQLLJQcJjXBI=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
IDWChuOHJQwebqfYcE88tSCCIBnxLv1aLHU6OnUVlxJuAYH1Wr0uPmJkkVb7CXm2iZXQx/jo6XaT
TumCKxTZIL3ET0tLNKmedouL0GaXfUzXVCSzEoTXiWf2gNPQB6+v0sryyUdggn9CbJglWE9UkluW
rCPI7feYIVKqODl/+/XlmC+0ONTNrMlZjktMivGmmfgFiOaVxlj7ZiVhYDRk2pmK7N0SbS8Yhqtp
tu4XIZyivSAfozOEYzRk3aC5YLPqYEODky8fadXC0TifmV1/9ihpE9MdNVbsAfiU6jAuYaPtixy1
eWfPyz8p770Y8aO4Ymmlv6Cov/zwD1Zr7rP3ng==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
D4tWnXwgYbtbYBATOz3rKT5u236p/210UA0/0NawJUvRuLLRIOY863EXCqmoNKd3cdAJGfRGO/fA
mX3MQnn8fORd5NV0Drcjtq7LVURk4LrUaNUiho8FoaaKgENLoHWz5zN6jL9cfE19cPf5q6X+HSoS
vhMpVULwvEeloyESsidHnjc6Leo2s08QmBHWIJ4gX6Y353OK7qNS3bZaZnw5UMLbMBvsopLT0HMU
QgsF83OsAoA/LETx2kFpFT62GHW7Xr0WQupO68ddkWdncI1pQ1ry5DiS4IAcjHmDYTyo542wmUO5
kUoT65xdo6CgR0mBfndpvcIfOPFrzBLsA3X/8A==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TYxxwxeYhuHcZvmvIoDp6PM6jwmqvK/EOpQJuzYEJwksrBgERfR0MxeEKttmbgtW3IAljWYtUY74
488K1yihiHHoprJ33R35ZxUze+TipXVo/GLAiCGp6aVvDPTACRhogMPXLJypmeRU1yO394pPbgS6
wC0P27Oimz3cJkJrwIhG7UV3FbbvFXVTh6Lp9wme459SE3zFnKsJYjUpffIirIVsuN+DETk1csWY
DA9UX9JySwER9tWjcgC7RtzEV1hjIG9WuwYm3zkOqr4FZ/dkK9PLm51AgWpaMXgB/7ws+/P8fkKm
QNdT6izgEuqxwJScjWNpExqD7cRIM9y2FibGuA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Y058Y7qqyKaMCwzJEnFzRJA1mSsdLWRJPV8jeagM24nQRyHL6Of41SQjwa7S6UfHPjaxh3kStD/R
iqFSj7BMeRnjDwKkql9QbQCQ1AEtG8kKMw6X1Sw8vQdkSSWaY8A0qHxlAj9yFFRWps0IUCT20y4r
a1FWV0KSxSpJrwls87U=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BkCcTwW7IOFCvnzvt27BUy3KHmy1QJwSQsGYOAQoWdJnp7bpQCB3MV/YrDTHZ6GeuEjTv+Y4jK1+
AUi7wPge8Y2zeEpQSTFjwsHrg0a6KicpWuoUxj9ZsRjp7lihT95V1Q0eAIg8YhlL39mGtTcQ5Vdp
7z8wKvjx++phq/T2pWg3qojhz3yoqaCG4uvKWuNn2R3f0YfPc7K1qQ8cRTBYuIfje99ZizVelHfv
/gPaALzJb7mtbJVe83NohlYy8IyL0cxXXClT+sW1XPYiN9k5NbywIoRmRDobstBVd3O4Ukd5mT3V
p/qjzuZHyCC/I/jJRQFyZvHI5rcbT8On+yp5MA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
HeEoW7FYh2MmxEpW7024zk1TtAQuGBe3aIOpojDgXmKlVnGiEo30jJTI99lM/Tjrwr273ynR5+BQ
6eOCOcnUd42QnUKuMmFee/o4yS51Bk3nyJPyz+GMNN1tALcTwW94S+zU812B88cKTFJD2HKsC8a8
+iqccu7pXn3hTmxRDTJjAx2MDKadFofcVpfAkI/fNijwjqolhsYVT95qBWLUl3V7OWkzAuisRxtf
LtbvKuXYv9/pUjSm/0wAUTW/5QaEnjMsCVJwVYcLYeqLe98Vz55RHVFHTKgNMsYsgn6jBlCh/Zjt
r97+DCXVeKWOOlWb3q7+66QQtsLuvBjEgvHpug==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
5VN4ftDV4/V0M+Ewnit4rTqCDjTq+O34o9sV9pwMXgWKxpCohOHuJ/qGgi1V5elD+QPvYNyDQcVt
mUMTtahtMzTzw2pjusRG2OmCHdOV94T5qkfDqclph2My4TsRL20wyS6sL8mSxzE5X3VlFMDoVpew
uqiEgGL6hH9+zZ3w83udsytsCU6lj8XrPN7/LYxMxPs4TQZGIkqPSr75lvo4Rnic33/Z71P3LWNc
p/pDED6nVRhNyloCyj7bf/3Xg3kn62zn/hjlxk2f3bgYBMca1mP61NeRM/HwEK2XOpanajdMQMwO
jaGfwYG/8hmXPIYXT4CrGR1ZpeyKXg4EZJscLg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 30672)
`pragma protect data_block
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
GK8SqIkA
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
