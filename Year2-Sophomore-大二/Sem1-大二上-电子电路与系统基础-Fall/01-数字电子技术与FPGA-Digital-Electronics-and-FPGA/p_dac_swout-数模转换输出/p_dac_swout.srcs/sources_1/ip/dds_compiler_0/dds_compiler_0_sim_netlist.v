// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Sat Jan 20 14:39:29 2018
// Host        : DESKTOP-H9U7CRU running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {d:/AR7TEST/DAC Test/DAC
//               Test.srcs/sources_1/ip/dds_compiler_0/dds_compiler_0_sim_netlist.v}
// Design      : dds_compiler_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tftg256-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dds_compiler_0,dds_compiler_v6_0_15,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dds_compiler_v6_0_15,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module dds_compiler_0
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
  (* C_PHASE_INCREMENT_VALUE = "10100011110101110,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
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
  dds_compiler_0_dds_compiler_v6_0_15 U0
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
(* C_PHASE_ANGLE_WIDTH = "8" *) (* C_PHASE_INCREMENT = "2" *) (* C_PHASE_INCREMENT_VALUE = "10100011110101110,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
(* C_PHASE_OFFSET = "0" *) (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) (* C_POR_MODE = "0" *) 
(* C_RESYNC = "0" *) (* C_S_CONFIG_SYNC_MODE = "0" *) (* C_S_CONFIG_TDATA_WIDTH = "1" *) 
(* C_S_PHASE_HAS_TUSER = "0" *) (* C_S_PHASE_TDATA_WIDTH = "1" *) (* C_S_PHASE_TUSER_WIDTH = "1" *) 
(* C_USE_DSP48 = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "dds_compiler_v6_0_15" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module dds_compiler_0_dds_compiler_v6_0_15
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
  (* C_PHASE_INCREMENT_VALUE = "10100011110101110,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
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
  dds_compiler_0_dds_compiler_v6_0_15_viv i_synth
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
cXtbVVJJUhJ0Pc4w3Lv2bvigJVPkvtV0SVAlraQN+IHrUPq+ADSwMIeC13fhOvSO7pepTDom8l5i
78I4zTqFqJdjYfk5D1ljNBl071Q780N4MFmNph0+g6SNob4886X0gdioKTu/xoI8W02X2AvxuPUy
X3qaJsxVcNx169+M4lXl1mIpQHiNKaDOX8E6f7dQ/P8tgH8mZ+TqFiSUfgvbDmh67CH+W5UX/4xA
lYXxsHzgivKmK1NSBgjGShHYSBNezGE0C3610WXhmE1NbfT4admIE1QI54VR+LG1/Nj1r+4PM27A
kqdfPTIWgaw3v4Z7X8Zld4LZQcdOgJZcGCISaA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TAXko3Tzqvmws8FF37XVp63h3mjpVJ8qoZzMbtclW5HbLc1uC4vdV0BRhJkDyjA7pel4diitgr8C
p/wmj8denh6mG0u0pwW9jBl1B6WuvbVC5CvzbyPiuTIByf1EgZpMvipR38uZepYYzQCnsFihzRDH
sSCI13POOphU5hDgZOwiArW1Jw4YQRcM+FPKFSRNOiqWDovXG3+BHgymwsHkH3c2ISqedh6hMLWQ
uZibb+CIuLcRrKpvarWMd+RSp+zKG0+vR6GzoEFZQtNkU0eNMpjAk+eSVeOufEid8ZUPtAE7ai2G
50JNRXd0f8QDYOG7awH0kDHvXCRWpHk0MTg67Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 30992)
`pragma protect data_block
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
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
