// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Tue Dec 26 22:08:15 2023
// Host        : JORGECASA running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               D:/P_vhdl_Vi/ADC_AFE_SERDES/ADC_AFE_SERDES.sim/sim_1/impl/timing/xsim/iserdes_1_time_impl.v
// Design      : adcClock_FclkFrm
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module IBUFDS_DIFF_OUT_UNIQ_BASE_
   (O,
    OB,
    I,
    IB);
  output O;
  output OB;
  input I;
  input IB;

  wire i;
  wire ib;
  wire o;
  wire ob;

  assign O = o;
  assign OB = ob;
  assign i = I;
  assign ib = IB;
  IBUFDS IBUFDS
       (.I(i),
        .IB(ib),
        .O(o));
  IBUFDS IBUFDS_0
       (.I(ib),
        .IB(i),
        .O(ob));
endmodule

module AdcClock
   (CLK,
    DatClk,
    AdcBitClkAlgnWrn_OBUF,
    AdcBitClkInvrld_OBUF,
    BitClkDone_OBUF,
    IntRst,
    DCLK_p_Int,
    FrmClkEna,
    RST,
    IntProceedCnt0);
  output CLK;
  output DatClk;
  output AdcBitClkAlgnWrn_OBUF;
  output AdcBitClkInvrld_OBUF;
  output BitClkDone_OBUF;
  input IntRst;
  input DCLK_p_Int;
  input FrmClkEna;
  input RST;
  input IntProceedCnt0;

  wire AdcBitClkAlgnWrn_OBUF;
  wire AdcBitClkInvrld_OBUF;
  wire BitClkDone_OBUF;
  wire CE;
  wire CLK;
  wire DCLK_p_Int;
  wire DatClk;
  wire FrmClkEna;
  wire INC;
  wire IntBitClk;
  wire IntBitClk_Ddly;
  wire [7:0]IntClkCtrlOut;
  wire IntProceedCnt0;
  wire IntRst;
  wire RST;
  wire NLW_IDELAYCTRL_inst_RDY_UNCONNECTED;
  wire [4:0]NLW_IDELAYE2_inst_ClkDiv_CNTVALUEOUT_UNCONNECTED;
  wire NLW_ISERDESE2_inst_DIVCLK_SHIFTOUT1_UNCONNECTED;
  wire NLW_ISERDESE2_inst_DIVCLK_SHIFTOUT2_UNCONNECTED;

  (* box_type = "PRIMITIVE" *) 
  BUFIO BUFIO_inst_AdcClock
       (.I(IntBitClk),
        .O(DatClk));
  (* box_type = "PRIMITIVE" *) 
  BUFR #(
    .BUFR_DIVIDE("7"),
    .SIM_DEVICE("7SERIES")) 
    BUFR_inst_IntBitClk
       (.CE(1'b1),
        .CLR(1'b0),
        .I(IntBitClk),
        .O(CLK));
  (* box_type = "PRIMITIVE" *) 
  IDELAYCTRL #(
    .SIM_DEVICE("7SERIES")) 
    IDELAYCTRL_inst
       (.RDY(NLW_IDELAYCTRL_inst_RDY_UNCONNECTED),
        .REFCLK(CLK),
        .RST(IntRst));
  (* box_type = "PRIMITIVE" *) 
  IDELAYE2 #(
    .CINVCTRL_SEL("FALSE"),
    .DELAY_SRC("IDATAIN"),
    .HIGH_PERFORMANCE_MODE("TRUE"),
    .IDELAY_TYPE("VARIABLE"),
    .IDELAY_VALUE(16),
    .IS_C_INVERTED(1'b0),
    .IS_DATAIN_INVERTED(1'b0),
    .IS_IDATAIN_INVERTED(1'b1),
    .PIPE_SEL("FALSE"),
    .REFCLK_FREQUENCY(200.000000),
    .SIGNAL_PATTERN("CLOCK"),
    .SIM_DELAY_D(815)) 
    IDELAYE2_inst_ClkDiv
       (.C(CLK),
        .CE(CE),
        .CINVCTRL(1'b0),
        .CNTVALUEIN({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CNTVALUEOUT(NLW_IDELAYE2_inst_ClkDiv_CNTVALUEOUT_UNCONNECTED[4:0]),
        .DATAIN(1'b0),
        .DATAOUT(IntBitClk_Ddly),
        .IDATAIN(DCLK_p_Int),
        .INC(INC),
        .LD(IntRst),
        .LDPIPEEN(1'b0),
        .REGRST(IntRst));
  (* box_type = "PRIMITIVE" *) 
  ISERDESE2 #(
    .DATA_RATE("SDR"),
    .DATA_WIDTH(8),
    .DYN_CLKDIV_INV_EN("FALSE"),
    .DYN_CLK_INV_EN("FALSE"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .INIT_Q3(1'b0),
    .INIT_Q4(1'b0),
    .INTERFACE_TYPE("NETWORKING"),
    .IOBDELAY("IBUF"),
    .IS_CLKB_INVERTED(1'b0),
    .IS_CLKDIVP_INVERTED(1'b0),
    .IS_CLKDIV_INVERTED(1'b0),
    .IS_CLK_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_OCLKB_INVERTED(1'b0),
    .IS_OCLK_INVERTED(1'b0),
    .NUM_CE(1),
    .OFB_USED("FALSE"),
    .SERDES_MODE("MASTER"),
    .SRVAL_Q1(1'b0),
    .SRVAL_Q2(1'b0),
    .SRVAL_Q3(1'b0),
    .SRVAL_Q4(1'b0)) 
    ISERDESE2_inst_DIVCLK
       (.BITSLIP(1'b0),
        .CE1(FrmClkEna),
        .CE2(1'b0),
        .CLK(DatClk),
        .CLKB(1'b0),
        .CLKDIV(CLK),
        .CLKDIVP(1'b0),
        .D(DCLK_p_Int),
        .DDLY(IntBitClk_Ddly),
        .DYNCLKDIVSEL(1'b0),
        .DYNCLKSEL(1'b0),
        .O(IntBitClk),
        .OCLK(1'b0),
        .OCLKB(1'b0),
        .OFB(1'b0),
        .Q1(IntClkCtrlOut[0]),
        .Q2(IntClkCtrlOut[1]),
        .Q3(IntClkCtrlOut[2]),
        .Q4(IntClkCtrlOut[3]),
        .Q5(IntClkCtrlOut[4]),
        .Q6(IntClkCtrlOut[5]),
        .Q7(IntClkCtrlOut[6]),
        .Q8(IntClkCtrlOut[7]),
        .RST(RST),
        .SHIFTIN1(1'b0),
        .SHIFTIN2(1'b0),
        .SHIFTOUT1(NLW_ISERDESE2_inst_DIVCLK_SHIFTOUT1_UNCONNECTED),
        .SHIFTOUT2(NLW_ISERDESE2_inst_DIVCLK_SHIFTOUT2_UNCONNECTED));
  AdcClockProcess adcclkp
       (.AdcBitClkAlgnWrn_OBUF(AdcBitClkAlgnWrn_OBUF),
        .AdcBitClkInvrld_OBUF(AdcBitClkInvrld_OBUF),
        .CE(CE),
        .FrmClkEna(FrmClkEna),
        .INC(INC),
        .IntClkCtrlDlyCe_reg_0(CLK),
        .IntClkCtrlDone_reg_0(BitClkDone_OBUF),
        .IntClkCtrlOut(IntClkCtrlOut),
        .IntProceedCnt0(IntProceedCnt0),
        .RST(RST));
endmodule

module AdcClockProcess
   (AdcBitClkAlgnWrn_OBUF,
    AdcBitClkInvrld_OBUF,
    IntClkCtrlDone_reg_0,
    INC,
    CE,
    IntProceedCnt0,
    IntClkCtrlDlyCe_reg_0,
    RST,
    FrmClkEna,
    IntClkCtrlOut);
  output AdcBitClkAlgnWrn_OBUF;
  output AdcBitClkInvrld_OBUF;
  output IntClkCtrlDone_reg_0;
  output INC;
  output CE;
  input IntProceedCnt0;
  input IntClkCtrlDlyCe_reg_0;
  input RST;
  input FrmClkEna;
  input [7:0]IntClkCtrlOut;

  wire AdcBitClkAlgnWrn_OBUF;
  wire AdcBitClkInvrld_OBUF;
  wire CE;
  wire FrmClkEna;
  wire INC;
  wire \IntAction[0]_i_1_n_0 ;
  wire \IntAction[0]_i_2_n_0 ;
  wire \IntAction[1]_i_1_n_0 ;
  wire \IntAction[1]_i_2_n_0 ;
  wire \IntAction[1]_i_3_n_0 ;
  wire IntCalVal;
  wire [1:0]IntCalValReg;
  wire \IntCalValReg[0]_i_1_n_0 ;
  wire \IntCalValReg[1]_i_1_n_0 ;
  wire \IntCalValReg[1]_i_2_n_0 ;
  wire \IntCalVal[0]_i_1_n_0 ;
  wire \IntCalVal[0]_i_2_n_0 ;
  wire \IntCalVal[0]_i_3_n_0 ;
  wire \IntCalVal[1]_i_1_n_0 ;
  wire \IntCalVal[1]_i_2_n_0 ;
  wire IntClkCtrlAlgnWrn9_out;
  wire IntClkCtrlAlgnWrn_i_2_n_0;
  wire IntClkCtrlAlgnWrn_i_3_n_0;
  wire IntClkCtrlDlyCe_i_1_n_0;
  wire IntClkCtrlDlyCe_reg_0;
  wire IntClkCtrlDlyInc_i_1_n_0;
  wire IntClkCtrlDlyInc_i_2_n_0;
  wire IntClkCtrlDone_i_1_n_0;
  wire IntClkCtrlDone_reg_0;
  wire IntClkCtrlInvrtd7_out;
  wire IntClkCtrlInvrtd_i_2_n_0;
  wire IntClkCtrlInvrtd_i_3_n_0;
  wire [7:0]IntClkCtrlOut;
  wire [3:0]IntNumIncDecIdly;
  wire \IntNumIncDecIdly[0]_i_1_n_0 ;
  wire \IntNumIncDecIdly[1]_i_1_n_0 ;
  wire \IntNumIncDecIdly[2]_i_1_n_0 ;
  wire \IntNumIncDecIdly[2]_i_2_n_0 ;
  wire \IntNumIncDecIdly[3]_i_1_n_0 ;
  wire \IntNumIncDecIdly[3]_i_2_n_0 ;
  wire \IntNumIncDecIdly[3]_i_3_n_0 ;
  wire \IntNumIncDecIdly[3]_i_4_n_0 ;
  wire [2:0]IntProceedCnt;
  wire IntProceedCnt0;
  wire IntProceedCntTc_d;
  wire \IntProceedCnt[0]_i_1_n_0 ;
  wire \IntProceedCnt[1]_i_1_n_0 ;
  wire \IntProceedCnt[2]_i_2_n_0 ;
  wire IntProceedDone_i_1_n_0;
  wire IntProceedDone_i_2_n_0;
  wire IntProceedDone_i_3_n_0;
  wire IntProceedDone_reg_n_0;
  wire IntProceed_i_1_n_0;
  wire [3:0]IntStepCnt;
  wire \IntStepCnt[0]_i_1_n_0 ;
  wire \IntStepCnt[1]_i_1_n_0 ;
  wire \IntStepCnt[2]_i_1_n_0 ;
  wire \IntStepCnt[3]_i_2_n_0 ;
  wire \IntStepCnt[3]_i_3_n_0 ;
  wire IntStepCnt_1;
  wire [3:0]IntTimeOutCnt;
  wire \IntTimeOutCnt[0]_i_1_n_0 ;
  wire \IntTimeOutCnt[1]_i_1_n_0 ;
  wire \IntTimeOutCnt[2]_i_1_n_0 ;
  wire \IntTimeOutCnt[3]_i_2_n_0 ;
  wire IntTimeOutCnt_0;
  wire IntTurnAroundBit_i_1_n_0;
  wire IntTurnAroundBit_reg_n_0;
  wire PassedSubstate_i_1_n_0;
  wire PassedSubstate_i_2_n_0;
  wire PassedSubstate_reg_n_0;
  wire RST;
  wire \ReturnState[1]_i_1_n_0 ;
  wire \ReturnState[1]_i_2_n_0 ;
  wire \ReturnState[2]_i_1_n_0 ;
  wire \ReturnState[2]_i_2_n_0 ;
  wire \ReturnState[2]_i_3_n_0 ;
  wire \ReturnState[2]_i_4_n_0 ;
  wire \ReturnState[2]_i_5_n_0 ;
  wire \ReturnState[2]_i_6_n_0 ;
  wire \ReturnState[2]_i_7_n_0 ;
  wire \ReturnState[2]_i_8_n_0 ;
  wire \ReturnState_reg_n_0_[1] ;
  wire \ReturnState_reg_n_0_[2] ;
  wire [3:0]State;
  wire \State[0]_i_2_n_0 ;
  wire \State[0]_i_3_n_0 ;
  wire \State[0]_i_4_n_0 ;
  wire \State[0]_i_5_n_0 ;
  wire \State[1]_i_2_n_0 ;
  wire \State[1]_i_3_n_0 ;
  wire \State[1]_i_4_n_0 ;
  wire \State[1]_i_5_n_0 ;
  wire \State[2]_i_2_n_0 ;
  wire \State[2]_i_3_n_0 ;
  wire \State[3]_i_1_n_0 ;
  wire \State[3]_i_4_n_0 ;
  wire \State[3]_i_5_n_0 ;
  wire \State_reg_n_0_[0] ;
  wire \State_reg_n_0_[1] ;
  wire \State_reg_n_0_[2] ;
  wire \State_reg_n_0_[3] ;
  wire data3;
  wire eqOp;
  wire g0_b0_n_0;
  wire g0_b1_n_0;
  wire g0_b2_n_0;
  wire [2:1]p_0_in;
  wire [4:0]sel;

  LUT6 #(
    .INIT(64'hFFFFC1FF00000100)) 
    \IntAction[0]_i_1 
       (.I0(\State_reg_n_0_[1] ),
        .I1(\State_reg_n_0_[3] ),
        .I2(\State_reg_n_0_[2] ),
        .I3(IntProceedCnt0),
        .I4(\IntAction[0]_i_2_n_0 ),
        .I5(sel[3]),
        .O(\IntAction[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0000FFFDFFFF)) 
    \IntAction[0]_i_2 
       (.I0(IntClkCtrlAlgnWrn_i_2_n_0),
        .I1(PassedSubstate_reg_n_0),
        .I2(\State_reg_n_0_[3] ),
        .I3(\State_reg_n_0_[2] ),
        .I4(\State_reg_n_0_[1] ),
        .I5(\State_reg_n_0_[0] ),
        .O(\IntAction[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFFFCFCF40004040)) 
    \IntAction[1]_i_1 
       (.I0(\State_reg_n_0_[3] ),
        .I1(\State_reg_n_0_[2] ),
        .I2(IntProceedCnt0),
        .I3(\IntAction[1]_i_2_n_0 ),
        .I4(\IntAction[1]_i_3_n_0 ),
        .I5(sel[4]),
        .O(\IntAction[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \IntAction[1]_i_2 
       (.I0(\State_reg_n_0_[0] ),
        .I1(\State_reg_n_0_[1] ),
        .O(\IntAction[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFFFFFFFFFFFF)) 
    \IntAction[1]_i_3 
       (.I0(\State_reg_n_0_[2] ),
        .I1(\State_reg_n_0_[0] ),
        .I2(\State_reg_n_0_[3] ),
        .I3(PassedSubstate_reg_n_0),
        .I4(\State_reg_n_0_[1] ),
        .I5(IntClkCtrlAlgnWrn_i_2_n_0),
        .O(\IntAction[1]_i_3_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \IntAction_reg[0] 
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(1'b1),
        .CLR(RST),
        .D(\IntAction[0]_i_1_n_0 ),
        .Q(sel[3]));
  FDCE #(
    .INIT(1'b0)) 
    \IntAction_reg[1] 
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(1'b1),
        .CLR(RST),
        .D(\IntAction[1]_i_1_n_0 ),
        .Q(sel[4]));
  LUT4 #(
    .INIT(16'h2F20)) 
    \IntCalValReg[0]_i_1 
       (.I0(p_0_in[1]),
        .I1(\State_reg_n_0_[3] ),
        .I2(\IntCalValReg[1]_i_2_n_0 ),
        .I3(IntCalValReg[0]),
        .O(\IntCalValReg[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h2F20)) 
    \IntCalValReg[1]_i_1 
       (.I0(p_0_in[2]),
        .I1(\State_reg_n_0_[3] ),
        .I2(\IntCalValReg[1]_i_2_n_0 ),
        .I3(IntCalValReg[1]),
        .O(\IntCalValReg[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000002800000000)) 
    \IntCalValReg[1]_i_2 
       (.I0(\State_reg_n_0_[0] ),
        .I1(\State_reg_n_0_[2] ),
        .I2(\State_reg_n_0_[3] ),
        .I3(\State_reg_n_0_[1] ),
        .I4(IntClkCtrlDone_reg_0),
        .I5(FrmClkEna),
        .O(\IntCalValReg[1]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \IntCalValReg_reg[0] 
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(1'b1),
        .CLR(RST),
        .D(\IntCalValReg[0]_i_1_n_0 ),
        .Q(IntCalValReg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \IntCalValReg_reg[1] 
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(1'b1),
        .CLR(RST),
        .D(\IntCalValReg[1]_i_1_n_0 ),
        .Q(IntCalValReg[1]));
  LUT6 #(
    .INIT(64'h8830FFFF88300000)) 
    \IntCalVal[0]_i_1 
       (.I0(\IntCalVal[0]_i_2_n_0 ),
        .I1(IntClkCtrlOut[7]),
        .I2(\IntCalVal[0]_i_3_n_0 ),
        .I3(IntClkCtrlOut[6]),
        .I4(IntCalVal),
        .I5(p_0_in[1]),
        .O(\IntCalVal[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \IntCalVal[0]_i_2 
       (.I0(IntClkCtrlOut[4]),
        .I1(IntClkCtrlOut[2]),
        .I2(IntClkCtrlOut[1]),
        .I3(IntClkCtrlOut[0]),
        .I4(IntClkCtrlOut[3]),
        .I5(IntClkCtrlOut[5]),
        .O(\IntCalVal[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \IntCalVal[0]_i_3 
       (.I0(IntClkCtrlOut[4]),
        .I1(IntClkCtrlOut[2]),
        .I2(IntClkCtrlOut[1]),
        .I3(IntClkCtrlOut[0]),
        .I4(IntClkCtrlOut[3]),
        .I5(IntClkCtrlOut[5]),
        .O(\IntCalVal[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \IntCalVal[0]_i_4 
       (.I0(IntProceedCntTc_d),
        .I1(IntClkCtrlDone_reg_0),
        .I2(FrmClkEna),
        .O(IntCalVal));
  LUT6 #(
    .INIT(64'hFF8FFFFF00800000)) 
    \IntCalVal[1]_i_1 
       (.I0(\IntCalVal[1]_i_2_n_0 ),
        .I1(IntClkCtrlOut[7]),
        .I2(IntProceedCntTc_d),
        .I3(IntClkCtrlDone_reg_0),
        .I4(FrmClkEna),
        .I5(p_0_in[2]),
        .O(\IntCalVal[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \IntCalVal[1]_i_2 
       (.I0(\IntCalVal[0]_i_2_n_0 ),
        .I1(IntClkCtrlOut[6]),
        .O(\IntCalVal[1]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \IntCalVal_reg[0] 
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(1'b1),
        .CLR(RST),
        .D(\IntCalVal[0]_i_1_n_0 ),
        .Q(p_0_in[1]));
  FDCE #(
    .INIT(1'b0)) 
    \IntCalVal_reg[1] 
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(1'b1),
        .CLR(RST),
        .D(\IntCalVal[1]_i_1_n_0 ),
        .Q(p_0_in[2]));
  LUT6 #(
    .INIT(64'h0000000000800000)) 
    IntClkCtrlAlgnWrn_i_1
       (.I0(IntProceedCnt0),
        .I1(IntClkCtrlAlgnWrn_i_2_n_0),
        .I2(\State_reg_n_0_[1] ),
        .I3(PassedSubstate_reg_n_0),
        .I4(IntClkCtrlAlgnWrn_i_3_n_0),
        .I5(\State_reg_n_0_[2] ),
        .O(IntClkCtrlAlgnWrn9_out));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    IntClkCtrlAlgnWrn_i_2
       (.I0(IntTimeOutCnt[3]),
        .I1(IntTimeOutCnt[2]),
        .I2(IntTimeOutCnt[1]),
        .I3(IntTimeOutCnt[0]),
        .O(IntClkCtrlAlgnWrn_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h1)) 
    IntClkCtrlAlgnWrn_i_3
       (.I0(\State_reg_n_0_[3] ),
        .I1(\State_reg_n_0_[0] ),
        .O(IntClkCtrlAlgnWrn_i_3_n_0));
  FDCE #(
    .INIT(1'b0)) 
    IntClkCtrlAlgnWrn_reg
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(IntClkCtrlAlgnWrn9_out),
        .CLR(RST),
        .D(IntClkCtrlAlgnWrn_i_2_n_0),
        .Q(AdcBitClkAlgnWrn_OBUF));
  LUT6 #(
    .INIT(64'hBFFFFFFF80000000)) 
    IntClkCtrlDlyCe_i_1
       (.I0(data3),
        .I1(IntProceedCnt0),
        .I2(\State_reg_n_0_[3] ),
        .I3(\State_reg_n_0_[2] ),
        .I4(\State_reg_n_0_[0] ),
        .I5(CE),
        .O(IntClkCtrlDlyCe_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    IntClkCtrlDlyCe_reg
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(1'b1),
        .CLR(RST),
        .D(IntClkCtrlDlyCe_i_1_n_0),
        .Q(CE));
  LUT6 #(
    .INIT(64'hFFFBBBFB00088808)) 
    IntClkCtrlDlyInc_i_1
       (.I0(IntClkCtrlDlyInc_i_2_n_0),
        .I1(IntProceedCnt0),
        .I2(\ReturnState[2]_i_3_n_0 ),
        .I3(\ReturnState[2]_i_4_n_0 ),
        .I4(\ReturnState[2]_i_5_n_0 ),
        .I5(INC),
        .O(IntClkCtrlDlyInc_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hFEAE)) 
    IntClkCtrlDlyInc_i_2
       (.I0(\State_reg_n_0_[2] ),
        .I1(\State_reg_n_0_[1] ),
        .I2(\State_reg_n_0_[0] ),
        .I3(\State_reg_n_0_[3] ),
        .O(IntClkCtrlDlyInc_i_2_n_0));
  FDPE #(
    .INIT(1'b1)) 
    IntClkCtrlDlyInc_reg
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(1'b1),
        .D(IntClkCtrlDlyInc_i_1_n_0),
        .PRE(RST),
        .Q(INC));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'hFF80FF00)) 
    IntClkCtrlDone_i_1
       (.I0(\State_reg_n_0_[2] ),
        .I1(\State_reg_n_0_[1] ),
        .I2(FrmClkEna),
        .I3(IntClkCtrlDone_reg_0),
        .I4(\State_reg_n_0_[3] ),
        .O(IntClkCtrlDone_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    IntClkCtrlDone_reg
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(1'b1),
        .CLR(RST),
        .D(IntClkCtrlDone_i_1_n_0),
        .Q(IntClkCtrlDone_reg_0));
  LUT6 #(
    .INIT(64'h0000000040040000)) 
    IntClkCtrlInvrtd_i_1
       (.I0(\State_reg_n_0_[3] ),
        .I1(IntProceedCnt0),
        .I2(\State_reg_n_0_[1] ),
        .I3(\State_reg_n_0_[0] ),
        .I4(\State_reg_n_0_[2] ),
        .I5(IntClkCtrlInvrtd_i_3_n_0),
        .O(IntClkCtrlInvrtd7_out));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hBF)) 
    IntClkCtrlInvrtd_i_2
       (.I0(IntCalValReg[1]),
        .I1(IntCalValReg[0]),
        .I2(\State_reg_n_0_[0] ),
        .O(IntClkCtrlInvrtd_i_2_n_0));
  LUT3 #(
    .INIT(8'h08)) 
    IntClkCtrlInvrtd_i_3
       (.I0(\State_reg_n_0_[0] ),
        .I1(IntCalValReg[0]),
        .I2(IntCalValReg[1]),
        .O(IntClkCtrlInvrtd_i_3_n_0));
  FDCE #(
    .INIT(1'b0)) 
    IntClkCtrlInvrtd_reg
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(IntClkCtrlInvrtd7_out),
        .CLR(RST),
        .D(IntClkCtrlInvrtd_i_2_n_0),
        .Q(AdcBitClkInvrld_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h37776644)) 
    \IntNumIncDecIdly[0]_i_1 
       (.I0(\State_reg_n_0_[1] ),
        .I1(\State_reg_n_0_[0] ),
        .I2(IntNumIncDecIdly[0]),
        .I3(\State_reg_n_0_[3] ),
        .I4(\State_reg_n_0_[2] ),
        .O(\IntNumIncDecIdly[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h90009000FFFF00FF)) 
    \IntNumIncDecIdly[1]_i_1 
       (.I0(IntNumIncDecIdly[1]),
        .I1(IntNumIncDecIdly[0]),
        .I2(\State_reg_n_0_[3] ),
        .I3(\State_reg_n_0_[0] ),
        .I4(\State_reg_n_0_[1] ),
        .I5(\State_reg_n_0_[2] ),
        .O(\IntNumIncDecIdly[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'hA2A2A22A)) 
    \IntNumIncDecIdly[2]_i_1 
       (.I0(\IntNumIncDecIdly[2]_i_2_n_0 ),
        .I1(\State_reg_n_0_[2] ),
        .I2(IntNumIncDecIdly[2]),
        .I3(IntNumIncDecIdly[0]),
        .I4(IntNumIncDecIdly[1]),
        .O(\IntNumIncDecIdly[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hC8C0)) 
    \IntNumIncDecIdly[2]_i_2 
       (.I0(\State_reg_n_0_[0] ),
        .I1(\State_reg_n_0_[3] ),
        .I2(\State_reg_n_0_[1] ),
        .I3(\State_reg_n_0_[2] ),
        .O(\IntNumIncDecIdly[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h40444040)) 
    \IntNumIncDecIdly[3]_i_1 
       (.I0(IntClkCtrlDone_reg_0),
        .I1(FrmClkEna),
        .I2(\IntNumIncDecIdly[3]_i_3_n_0 ),
        .I3(\ReturnState[2]_i_5_n_0 ),
        .I4(\State_reg_n_0_[1] ),
        .O(\IntNumIncDecIdly[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00C8C80088888888)) 
    \IntNumIncDecIdly[3]_i_2 
       (.I0(\State_reg_n_0_[1] ),
        .I1(\State_reg_n_0_[3] ),
        .I2(\State_reg_n_0_[0] ),
        .I3(IntNumIncDecIdly[3]),
        .I4(\IntNumIncDecIdly[3]_i_4_n_0 ),
        .I5(\State_reg_n_0_[2] ),
        .O(\IntNumIncDecIdly[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8000AA008FF0AA00)) 
    \IntNumIncDecIdly[3]_i_3 
       (.I0(\ReturnState[2]_i_6_n_0 ),
        .I1(data3),
        .I2(\State_reg_n_0_[0] ),
        .I3(\State_reg_n_0_[3] ),
        .I4(\State_reg_n_0_[2] ),
        .I5(\State_reg_n_0_[1] ),
        .O(\IntNumIncDecIdly[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \IntNumIncDecIdly[3]_i_4 
       (.I0(IntNumIncDecIdly[2]),
        .I1(IntNumIncDecIdly[0]),
        .I2(IntNumIncDecIdly[1]),
        .O(\IntNumIncDecIdly[3]_i_4_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \IntNumIncDecIdly_reg[0] 
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(\IntNumIncDecIdly[3]_i_1_n_0 ),
        .CLR(RST),
        .D(\IntNumIncDecIdly[0]_i_1_n_0 ),
        .Q(IntNumIncDecIdly[0]));
  FDCE #(
    .INIT(1'b0)) 
    \IntNumIncDecIdly_reg[1] 
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(\IntNumIncDecIdly[3]_i_1_n_0 ),
        .CLR(RST),
        .D(\IntNumIncDecIdly[1]_i_1_n_0 ),
        .Q(IntNumIncDecIdly[1]));
  FDCE #(
    .INIT(1'b0)) 
    \IntNumIncDecIdly_reg[2] 
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(\IntNumIncDecIdly[3]_i_1_n_0 ),
        .CLR(RST),
        .D(\IntNumIncDecIdly[2]_i_1_n_0 ),
        .Q(IntNumIncDecIdly[2]));
  FDCE #(
    .INIT(1'b0)) 
    \IntNumIncDecIdly_reg[3] 
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(\IntNumIncDecIdly[3]_i_1_n_0 ),
        .CLR(RST),
        .D(\IntNumIncDecIdly[3]_i_2_n_0 ),
        .Q(IntNumIncDecIdly[3]));
  FDCE #(
    .INIT(1'b0)) 
    IntProceedCntTc_d_reg
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(IntProceedCnt0),
        .CLR(RST),
        .D(eqOp),
        .Q(IntProceedCntTc_d));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \IntProceedCnt[0]_i_1 
       (.I0(IntProceedCnt[0]),
        .O(\IntProceedCnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \IntProceedCnt[1]_i_1 
       (.I0(IntProceedCnt[0]),
        .I1(IntProceedCnt[1]),
        .O(\IntProceedCnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \IntProceedCnt[2]_i_2 
       (.I0(IntProceedCnt[0]),
        .I1(IntProceedCnt[1]),
        .I2(IntProceedCnt[2]),
        .O(\IntProceedCnt[2]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \IntProceedCnt_reg[0] 
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(IntProceedCnt0),
        .CLR(RST),
        .D(\IntProceedCnt[0]_i_1_n_0 ),
        .Q(IntProceedCnt[0]));
  FDCE #(
    .INIT(1'b0)) 
    \IntProceedCnt_reg[1] 
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(IntProceedCnt0),
        .CLR(RST),
        .D(\IntProceedCnt[1]_i_1_n_0 ),
        .Q(IntProceedCnt[1]));
  FDCE #(
    .INIT(1'b0)) 
    \IntProceedCnt_reg[2] 
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(IntProceedCnt0),
        .CLR(RST),
        .D(\IntProceedCnt[2]_i_2_n_0 ),
        .Q(IntProceedCnt[2]));
  LUT6 #(
    .INIT(64'hEFFFEFEFE000E0E0)) 
    IntProceedDone_i_1
       (.I0(\State_reg_n_0_[1] ),
        .I1(\State_reg_n_0_[0] ),
        .I2(IntProceedCnt0),
        .I3(IntProceedDone_i_2_n_0),
        .I4(IntProceedDone_i_3_n_0),
        .I5(IntProceedDone_reg_n_0),
        .O(IntProceedDone_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h1400)) 
    IntProceedDone_i_2
       (.I0(\State_reg_n_0_[1] ),
        .I1(\State_reg_n_0_[3] ),
        .I2(\State_reg_n_0_[2] ),
        .I3(\State_reg_n_0_[0] ),
        .O(IntProceedDone_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFAFFFAFFF2FFFA)) 
    IntProceedDone_i_3
       (.I0(\State_reg_n_0_[2] ),
        .I1(\State_reg_n_0_[1] ),
        .I2(\State_reg_n_0_[0] ),
        .I3(\State_reg_n_0_[3] ),
        .I4(\ReturnState[2]_i_7_n_0 ),
        .I5(\ReturnState[2]_i_8_n_0 ),
        .O(IntProceedDone_i_3_n_0));
  FDCE #(
    .INIT(1'b0)) 
    IntProceedDone_reg
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(1'b1),
        .CLR(RST),
        .D(IntProceedDone_i_1_n_0),
        .Q(IntProceedDone_reg_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'hFFBF4400)) 
    IntProceed_i_1
       (.I0(IntClkCtrlDone_reg_0),
        .I1(FrmClkEna),
        .I2(IntProceedDone_reg_n_0),
        .I3(IntProceedCntTc_d),
        .I4(sel[0]),
        .O(IntProceed_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    IntProceed_reg
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(1'b1),
        .CLR(RST),
        .D(IntProceed_i_1_n_0),
        .Q(sel[0]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h54)) 
    \IntStepCnt[0]_i_1 
       (.I0(IntStepCnt[0]),
        .I1(\State_reg_n_0_[1] ),
        .I2(\State_reg_n_0_[3] ),
        .O(\IntStepCnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h6660)) 
    \IntStepCnt[1]_i_1 
       (.I0(IntStepCnt[1]),
        .I1(IntStepCnt[0]),
        .I2(\State_reg_n_0_[1] ),
        .I3(\State_reg_n_0_[3] ),
        .O(\IntStepCnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h0EEEE000)) 
    \IntStepCnt[2]_i_1 
       (.I0(\State_reg_n_0_[1] ),
        .I1(\State_reg_n_0_[3] ),
        .I2(IntStepCnt[0]),
        .I3(IntStepCnt[1]),
        .I4(IntStepCnt[2]),
        .O(\IntStepCnt[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF009000900000000)) 
    \IntStepCnt[3]_i_1 
       (.I0(\State_reg_n_0_[3] ),
        .I1(\State_reg_n_0_[0] ),
        .I2(\State_reg_n_0_[2] ),
        .I3(\State_reg_n_0_[1] ),
        .I4(\IntStepCnt[3]_i_3_n_0 ),
        .I5(IntProceedCnt0),
        .O(IntStepCnt_1));
  LUT6 #(
    .INIT(64'h0EEEEEEEE0000000)) 
    \IntStepCnt[3]_i_2 
       (.I0(\State_reg_n_0_[1] ),
        .I1(\State_reg_n_0_[3] ),
        .I2(IntStepCnt[1]),
        .I3(IntStepCnt[0]),
        .I4(IntStepCnt[2]),
        .I5(IntStepCnt[3]),
        .O(\IntStepCnt[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8008000000008008)) 
    \IntStepCnt[3]_i_3 
       (.I0(IntClkCtrlAlgnWrn_i_3_n_0),
        .I1(\ReturnState[2]_i_7_n_0 ),
        .I2(p_0_in[2]),
        .I3(IntCalValReg[1]),
        .I4(p_0_in[1]),
        .I5(IntCalValReg[0]),
        .O(\IntStepCnt[3]_i_3_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \IntStepCnt_reg[0] 
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(IntStepCnt_1),
        .CLR(RST),
        .D(\IntStepCnt[0]_i_1_n_0 ),
        .Q(IntStepCnt[0]));
  FDCE #(
    .INIT(1'b0)) 
    \IntStepCnt_reg[1] 
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(IntStepCnt_1),
        .CLR(RST),
        .D(\IntStepCnt[1]_i_1_n_0 ),
        .Q(IntStepCnt[1]));
  FDCE #(
    .INIT(1'b0)) 
    \IntStepCnt_reg[2] 
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(IntStepCnt_1),
        .CLR(RST),
        .D(\IntStepCnt[2]_i_1_n_0 ),
        .Q(IntStepCnt[2]));
  FDCE #(
    .INIT(1'b0)) 
    \IntStepCnt_reg[3] 
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(IntStepCnt_1),
        .CLR(RST),
        .D(\IntStepCnt[3]_i_2_n_0 ),
        .Q(IntStepCnt[3]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \IntTimeOutCnt[0]_i_1 
       (.I0(\State_reg_n_0_[3] ),
        .I1(IntTimeOutCnt[0]),
        .O(\IntTimeOutCnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \IntTimeOutCnt[1]_i_1 
       (.I0(IntTimeOutCnt[0]),
        .I1(IntTimeOutCnt[1]),
        .I2(\State_reg_n_0_[3] ),
        .O(\IntTimeOutCnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h1540)) 
    \IntTimeOutCnt[2]_i_1 
       (.I0(\State_reg_n_0_[3] ),
        .I1(IntTimeOutCnt[1]),
        .I2(IntTimeOutCnt[0]),
        .I3(IntTimeOutCnt[2]),
        .O(\IntTimeOutCnt[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0020000000200040)) 
    \IntTimeOutCnt[3]_i_1 
       (.I0(\State_reg_n_0_[0] ),
        .I1(\State_reg_n_0_[1] ),
        .I2(IntProceedCnt0),
        .I3(\State_reg_n_0_[2] ),
        .I4(\State_reg_n_0_[3] ),
        .I5(PassedSubstate_reg_n_0),
        .O(IntTimeOutCnt_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h15554000)) 
    \IntTimeOutCnt[3]_i_2 
       (.I0(\State_reg_n_0_[3] ),
        .I1(IntTimeOutCnt[0]),
        .I2(IntTimeOutCnt[1]),
        .I3(IntTimeOutCnt[2]),
        .I4(IntTimeOutCnt[3]),
        .O(\IntTimeOutCnt[3]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \IntTimeOutCnt_reg[0] 
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(IntTimeOutCnt_0),
        .CLR(RST),
        .D(\IntTimeOutCnt[0]_i_1_n_0 ),
        .Q(IntTimeOutCnt[0]));
  FDCE #(
    .INIT(1'b0)) 
    \IntTimeOutCnt_reg[1] 
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(IntTimeOutCnt_0),
        .CLR(RST),
        .D(\IntTimeOutCnt[1]_i_1_n_0 ),
        .Q(IntTimeOutCnt[1]));
  FDCE #(
    .INIT(1'b0)) 
    \IntTimeOutCnt_reg[2] 
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(IntTimeOutCnt_0),
        .CLR(RST),
        .D(\IntTimeOutCnt[2]_i_1_n_0 ),
        .Q(IntTimeOutCnt[2]));
  FDCE #(
    .INIT(1'b0)) 
    \IntTimeOutCnt_reg[3] 
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(IntTimeOutCnt_0),
        .CLR(RST),
        .D(\IntTimeOutCnt[3]_i_2_n_0 ),
        .Q(IntTimeOutCnt[3]));
  LUT6 #(
    .INIT(64'hFFFFFFFF04000000)) 
    IntTurnAroundBit_i_1
       (.I0(\State_reg_n_0_[2] ),
        .I1(\State_reg_n_0_[0] ),
        .I2(\State_reg_n_0_[1] ),
        .I3(IntProceedCnt0),
        .I4(\State_reg_n_0_[3] ),
        .I5(IntTurnAroundBit_reg_n_0),
        .O(IntTurnAroundBit_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    IntTurnAroundBit_reg
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(1'b1),
        .CLR(RST),
        .D(IntTurnAroundBit_i_1_n_0),
        .Q(IntTurnAroundBit_reg_n_0));
  LUT5 #(
    .INIT(32'hFFEF0020)) 
    PassedSubstate_i_1
       (.I0(\State_reg_n_0_[3] ),
        .I1(IntClkCtrlDone_reg_0),
        .I2(FrmClkEna),
        .I3(PassedSubstate_i_2_n_0),
        .I4(PassedSubstate_reg_n_0),
        .O(PassedSubstate_i_1_n_0));
  LUT6 #(
    .INIT(64'hBFFCBFFFBFFCBFFC)) 
    PassedSubstate_i_2
       (.I0(data3),
        .I1(\State_reg_n_0_[2] ),
        .I2(\State_reg_n_0_[0] ),
        .I3(\State_reg_n_0_[3] ),
        .I4(PassedSubstate_reg_n_0),
        .I5(\State_reg_n_0_[1] ),
        .O(PassedSubstate_i_2_n_0));
  FDCE #(
    .INIT(1'b0)) 
    PassedSubstate_reg
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(1'b1),
        .CLR(RST),
        .D(PassedSubstate_i_1_n_0),
        .Q(PassedSubstate_reg_n_0));
  LUT6 #(
    .INIT(64'hFFFBBBFB00088808)) 
    \ReturnState[1]_i_1 
       (.I0(\ReturnState[1]_i_2_n_0 ),
        .I1(IntProceedCnt0),
        .I2(\ReturnState[2]_i_3_n_0 ),
        .I3(\ReturnState[2]_i_4_n_0 ),
        .I4(\ReturnState[2]_i_5_n_0 ),
        .I5(\ReturnState_reg_n_0_[1] ),
        .O(\ReturnState[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h111F)) 
    \ReturnState[1]_i_2 
       (.I0(\State_reg_n_0_[2] ),
        .I1(\State_reg_n_0_[3] ),
        .I2(\State_reg_n_0_[1] ),
        .I3(\State_reg_n_0_[0] ),
        .O(\ReturnState[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFBBBFB00088808)) 
    \ReturnState[2]_i_1 
       (.I0(\ReturnState[2]_i_2_n_0 ),
        .I1(IntProceedCnt0),
        .I2(\ReturnState[2]_i_3_n_0 ),
        .I3(\ReturnState[2]_i_4_n_0 ),
        .I4(\ReturnState[2]_i_5_n_0 ),
        .I5(\ReturnState_reg_n_0_[2] ),
        .O(\ReturnState[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \ReturnState[2]_i_2 
       (.I0(\State_reg_n_0_[3] ),
        .I1(\State_reg_n_0_[1] ),
        .I2(\State_reg_n_0_[0] ),
        .O(\ReturnState[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h1F)) 
    \ReturnState[2]_i_3 
       (.I0(\State_reg_n_0_[0] ),
        .I1(\State_reg_n_0_[3] ),
        .I2(\State_reg_n_0_[2] ),
        .O(\ReturnState[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'hEFAAAAAA)) 
    \ReturnState[2]_i_4 
       (.I0(\State_reg_n_0_[1] ),
        .I1(\State_reg_n_0_[0] ),
        .I2(\State_reg_n_0_[2] ),
        .I3(\State_reg_n_0_[3] ),
        .I4(\ReturnState[2]_i_6_n_0 ),
        .O(\ReturnState[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0FFFE0E0E0E0)) 
    \ReturnState[2]_i_5 
       (.I0(PassedSubstate_reg_n_0),
        .I1(IntClkCtrlAlgnWrn_i_2_n_0),
        .I2(IntClkCtrlAlgnWrn_i_3_n_0),
        .I3(\ReturnState[2]_i_7_n_0 ),
        .I4(\ReturnState[2]_i_8_n_0 ),
        .I5(\State_reg_n_0_[2] ),
        .O(\ReturnState[2]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \ReturnState[2]_i_6 
       (.I0(\State_reg_n_0_[0] ),
        .I1(IntTimeOutCnt[2]),
        .I2(IntTimeOutCnt[3]),
        .I3(IntTimeOutCnt[1]),
        .I4(IntTimeOutCnt[0]),
        .O(\ReturnState[2]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \ReturnState[2]_i_7 
       (.I0(IntStepCnt[1]),
        .I1(IntStepCnt[0]),
        .I2(IntStepCnt[3]),
        .I3(IntStepCnt[2]),
        .O(\ReturnState[2]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h6FF6)) 
    \ReturnState[2]_i_8 
       (.I0(p_0_in[2]),
        .I1(IntCalValReg[1]),
        .I2(p_0_in[1]),
        .I3(IntCalValReg[0]),
        .O(\ReturnState[2]_i_8_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \ReturnState_reg[1] 
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(1'b1),
        .CLR(RST),
        .D(\ReturnState[1]_i_1_n_0 ),
        .Q(\ReturnState_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \ReturnState_reg[2] 
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(1'b1),
        .CLR(RST),
        .D(\ReturnState[2]_i_1_n_0 ),
        .Q(\ReturnState_reg_n_0_[2] ));
  LUT6 #(
    .INIT(64'h4F4F0FFF44440000)) 
    \State[0]_i_1 
       (.I0(\State[1]_i_3_n_0 ),
        .I1(\State[1]_i_4_n_0 ),
        .I2(\State[0]_i_2_n_0 ),
        .I3(\State[0]_i_3_n_0 ),
        .I4(\State_reg_n_0_[3] ),
        .I5(\State[0]_i_4_n_0 ),
        .O(State[0]));
  LUT6 #(
    .INIT(64'hD555555555555555)) 
    \State[0]_i_2 
       (.I0(IntClkCtrlAlgnWrn_i_3_n_0),
        .I1(\State[0]_i_5_n_0 ),
        .I2(p_0_in[2]),
        .I3(IntCalValReg[1]),
        .I4(p_0_in[1]),
        .I5(IntCalValReg[0]),
        .O(\State[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \State[0]_i_3 
       (.I0(\State_reg_n_0_[1] ),
        .I1(\State_reg_n_0_[2] ),
        .O(\State[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFABAAFFFFABAAAA)) 
    \State[0]_i_4 
       (.I0(\State_reg_n_0_[2] ),
        .I1(IntClkCtrlAlgnWrn_i_2_n_0),
        .I2(PassedSubstate_reg_n_0),
        .I3(\State_reg_n_0_[0] ),
        .I4(\State_reg_n_0_[1] ),
        .I5(g0_b0_n_0),
        .O(\State[0]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \State[0]_i_5 
       (.I0(IntTurnAroundBit_reg_n_0),
        .I1(IntStepCnt[2]),
        .I2(IntStepCnt[3]),
        .I3(IntStepCnt[0]),
        .I4(IntStepCnt[1]),
        .O(\State[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hE0EEE0E0EEEEEEEE)) 
    \State[1]_i_1 
       (.I0(\State[1]_i_2_n_0 ),
        .I1(\State[3]_i_4_n_0 ),
        .I2(\State[1]_i_3_n_0 ),
        .I3(\State[1]_i_4_n_0 ),
        .I4(\ReturnState_reg_n_0_[1] ),
        .I5(\State_reg_n_0_[3] ),
        .O(State[1]));
  LUT6 #(
    .INIT(64'h0000333300F02222)) 
    \State[1]_i_2 
       (.I0(g0_b1_n_0),
        .I1(\State_reg_n_0_[1] ),
        .I2(IntTurnAroundBit_reg_n_0),
        .I3(\ReturnState[2]_i_7_n_0 ),
        .I4(\State_reg_n_0_[2] ),
        .I5(\State_reg_n_0_[0] ),
        .O(\State[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \State[1]_i_3 
       (.I0(\State[1]_i_5_n_0 ),
        .I1(IntTimeOutCnt[0]),
        .I2(IntTimeOutCnt[1]),
        .I3(IntTimeOutCnt[3]),
        .I4(IntTimeOutCnt[2]),
        .I5(\State_reg_n_0_[0] ),
        .O(\State[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \State[1]_i_4 
       (.I0(\State_reg_n_0_[0] ),
        .I1(\State_reg_n_0_[2] ),
        .O(\State[1]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \State[1]_i_5 
       (.I0(\State_reg_n_0_[1] ),
        .I1(\State_reg_n_0_[2] ),
        .O(\State[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hBABABABBBABABABA)) 
    \State[2]_i_1 
       (.I0(\State[2]_i_2_n_0 ),
        .I1(\State[2]_i_3_n_0 ),
        .I2(\State[3]_i_5_n_0 ),
        .I3(\State_reg_n_0_[0] ),
        .I4(\State_reg_n_0_[1] ),
        .I5(g0_b2_n_0),
        .O(State[2]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'hAA2A)) 
    \State[2]_i_2 
       (.I0(\State_reg_n_0_[3] ),
        .I1(\State_reg_n_0_[0] ),
        .I2(\State_reg_n_0_[2] ),
        .I3(\ReturnState_reg_n_0_[2] ),
        .O(\State[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hEBEBEBFBAAAAAAAA)) 
    \State[2]_i_3 
       (.I0(\State_reg_n_0_[3] ),
        .I1(\State_reg_n_0_[0] ),
        .I2(\State_reg_n_0_[1] ),
        .I3(\ReturnState[2]_i_7_n_0 ),
        .I4(\ReturnState[2]_i_8_n_0 ),
        .I5(\State_reg_n_0_[2] ),
        .O(\State[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h77007F007F007F00)) 
    \State[3]_i_1 
       (.I0(\State_reg_n_0_[3] ),
        .I1(\State_reg_n_0_[2] ),
        .I2(\State_reg_n_0_[1] ),
        .I3(IntProceedCnt0),
        .I4(\State_reg_n_0_[0] ),
        .I5(data3),
        .O(\State[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF4FFFFFF44444444)) 
    \State[3]_i_2 
       (.I0(\State[3]_i_4_n_0 ),
        .I1(\State[3]_i_5_n_0 ),
        .I2(\ReturnState_reg_n_0_[2] ),
        .I3(\State_reg_n_0_[2] ),
        .I4(\State_reg_n_0_[0] ),
        .I5(\State_reg_n_0_[3] ),
        .O(State[3]));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \State[3]_i_3 
       (.I0(IntNumIncDecIdly[3]),
        .I1(IntNumIncDecIdly[1]),
        .I2(IntNumIncDecIdly[0]),
        .I3(IntNumIncDecIdly[2]),
        .O(data3));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'hAAAAFBAA)) 
    \State[3]_i_4 
       (.I0(\State_reg_n_0_[3] ),
        .I1(\State_reg_n_0_[1] ),
        .I2(\ReturnState[2]_i_8_n_0 ),
        .I3(\State_reg_n_0_[2] ),
        .I4(\State_reg_n_0_[0] ),
        .O(\State[3]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'hFFABFF00)) 
    \State[3]_i_5 
       (.I0(\State_reg_n_0_[0] ),
        .I1(PassedSubstate_reg_n_0),
        .I2(IntClkCtrlAlgnWrn_i_2_n_0),
        .I3(\State_reg_n_0_[2] ),
        .I4(\State_reg_n_0_[1] ),
        .O(\State[3]_i_5_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \State_reg[0] 
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(\State[3]_i_1_n_0 ),
        .CLR(RST),
        .D(State[0]),
        .Q(\State_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \State_reg[1] 
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(\State[3]_i_1_n_0 ),
        .CLR(RST),
        .D(State[1]),
        .Q(\State_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \State_reg[2] 
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(\State[3]_i_1_n_0 ),
        .CLR(RST),
        .D(State[2]),
        .Q(\State_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \State_reg[3] 
       (.C(IntClkCtrlDlyCe_reg_0),
        .CE(\State[3]_i_1_n_0 ),
        .CLR(RST),
        .D(State[3]),
        .Q(\State_reg_n_0_[3] ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \eqOp_inferred__0/i_ 
       (.I0(IntProceedCnt[1]),
        .I1(IntProceedCnt[2]),
        .I2(IntProceedCnt[0]),
        .O(eqOp));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h000080AA)) 
    g0_b0
       (.I0(sel[0]),
        .I1(p_0_in[1]),
        .I2(p_0_in[2]),
        .I3(sel[3]),
        .I4(sel[4]),
        .O(g0_b0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'hAAAA8200)) 
    g0_b1
       (.I0(sel[0]),
        .I1(p_0_in[1]),
        .I2(p_0_in[2]),
        .I3(sel[3]),
        .I4(sel[4]),
        .O(g0_b1_n_0));
  LUT5 #(
    .INIT(32'hA8A828A8)) 
    g0_b2
       (.I0(sel[0]),
        .I1(p_0_in[1]),
        .I2(p_0_in[2]),
        .I3(sel[3]),
        .I4(sel[4]),
        .O(g0_b2_n_0));
endmodule

module AdcDataDone
   (IntDatDone,
    BitClkDone_OBUF,
    CLK,
    IntRst);
  output IntDatDone;
  input BitClkDone_OBUF;
  input CLK;
  input IntRst;

  wire BitClkDone_OBUF;
  wire CLK;
  wire IntDatDone;
  wire IntRst;

  FDCE #(
    .INIT(1'b0)) 
    IntDatDoneInt_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(IntRst),
        .D(BitClkDone_OBUF),
        .Q(IntDatDone));
endmodule

module Adc_FDPE
   (IntProceedCnt0,
    FrmClkEna,
    IntDatEna,
    RST,
    IntRst,
    AR,
    BitClkDone_OBUF,
    IntDatDone,
    AdcReSync_IBUF,
    FrmClkReSyncOut_OBUF,
    CLK,
    AdcIntrfcRst,
    AdcIntrfcEna);
  output IntProceedCnt0;
  output FrmClkEna;
  output IntDatEna;
  output RST;
  output IntRst;
  output [0:0]AR;
  input BitClkDone_OBUF;
  input IntDatDone;
  input AdcReSync_IBUF;
  input FrmClkReSyncOut_OBUF;
  input CLK;
  input AdcIntrfcRst;
  input AdcIntrfcEna;

  wire [0:0]AR;
  wire AdcIntrfcEna;
  wire AdcIntrfcRst;
  wire AdcReSync_IBUF;
  wire BitClkDone_OBUF;
  wire CLK;
  wire FrmClkEna;
  wire FrmClkReSyncOut_OBUF;
  wire IntDatDone;
  wire IntDatEna;
  wire IntProceedCnt0;
  wire IntRst;
  wire Q_out;
  wire RST;

  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h8)) 
    Dat_Reg_0_i_1
       (.I0(FrmClkEna),
        .I1(IntDatDone),
        .O(IntDatEna));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'hE)) 
    FDCE_inst0_i_1
       (.I0(IntRst),
        .I1(FrmClkReSyncOut_OBUF),
        .O(AR));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst2
       (.C(CLK),
        .CE(AdcIntrfcEna),
        .CLR(IntRst),
        .D(1'b1),
        .Q(Q_out));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst3
       (.C(CLK),
        .CE(1'b1),
        .CLR(IntRst),
        .D(Q_out),
        .Q(FrmClkEna));
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_PRE_INVERTED(1'b0)) 
    FDPE_inst1
       (.C(CLK),
        .CE(1'b1),
        .D(1'b0),
        .PRE(AdcIntrfcRst),
        .Q(IntRst));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'hE)) 
    ISERDESE2_inst_DIVCLK_i_1
       (.I0(IntRst),
        .I1(AdcReSync_IBUF),
        .O(RST));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \IntProceedCnt[2]_i_1 
       (.I0(FrmClkEna),
        .I1(BitClkDone_OBUF),
        .O(IntProceedCnt0));
endmodule

module Dat_Iserdes_Out
   (dataOut_OBUF,
    IntDatEna,
    D,
    CLK,
    FrmClkReSyncOut_OBUF,
    DatOut,
    Dat_Reg_2_0,
    Dat_Reg_4_0,
    Dat_Reg_6_0,
    Dat_Reg_8_0,
    Dat_Reg_10_0,
    Dat_Reg_12_0,
    FrmClkSwapMux_OBUF);
  output [13:0]dataOut_OBUF;
  input IntDatEna;
  input D;
  input CLK;
  input FrmClkReSyncOut_OBUF;
  input [6:0]DatOut;
  input Dat_Reg_2_0;
  input Dat_Reg_4_0;
  input Dat_Reg_6_0;
  input Dat_Reg_8_0;
  input Dat_Reg_10_0;
  input Dat_Reg_12_0;
  input FrmClkSwapMux_OBUF;

  wire CLK;
  wire D;
  wire [6:0]DatOut;
  wire Dat_Reg_10_0;
  wire Dat_Reg_12_0;
  wire Dat_Reg_2_0;
  wire Dat_Reg_4_0;
  wire Dat_Reg_6_0;
  wire Dat_Reg_8_0;
  wire FrmClkReSyncOut_OBUF;
  wire FrmClkSwapMux_OBUF;
  wire IntDatEna;
  wire IntDatMux_reg;
  wire IntDat_0;
  wire IntDat_1;
  wire IntDat_10;
  wire IntDat_11;
  wire IntDat_12;
  wire IntDat_13;
  wire IntDat_2;
  wire IntDat_3;
  wire IntDat_4;
  wire IntDat_5;
  wire IntDat_6;
  wire IntDat_7;
  wire IntDat_8;
  wire IntDat_9;
  wire adcData_IntDatMux_Reg0_i_1_n_0;
  wire adcData_IntDatMux_Reg10_i_1_n_0;
  wire adcData_IntDatMux_Reg11_i_1_n_0;
  wire adcData_IntDatMux_Reg12_i_1_n_0;
  wire adcData_IntDatMux_Reg1_i_1_n_0;
  wire adcData_IntDatMux_Reg2_i_1_n_0;
  wire adcData_IntDatMux_Reg3_i_1_n_0;
  wire adcData_IntDatMux_Reg4_i_1_n_0;
  wire adcData_IntDatMux_Reg5_i_1_n_0;
  wire adcData_IntDatMux_Reg6_i_1_n_0;
  wire adcData_IntDatMux_Reg7_i_1_n_0;
  wire adcData_IntDatMux_Reg8_i_1_n_0;
  wire adcData_IntDatMux_Reg9_i_1_n_0;
  wire [13:0]dataOut_OBUF;

  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    Dat_Reg_0
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(D),
        .Q(IntDat_0));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    Dat_Reg_1
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(DatOut[6]),
        .Q(IntDat_1));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    Dat_Reg_10
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(Dat_Reg_10_0),
        .Q(IntDat_10));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    Dat_Reg_11
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(DatOut[1]),
        .Q(IntDat_11));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    Dat_Reg_12
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(Dat_Reg_12_0),
        .Q(IntDat_12));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    Dat_Reg_13
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(DatOut[0]),
        .Q(IntDat_13));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    Dat_Reg_2
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(Dat_Reg_2_0),
        .Q(IntDat_2));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    Dat_Reg_3
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(DatOut[5]),
        .Q(IntDat_3));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    Dat_Reg_4
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(Dat_Reg_4_0),
        .Q(IntDat_4));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    Dat_Reg_5
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(DatOut[4]),
        .Q(IntDat_5));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    Dat_Reg_6
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(Dat_Reg_6_0),
        .Q(IntDat_6));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    Dat_Reg_7
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(DatOut[3]),
        .Q(IntDat_7));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    Dat_Reg_8
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(Dat_Reg_8_0),
        .Q(IntDat_8));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    Dat_Reg_9
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(DatOut[2]),
        .Q(IntDat_9));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    adcData_IntDatMux_Reg0
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(adcData_IntDatMux_Reg0_i_1_n_0),
        .Q(dataOut_OBUF[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    adcData_IntDatMux_Reg0_i_1
       (.I0(IntDat_1),
        .I1(FrmClkSwapMux_OBUF),
        .I2(IntDat_0),
        .O(adcData_IntDatMux_Reg0_i_1_n_0));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    adcData_IntDatMux_Reg1
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(adcData_IntDatMux_Reg1_i_1_n_0),
        .Q(dataOut_OBUF[1]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    adcData_IntDatMux_Reg10
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(adcData_IntDatMux_Reg10_i_1_n_0),
        .Q(dataOut_OBUF[10]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    adcData_IntDatMux_Reg10_i_1
       (.I0(IntDat_11),
        .I1(FrmClkSwapMux_OBUF),
        .I2(IntDat_10),
        .O(adcData_IntDatMux_Reg10_i_1_n_0));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    adcData_IntDatMux_Reg11
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(adcData_IntDatMux_Reg11_i_1_n_0),
        .Q(dataOut_OBUF[11]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    adcData_IntDatMux_Reg11_i_1
       (.I0(IntDat_10),
        .I1(FrmClkSwapMux_OBUF),
        .I2(IntDat_11),
        .O(adcData_IntDatMux_Reg11_i_1_n_0));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    adcData_IntDatMux_Reg12
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(adcData_IntDatMux_Reg12_i_1_n_0),
        .Q(dataOut_OBUF[12]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    adcData_IntDatMux_Reg12_i_1
       (.I0(IntDat_13),
        .I1(FrmClkSwapMux_OBUF),
        .I2(IntDat_12),
        .O(adcData_IntDatMux_Reg12_i_1_n_0));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    adcData_IntDatMux_Reg13
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(IntDatMux_reg),
        .Q(dataOut_OBUF[13]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    adcData_IntDatMux_Reg13_i_1
       (.I0(IntDat_12),
        .I1(FrmClkSwapMux_OBUF),
        .I2(IntDat_13),
        .O(IntDatMux_reg));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    adcData_IntDatMux_Reg1_i_1
       (.I0(IntDat_0),
        .I1(FrmClkSwapMux_OBUF),
        .I2(IntDat_1),
        .O(adcData_IntDatMux_Reg1_i_1_n_0));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    adcData_IntDatMux_Reg2
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(adcData_IntDatMux_Reg2_i_1_n_0),
        .Q(dataOut_OBUF[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    adcData_IntDatMux_Reg2_i_1
       (.I0(IntDat_3),
        .I1(FrmClkSwapMux_OBUF),
        .I2(IntDat_2),
        .O(adcData_IntDatMux_Reg2_i_1_n_0));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    adcData_IntDatMux_Reg3
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(adcData_IntDatMux_Reg3_i_1_n_0),
        .Q(dataOut_OBUF[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    adcData_IntDatMux_Reg3_i_1
       (.I0(IntDat_2),
        .I1(FrmClkSwapMux_OBUF),
        .I2(IntDat_3),
        .O(adcData_IntDatMux_Reg3_i_1_n_0));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    adcData_IntDatMux_Reg4
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(adcData_IntDatMux_Reg4_i_1_n_0),
        .Q(dataOut_OBUF[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    adcData_IntDatMux_Reg4_i_1
       (.I0(IntDat_5),
        .I1(FrmClkSwapMux_OBUF),
        .I2(IntDat_4),
        .O(adcData_IntDatMux_Reg4_i_1_n_0));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    adcData_IntDatMux_Reg5
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(adcData_IntDatMux_Reg5_i_1_n_0),
        .Q(dataOut_OBUF[5]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    adcData_IntDatMux_Reg5_i_1
       (.I0(IntDat_4),
        .I1(FrmClkSwapMux_OBUF),
        .I2(IntDat_5),
        .O(adcData_IntDatMux_Reg5_i_1_n_0));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    adcData_IntDatMux_Reg6
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(adcData_IntDatMux_Reg6_i_1_n_0),
        .Q(dataOut_OBUF[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    adcData_IntDatMux_Reg6_i_1
       (.I0(IntDat_7),
        .I1(FrmClkSwapMux_OBUF),
        .I2(IntDat_6),
        .O(adcData_IntDatMux_Reg6_i_1_n_0));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    adcData_IntDatMux_Reg7
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(adcData_IntDatMux_Reg7_i_1_n_0),
        .Q(dataOut_OBUF[7]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    adcData_IntDatMux_Reg7_i_1
       (.I0(IntDat_6),
        .I1(FrmClkSwapMux_OBUF),
        .I2(IntDat_7),
        .O(adcData_IntDatMux_Reg7_i_1_n_0));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    adcData_IntDatMux_Reg8
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(adcData_IntDatMux_Reg8_i_1_n_0),
        .Q(dataOut_OBUF[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    adcData_IntDatMux_Reg8_i_1
       (.I0(IntDat_9),
        .I1(FrmClkSwapMux_OBUF),
        .I2(IntDat_8),
        .O(adcData_IntDatMux_Reg8_i_1_n_0));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    adcData_IntDatMux_Reg9
       (.C(CLK),
        .CE(IntDatEna),
        .CLR(FrmClkReSyncOut_OBUF),
        .D(adcData_IntDatMux_Reg9_i_1_n_0),
        .Q(dataOut_OBUF[9]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    adcData_IntDatMux_Reg9_i_1
       (.I0(IntDat_8),
        .I1(FrmClkSwapMux_OBUF),
        .I2(IntDat_9),
        .O(adcData_IntDatMux_Reg9_i_1_n_0));
endmodule

module DataOutModule
   (FDCE_instOut3_0,
    DataOut,
    FDCE_inst_FrmLsbMsb_d,
    FDCE_inst_FrmLsbMsb_d_0,
    IntSrlOut,
    CLK,
    IntRstIn_d);
  output FDCE_instOut3_0;
  output [3:0]DataOut;
  input [0:0]FDCE_inst_FrmLsbMsb_d;
  input FDCE_inst_FrmLsbMsb_d_0;
  input [3:0]IntSrlOut;
  input CLK;
  input IntRstIn_d;

  wire CLK;
  wire [3:0]DataOut;
  wire FDCE_instOut3_0;
  wire [0:0]FDCE_inst_FrmLsbMsb_d;
  wire FDCE_inst_FrmLsbMsb_d_0;
  wire IntRstIn_d;
  wire [3:0]IntSrlOut;

  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_instOut0
       (.C(CLK),
        .CE(1'b1),
        .CLR(IntRstIn_d),
        .D(IntSrlOut[0]),
        .Q(DataOut[0]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_instOut1
       (.C(CLK),
        .CE(1'b1),
        .CLR(IntRstIn_d),
        .D(IntSrlOut[1]),
        .Q(DataOut[1]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_instOut2
       (.C(CLK),
        .CE(1'b1),
        .CLR(IntRstIn_d),
        .D(IntSrlOut[2]),
        .Q(DataOut[2]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_instOut3
       (.C(CLK),
        .CE(1'b1),
        .CLR(IntRstIn_d),
        .D(IntSrlOut[3]),
        .Q(DataOut[3]));
  LUT4 #(
    .INIT(16'h0080)) 
    FDCE_inst_FrmLsbMsb_d_i_1
       (.I0(DataOut[3]),
        .I1(DataOut[2]),
        .I2(FDCE_inst_FrmLsbMsb_d),
        .I3(FDCE_inst_FrmLsbMsb_d_0),
        .O(FDCE_instOut3_0));
endmodule

(* ORIG_REF_NAME = "DataOutModule" *) 
module DataOutModule_6
   (CE,
    FDCE_instOut3_0,
    FDCE_instOut0_0,
    FDCE_instOut1_0,
    FDCE_instOut2_0,
    DataOut,
    IntFrmEqu_d,
    CE1,
    IntSrlOut,
    CLK,
    IntRstIn_d);
  output CE;
  output [3:0]FDCE_instOut3_0;
  output FDCE_instOut0_0;
  output FDCE_instOut1_0;
  output FDCE_instOut2_0;
  input [3:0]DataOut;
  input IntFrmEqu_d;
  input CE1;
  input [3:0]IntSrlOut;
  input CLK;
  input IntRstIn_d;

  wire CE;
  wire CE1;
  wire CLK;
  wire [3:0]DataOut;
  wire FDCE_instOut0_0;
  wire FDCE_instOut1_0;
  wire FDCE_instOut2_0;
  wire [3:0]FDCE_instOut3_0;
  wire FDCE_inst_FrmEqu_d_i_2_n_0;
  wire FDCE_inst_FrmSwapMux_d_i_3_n_0;
  wire IntFrmEqu_d;
  wire IntRstIn_d;
  wire [3:0]IntSrlOut;

  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_instOut0
       (.C(CLK),
        .CE(1'b1),
        .CLR(IntRstIn_d),
        .D(IntSrlOut[0]),
        .Q(FDCE_instOut3_0[0]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_instOut1
       (.C(CLK),
        .CE(1'b1),
        .CLR(IntRstIn_d),
        .D(IntSrlOut[1]),
        .Q(FDCE_instOut3_0[1]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_instOut2
       (.C(CLK),
        .CE(1'b1),
        .CLR(IntRstIn_d),
        .D(IntSrlOut[2]),
        .Q(FDCE_instOut3_0[2]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_instOut3
       (.C(CLK),
        .CE(1'b1),
        .CLR(IntRstIn_d),
        .D(IntSrlOut[3]),
        .Q(FDCE_instOut3_0[3]));
  LUT6 #(
    .INIT(64'h2800002800000000)) 
    FDCE_inst_FrmEqu_d_i_1
       (.I0(FDCE_inst_FrmEqu_d_i_2_n_0),
        .I1(DataOut[0]),
        .I2(FDCE_instOut3_0[0]),
        .I3(DataOut[3]),
        .I4(FDCE_instOut3_0[3]),
        .I5(CE1),
        .O(FDCE_instOut0_0));
  LUT5 #(
    .INIT(32'h80000001)) 
    FDCE_inst_FrmEqu_d_i_2
       (.I0(FDCE_instOut3_0[3]),
        .I1(DataOut[2]),
        .I2(FDCE_instOut3_0[2]),
        .I3(DataOut[1]),
        .I4(FDCE_instOut3_0[1]),
        .O(FDCE_inst_FrmEqu_d_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT5 #(
    .INIT(32'hF77FFFFF)) 
    FDCE_inst_FrmLsbMsb_d_i_2
       (.I0(DataOut[1]),
        .I1(FDCE_instOut3_0[2]),
        .I2(FDCE_instOut3_0[0]),
        .I3(DataOut[0]),
        .I4(FDCE_instOut3_0[1]),
        .O(FDCE_instOut1_0));
  LUT6 #(
    .INIT(64'h0000000028000028)) 
    FDCE_inst_FrmSwapMux_d_i_1
       (.I0(FDCE_inst_FrmEqu_d_i_2_n_0),
        .I1(DataOut[0]),
        .I2(FDCE_instOut3_0[0]),
        .I3(DataOut[3]),
        .I4(FDCE_instOut3_0[3]),
        .I5(IntFrmEqu_d),
        .O(CE));
  LUT5 #(
    .INIT(32'h00008001)) 
    FDCE_inst_FrmSwapMux_d_i_2
       (.I0(FDCE_instOut3_0[2]),
        .I1(FDCE_instOut3_0[3]),
        .I2(DataOut[2]),
        .I3(DataOut[3]),
        .I4(FDCE_inst_FrmSwapMux_d_i_3_n_0),
        .O(FDCE_instOut2_0));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT5 #(
    .INIT(32'hF7FFFFEF)) 
    FDCE_inst_FrmSwapMux_d_i_3
       (.I0(DataOut[1]),
        .I1(FDCE_instOut3_0[2]),
        .I2(DataOut[0]),
        .I3(FDCE_instOut3_0[1]),
        .I4(FDCE_instOut3_0[0]),
        .O(FDCE_inst_FrmSwapMux_d_i_3_n_0));
endmodule

module EquCntModule
   (EquCnt_3_0,
    IntRstSet,
    D,
    E,
    IntRstIn_d,
    IntEqu,
    CLK,
    FDSE_instrstIn7,
    IntSlipCnt_d,
    SRLC32E_instintreg0,
    SRLC32E_instintreg0_0,
    SRLC32E_instintreg0_1);
  output [1:0]EquCnt_3_0;
  output IntRstSet;
  output [2:0]D;
  output [0:0]E;
  input IntRstIn_d;
  input IntEqu;
  input CLK;
  input FDSE_instrstIn7;
  input [2:0]IntSlipCnt_d;
  input SRLC32E_instintreg0;
  input SRLC32E_instintreg0_0;
  input SRLC32E_instintreg0_1;

  wire CLK;
  wire [2:0]D;
  wire [0:0]E;
  wire EquCnt_0_i_1__0_n_0;
  wire EquCnt_1_i_1__0_n_0;
  wire EquCnt_2_i_1__0_n_0;
  wire [1:0]EquCnt_3_0;
  wire EquCnt_3_i_1__0_n_0;
  wire FDSE_instrstIn7;
  wire \IntAddr_reg[2]_i_3__0_n_0 ;
  wire \IntAddr_reg[2]_i_4__0_n_0 ;
  wire \IntAddr_reg[2]_i_5__0_n_0 ;
  wire \IntAddr_reg[2]_i_6__0_n_0 ;
  wire IntEqu;
  wire [1:0]IntEquCnt_d;
  wire IntRstIn_d;
  wire IntRstSet;
  wire [2:0]IntSlipCnt_d;
  wire SRLC32E_instintreg0;
  wire SRLC32E_instintreg0_0;
  wire SRLC32E_instintreg0_1;

  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    EquCnt_0
       (.C(CLK),
        .CE(IntEqu),
        .D(EquCnt_0_i_1__0_n_0),
        .Q(IntEquCnt_d[0]),
        .R(IntRstIn_d));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'h69)) 
    EquCnt_0_i_1__0
       (.I0(EquCnt_3_0[0]),
        .I1(EquCnt_3_0[1]),
        .I2(IntEquCnt_d[1]),
        .O(EquCnt_0_i_1__0_n_0));
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    EquCnt_1
       (.C(CLK),
        .CE(IntEqu),
        .D(EquCnt_1_i_1__0_n_0),
        .Q(IntEquCnt_d[1]),
        .R(IntRstIn_d));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT4 #(
    .INIT(16'h9F90)) 
    EquCnt_1_i_1__0
       (.I0(EquCnt_3_0[0]),
        .I1(EquCnt_3_0[1]),
        .I2(IntEquCnt_d[0]),
        .I3(IntEquCnt_d[1]),
        .O(EquCnt_1_i_1__0_n_0));
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    EquCnt_2
       (.C(CLK),
        .CE(IntEqu),
        .D(EquCnt_2_i_1__0_n_0),
        .Q(EquCnt_3_0[0]),
        .R(IntRstIn_d));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT4 #(
    .INIT(16'hBF10)) 
    EquCnt_2_i_1__0
       (.I0(IntEquCnt_d[0]),
        .I1(EquCnt_3_0[1]),
        .I2(IntEquCnt_d[1]),
        .I3(EquCnt_3_0[0]),
        .O(EquCnt_2_i_1__0_n_0));
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    EquCnt_3
       (.C(CLK),
        .CE(IntEqu),
        .D(EquCnt_3_i_1__0_n_0),
        .Q(EquCnt_3_0[1]),
        .R(IntRstIn_d));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT4 #(
    .INIT(16'hCDC8)) 
    EquCnt_3_i_1__0
       (.I0(IntEquCnt_d[0]),
        .I1(EquCnt_3_0[1]),
        .I2(IntEquCnt_d[1]),
        .I3(EquCnt_3_0[0]),
        .O(EquCnt_3_i_1__0_n_0));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    FDSE_instrstIn0_i_1__0
       (.I0(IntEquCnt_d[1]),
        .I1(EquCnt_3_0[1]),
        .I2(FDSE_instrstIn7),
        .I3(IntSlipCnt_d[0]),
        .I4(EquCnt_3_0[0]),
        .I5(IntEquCnt_d[0]),
        .O(IntRstSet));
  LUT5 #(
    .INIT(32'h03008888)) 
    \IntAddr_reg[0]_i_1__0 
       (.I0(SRLC32E_instintreg0),
        .I1(IntEquCnt_d[0]),
        .I2(EquCnt_3_0[0]),
        .I3(SRLC32E_instintreg0_0),
        .I4(IntEquCnt_d[1]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h0010004000000000)) 
    \IntAddr_reg[1]_i_1__0 
       (.I0(EquCnt_3_0[0]),
        .I1(IntSlipCnt_d[0]),
        .I2(SRLC32E_instintreg0_1),
        .I3(EquCnt_3_0[1]),
        .I4(IntEquCnt_d[1]),
        .I5(IntEquCnt_d[0]),
        .O(D[1]));
  MUXF7 \IntAddr_reg[2]_i_1__0 
       (.I0(\IntAddr_reg[2]_i_3__0_n_0 ),
        .I1(\IntAddr_reg[2]_i_4__0_n_0 ),
        .O(D[2]),
        .S(IntEquCnt_d[0]));
  MUXF7 \IntAddr_reg[2]_i_2__0 
       (.I0(\IntAddr_reg[2]_i_5__0_n_0 ),
        .I1(\IntAddr_reg[2]_i_6__0_n_0 ),
        .O(E),
        .S(IntEquCnt_d[0]));
  LUT6 #(
    .INIT(64'hFBFFFFFBFFFFFFFF)) 
    \IntAddr_reg[2]_i_3__0 
       (.I0(EquCnt_3_0[1]),
        .I1(IntSlipCnt_d[1]),
        .I2(IntSlipCnt_d[2]),
        .I3(IntSlipCnt_d[0]),
        .I4(EquCnt_3_0[0]),
        .I5(IntEquCnt_d[1]),
        .O(\IntAddr_reg[2]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFEFFFDFFF)) 
    \IntAddr_reg[2]_i_4__0 
       (.I0(IntEquCnt_d[1]),
        .I1(EquCnt_3_0[1]),
        .I2(IntSlipCnt_d[1]),
        .I3(IntSlipCnt_d[2]),
        .I4(IntSlipCnt_d[0]),
        .I5(EquCnt_3_0[0]),
        .O(\IntAddr_reg[2]_i_4__0_n_0 ));
  LUT6 #(
    .INIT(64'h0200000000000201)) 
    \IntAddr_reg[2]_i_5__0 
       (.I0(IntEquCnt_d[1]),
        .I1(EquCnt_3_0[1]),
        .I2(IntSlipCnt_d[2]),
        .I3(IntSlipCnt_d[1]),
        .I4(IntSlipCnt_d[0]),
        .I5(EquCnt_3_0[0]),
        .O(\IntAddr_reg[2]_i_5__0_n_0 ));
  LUT6 #(
    .INIT(64'h0002000010002000)) 
    \IntAddr_reg[2]_i_6__0 
       (.I0(IntEquCnt_d[1]),
        .I1(EquCnt_3_0[1]),
        .I2(IntSlipCnt_d[2]),
        .I3(IntSlipCnt_d[1]),
        .I4(IntSlipCnt_d[0]),
        .I5(EquCnt_3_0[0]),
        .O(\IntAddr_reg[2]_i_6__0_n_0 ));
endmodule

(* ORIG_REF_NAME = "EquCntModule" *) 
module EquCntModule_1
   (EquCnt_3_0,
    IntRstSet,
    D,
    E,
    IntRstIn_d,
    IntEqu,
    CLK,
    FDSE_instrstIn7,
    IntSlipCnt_d,
    SRLC32E_instintreg0,
    SRLC32E_instintreg0_0,
    SRLC32E_instintreg0_1);
  output [1:0]EquCnt_3_0;
  output IntRstSet;
  output [2:0]D;
  output [0:0]E;
  input IntRstIn_d;
  input IntEqu;
  input CLK;
  input FDSE_instrstIn7;
  input [2:0]IntSlipCnt_d;
  input SRLC32E_instintreg0;
  input SRLC32E_instintreg0_0;
  input SRLC32E_instintreg0_1;

  wire CLK;
  wire [2:0]D;
  wire [0:0]E;
  wire EquCnt_0_i_1_n_0;
  wire EquCnt_1_i_1_n_0;
  wire EquCnt_2_i_1_n_0;
  wire [1:0]EquCnt_3_0;
  wire EquCnt_3_i_1_n_0;
  wire FDSE_instrstIn7;
  wire \IntAddr_reg[2]_i_3_n_0 ;
  wire \IntAddr_reg[2]_i_4_n_0 ;
  wire \IntAddr_reg[2]_i_5_n_0 ;
  wire \IntAddr_reg[2]_i_6_n_0 ;
  wire IntEqu;
  wire [1:0]IntEquCnt_d;
  wire IntRstIn_d;
  wire IntRstSet;
  wire [2:0]IntSlipCnt_d;
  wire SRLC32E_instintreg0;
  wire SRLC32E_instintreg0_0;
  wire SRLC32E_instintreg0_1;

  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    EquCnt_0
       (.C(CLK),
        .CE(IntEqu),
        .D(EquCnt_0_i_1_n_0),
        .Q(IntEquCnt_d[0]),
        .R(IntRstIn_d));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'h69)) 
    EquCnt_0_i_1
       (.I0(EquCnt_3_0[0]),
        .I1(EquCnt_3_0[1]),
        .I2(IntEquCnt_d[1]),
        .O(EquCnt_0_i_1_n_0));
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    EquCnt_1
       (.C(CLK),
        .CE(IntEqu),
        .D(EquCnt_1_i_1_n_0),
        .Q(IntEquCnt_d[1]),
        .R(IntRstIn_d));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'h9F90)) 
    EquCnt_1_i_1
       (.I0(EquCnt_3_0[0]),
        .I1(EquCnt_3_0[1]),
        .I2(IntEquCnt_d[0]),
        .I3(IntEquCnt_d[1]),
        .O(EquCnt_1_i_1_n_0));
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    EquCnt_2
       (.C(CLK),
        .CE(IntEqu),
        .D(EquCnt_2_i_1_n_0),
        .Q(EquCnt_3_0[0]),
        .R(IntRstIn_d));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT4 #(
    .INIT(16'hBF10)) 
    EquCnt_2_i_1
       (.I0(IntEquCnt_d[0]),
        .I1(EquCnt_3_0[1]),
        .I2(IntEquCnt_d[1]),
        .I3(EquCnt_3_0[0]),
        .O(EquCnt_2_i_1_n_0));
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    EquCnt_3
       (.C(CLK),
        .CE(IntEqu),
        .D(EquCnt_3_i_1_n_0),
        .Q(EquCnt_3_0[1]),
        .R(IntRstIn_d));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'hCDC8)) 
    EquCnt_3_i_1
       (.I0(IntEquCnt_d[0]),
        .I1(EquCnt_3_0[1]),
        .I2(IntEquCnt_d[1]),
        .I3(EquCnt_3_0[0]),
        .O(EquCnt_3_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    FDSE_instrstIn0_i_1
       (.I0(IntEquCnt_d[1]),
        .I1(EquCnt_3_0[1]),
        .I2(FDSE_instrstIn7),
        .I3(IntSlipCnt_d[0]),
        .I4(EquCnt_3_0[0]),
        .I5(IntEquCnt_d[0]),
        .O(IntRstSet));
  LUT5 #(
    .INIT(32'h03008888)) 
    \IntAddr_reg[0]_i_1 
       (.I0(SRLC32E_instintreg0),
        .I1(IntEquCnt_d[0]),
        .I2(EquCnt_3_0[0]),
        .I3(SRLC32E_instintreg0_0),
        .I4(IntEquCnt_d[1]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h0010004000000000)) 
    \IntAddr_reg[1]_i_1 
       (.I0(EquCnt_3_0[0]),
        .I1(IntSlipCnt_d[0]),
        .I2(SRLC32E_instintreg0_1),
        .I3(EquCnt_3_0[1]),
        .I4(IntEquCnt_d[1]),
        .I5(IntEquCnt_d[0]),
        .O(D[1]));
  MUXF7 \IntAddr_reg[2]_i_1 
       (.I0(\IntAddr_reg[2]_i_3_n_0 ),
        .I1(\IntAddr_reg[2]_i_4_n_0 ),
        .O(D[2]),
        .S(IntEquCnt_d[0]));
  MUXF7 \IntAddr_reg[2]_i_2 
       (.I0(\IntAddr_reg[2]_i_5_n_0 ),
        .I1(\IntAddr_reg[2]_i_6_n_0 ),
        .O(E),
        .S(IntEquCnt_d[0]));
  LUT6 #(
    .INIT(64'hFBFFFFFBFFFFFFFF)) 
    \IntAddr_reg[2]_i_3 
       (.I0(EquCnt_3_0[1]),
        .I1(IntSlipCnt_d[1]),
        .I2(IntSlipCnt_d[2]),
        .I3(IntSlipCnt_d[0]),
        .I4(EquCnt_3_0[0]),
        .I5(IntEquCnt_d[1]),
        .O(\IntAddr_reg[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFEFFFDFFF)) 
    \IntAddr_reg[2]_i_4 
       (.I0(IntEquCnt_d[1]),
        .I1(EquCnt_3_0[1]),
        .I2(IntSlipCnt_d[1]),
        .I3(IntSlipCnt_d[2]),
        .I4(IntSlipCnt_d[0]),
        .I5(EquCnt_3_0[0]),
        .O(\IntAddr_reg[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0200000000000201)) 
    \IntAddr_reg[2]_i_5 
       (.I0(IntEquCnt_d[1]),
        .I1(EquCnt_3_0[1]),
        .I2(IntSlipCnt_d[2]),
        .I3(IntSlipCnt_d[1]),
        .I4(IntSlipCnt_d[0]),
        .I5(EquCnt_3_0[0]),
        .O(\IntAddr_reg[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0002000010002000)) 
    \IntAddr_reg[2]_i_6 
       (.I0(IntEquCnt_d[1]),
        .I1(EquCnt_3_0[1]),
        .I2(IntSlipCnt_d[2]),
        .I3(IntSlipCnt_d[1]),
        .I4(IntSlipCnt_d[0]),
        .I5(EquCnt_3_0[0]),
        .O(\IntAddr_reg[2]_i_6_n_0 ));
endmodule

module FCLKSrdsReg
   (CE1,
    FrmClkDat_OBUF,
    IntFrmLsbRegEna_d_reg_0,
    IntFrmMsbRegEna_d_reg_0,
    IntFrmEqu_d,
    FDCE_inst_FrmSwapMux_d_0,
    FrmClkReSyncOut_OBUF,
    FrmClkSyncWarn_OBUF,
    Q,
    CLK,
    AdcReSync_IBUF,
    DataOut,
    AR,
    FDCE_inst_reg7_0,
    FDCE_inst_FrmEqu_d_0,
    CE,
    FDCE_inst_FrmSwapMux_d_1,
    FDCE_inst_FrmLsbMsb_d_0,
    FrmClkEna,
    BitClkDone_OBUF,
    IntFrmDbleNibFnlOdd_d,
    IntFrmDbleNibFnlEvn_d,
    lopt);
  output CE1;
  output [15:0]FrmClkDat_OBUF;
  output IntFrmLsbRegEna_d_reg_0;
  output IntFrmMsbRegEna_d_reg_0;
  output IntFrmEqu_d;
  output FDCE_inst_FrmSwapMux_d_0;
  output FrmClkReSyncOut_OBUF;
  output FrmClkSyncWarn_OBUF;
  output [1:0]Q;
  input CLK;
  input AdcReSync_IBUF;
  input [3:0]DataOut;
  input [0:0]AR;
  input [3:0]FDCE_inst_reg7_0;
  input FDCE_inst_FrmEqu_d_0;
  input CE;
  input FDCE_inst_FrmSwapMux_d_1;
  input FDCE_inst_FrmLsbMsb_d_0;
  input FrmClkEna;
  input BitClkDone_OBUF;
  input IntFrmDbleNibFnlOdd_d;
  input IntFrmDbleNibFnlEvn_d;
  output lopt;

  wire [0:0]AR;
  wire AdcReSync_IBUF;
  wire BitClkDone_OBUF;
  wire CE;
  wire CE1;
  wire CLK;
  wire D0_out;
  wire D__0;
  wire [3:0]DataOut;
  wire FDCE_inst2_1_i_1_n_0;
  wire FDCE_inst2_2_i_1_n_0;
  wire FDCE_inst2_3_i_1_n_0;
  wire FDCE_inst2_4_i_1_n_0;
  wire FDCE_inst2_5_i_1_n_0;
  wire FDCE_inst2_6_i_1_n_0;
  wire FDCE_inst_FrmEqu_d_0;
  wire FDCE_inst_FrmLsbMsb_d_0;
  wire FDCE_inst_FrmSwapMux_d_0;
  wire FDCE_inst_FrmSwapMux_d_1;
  wire FDCE_inst_FrmSwapMux_d_lopt_replica_1;
  wire FDCE_inst_reg2_1_n_0;
  wire FDCE_inst_reg2_2_n_0;
  wire FDCE_inst_reg2_3_n_0;
  wire FDCE_inst_reg2_4_n_0;
  wire FDCE_inst_reg2_5_n_0;
  wire FDCE_inst_reg2_6_n_0;
  wire FDCE_inst_reg2_7_n_0;
  wire [3:0]FDCE_inst_reg7_0;
  wire [15:0]FrmClkDat_OBUF;
  wire FrmClkEna;
  wire FrmClkReSyncOut_OBUF;
  wire FrmClkSyncWarn_OBUF;
  wire [5:2]IntFrmBitSlip;
  wire \IntFrmBitSlip[0]_i_2_n_0 ;
  wire \IntFrmBitSlip[1]_i_2_n_0 ;
  wire \IntFrmBitSlip[5]_i_1_n_0 ;
  wire [4:0]IntFrmBitSlip_1;
  wire IntFrmDatMux_reg;
  wire IntFrmDat_0;
  wire IntFrmDat_1;
  wire IntFrmDat_2;
  wire IntFrmDat_3;
  wire IntFrmDat_4;
  wire IntFrmDat_5;
  wire IntFrmDat_6;
  wire IntFrmDat_7;
  wire IntFrmDbleNibFnlEvn_d;
  wire IntFrmDbleNibFnlOdd_d;
  wire IntFrmEquSet_d;
  wire IntFrmEqu_d;
  wire IntFrmEvntCnt0;
  wire IntFrmEvntCntTc_d;
  wire IntFrmEvntCntTc_d_i_2_n_0;
  wire [3:0]IntFrmEvntCnt_reg;
  wire IntFrmLsbMsb_d;
  wire IntFrmLsbRegEna_d_i_1_n_0;
  wire IntFrmLsbRegEna_d_reg_0;
  wire IntFrmMsbRegEna_d_i_1_n_0;
  wire IntFrmMsbRegEna_d_reg_0;
  wire IntFrmReSyncOut_n_0;
  wire IntFrmRegEna_d;
  wire IntFrmRegEna_d_i_1_n_0;
  wire IntFrmSlipCntTc_d;
  wire IntFrmSlipCntTc_d1;
  wire IntFrmSlipCntTc_d2;
  wire IntFrmSlipCntTc_d_i_1_n_0;
  wire [4:0]IntFrmSlipCnt_reg;
  wire [2:0]IntFrmWarnCnt;
  wire \IntFrmWarnCnt[0]_i_1_n_0 ;
  wire \IntFrmWarnCnt[1]_i_1_n_0 ;
  wire \IntFrmWarnCnt[2]_i_1_n_0 ;
  wire [1:0]Q;
  wire Q_0;
  wire SigOut;
  wire \eqOp_inferred__1/i__n_0 ;
  wire [3:0]plusOp;
  wire [4:0]plusOp__0;

  assign lopt = FDCE_inst_FrmSwapMux_d_lopt_replica_1;
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    FDCE_inst2_0_i_1
       (.I0(IntFrmDat_1),
        .I1(FDCE_inst_FrmSwapMux_d_0),
        .I2(IntFrmDat_0),
        .O(D__0));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    FDCE_inst2_1_i_1
       (.I0(IntFrmDat_0),
        .I1(FDCE_inst_FrmSwapMux_d_0),
        .I2(IntFrmDat_1),
        .O(FDCE_inst2_1_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    FDCE_inst2_2_i_1
       (.I0(IntFrmDat_3),
        .I1(FDCE_inst_FrmSwapMux_d_0),
        .I2(IntFrmDat_2),
        .O(FDCE_inst2_2_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    FDCE_inst2_3_i_1
       (.I0(IntFrmDat_2),
        .I1(FDCE_inst_FrmSwapMux_d_0),
        .I2(IntFrmDat_3),
        .O(FDCE_inst2_3_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    FDCE_inst2_4_i_1
       (.I0(IntFrmDat_5),
        .I1(FDCE_inst_FrmSwapMux_d_0),
        .I2(IntFrmDat_4),
        .O(FDCE_inst2_4_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    FDCE_inst2_5_i_1
       (.I0(IntFrmDat_4),
        .I1(FDCE_inst_FrmSwapMux_d_0),
        .I2(IntFrmDat_5),
        .O(FDCE_inst2_5_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    FDCE_inst2_6_i_1
       (.I0(IntFrmDat_7),
        .I1(FDCE_inst_FrmSwapMux_d_0),
        .I2(IntFrmDat_6),
        .O(FDCE_inst2_6_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    FDCE_inst2_7_i_1
       (.I0(IntFrmDat_6),
        .I1(FDCE_inst_FrmSwapMux_d_0),
        .I2(IntFrmDat_7),
        .O(IntFrmDatMux_reg));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_FrmClkLsb0
       (.C(CLK),
        .CE(IntFrmLsbRegEna_d_reg_0),
        .CLR(AR),
        .D(Q_0),
        .Q(FrmClkDat_OBUF[0]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_FrmClkLsb1
       (.C(CLK),
        .CE(IntFrmLsbRegEna_d_reg_0),
        .CLR(AR),
        .D(FDCE_inst_reg2_1_n_0),
        .Q(FrmClkDat_OBUF[1]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_FrmClkLsb2
       (.C(CLK),
        .CE(IntFrmLsbRegEna_d_reg_0),
        .CLR(AR),
        .D(FDCE_inst_reg2_2_n_0),
        .Q(FrmClkDat_OBUF[2]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_FrmClkLsb3
       (.C(CLK),
        .CE(IntFrmLsbRegEna_d_reg_0),
        .CLR(AR),
        .D(FDCE_inst_reg2_3_n_0),
        .Q(FrmClkDat_OBUF[3]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_FrmClkLsb4
       (.C(CLK),
        .CE(IntFrmLsbRegEna_d_reg_0),
        .CLR(AR),
        .D(FDCE_inst_reg2_4_n_0),
        .Q(FrmClkDat_OBUF[4]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_FrmClkLsb5
       (.C(CLK),
        .CE(IntFrmLsbRegEna_d_reg_0),
        .CLR(AR),
        .D(FDCE_inst_reg2_5_n_0),
        .Q(FrmClkDat_OBUF[5]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_FrmClkLsb6
       (.C(CLK),
        .CE(IntFrmLsbRegEna_d_reg_0),
        .CLR(AR),
        .D(FDCE_inst_reg2_6_n_0),
        .Q(FrmClkDat_OBUF[6]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_FrmClkLsb7
       (.C(CLK),
        .CE(IntFrmLsbRegEna_d_reg_0),
        .CLR(AR),
        .D(FDCE_inst_reg2_7_n_0),
        .Q(FrmClkDat_OBUF[7]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_FrmClkMsb10
       (.C(CLK),
        .CE(IntFrmMsbRegEna_d_reg_0),
        .CLR(AR),
        .D(FDCE_inst_reg2_2_n_0),
        .Q(FrmClkDat_OBUF[10]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_FrmClkMsb11
       (.C(CLK),
        .CE(IntFrmMsbRegEna_d_reg_0),
        .CLR(AR),
        .D(FDCE_inst_reg2_3_n_0),
        .Q(FrmClkDat_OBUF[11]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_FrmClkMsb12
       (.C(CLK),
        .CE(IntFrmMsbRegEna_d_reg_0),
        .CLR(AR),
        .D(FDCE_inst_reg2_4_n_0),
        .Q(FrmClkDat_OBUF[12]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_FrmClkMsb13
       (.C(CLK),
        .CE(IntFrmMsbRegEna_d_reg_0),
        .CLR(AR),
        .D(FDCE_inst_reg2_5_n_0),
        .Q(FrmClkDat_OBUF[13]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_FrmClkMsb14
       (.C(CLK),
        .CE(IntFrmMsbRegEna_d_reg_0),
        .CLR(AR),
        .D(FDCE_inst_reg2_6_n_0),
        .Q(FrmClkDat_OBUF[14]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_FrmClkMsb15
       (.C(CLK),
        .CE(IntFrmMsbRegEna_d_reg_0),
        .CLR(AR),
        .D(FDCE_inst_reg2_7_n_0),
        .Q(FrmClkDat_OBUF[15]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_FrmClkMsb8
       (.C(CLK),
        .CE(IntFrmMsbRegEna_d_reg_0),
        .CLR(AR),
        .D(Q_0),
        .Q(FrmClkDat_OBUF[8]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_FrmClkMsb9
       (.C(CLK),
        .CE(IntFrmMsbRegEna_d_reg_0),
        .CLR(AR),
        .D(FDCE_inst_reg2_1_n_0),
        .Q(FrmClkDat_OBUF[9]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_FrmEqu_d
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(FDCE_inst_FrmEqu_d_0),
        .Q(IntFrmEqu_d));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_FrmLsbMsb_d
       (.C(CLK),
        .CE(CE),
        .CLR(AR),
        .D(FDCE_inst_FrmLsbMsb_d_0),
        .Q(IntFrmLsbMsb_d));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_FrmSwapMux_d
       (.C(CLK),
        .CE(CE),
        .CLR(AR),
        .D(FDCE_inst_FrmSwapMux_d_1),
        .Q(FDCE_inst_FrmSwapMux_d_0));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_FrmSwapMux_d_lopt_replica
       (.C(CLK),
        .CE(CE),
        .CLR(AR),
        .D(FDCE_inst_FrmSwapMux_d_1),
        .Q(FDCE_inst_FrmSwapMux_d_lopt_replica_1));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_ReSync
       (.C(CLK),
        .CE(1'b1),
        .CLR(1'b0),
        .D(IntFrmReSyncOut_n_0),
        .Q(FrmClkReSyncOut_OBUF));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_SlipCntTc_1
       (.C(CLK),
        .CE(IntFrmSlipCntTc_d),
        .CLR(IntFrmSlipCntTc_d2),
        .D(1'b1),
        .Q(IntFrmSlipCntTc_d1));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_SlipCntTc_2
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(D0_out),
        .Q(IntFrmSlipCntTc_d2));
  LUT2 #(
    .INIT(4'h8)) 
    FDCE_inst_SlipCntTc_2_i_1
       (.I0(IntFrmSlipCntTc_d),
        .I1(IntFrmSlipCntTc_d1),
        .O(D0_out));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_done
       (.C(CLK),
        .CE(FrmClkEna),
        .CLR(AR),
        .D(BitClkDone_OBUF),
        .Q(CE1));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_reg0
       (.C(CLK),
        .CE(CE1),
        .CLR(AR),
        .D(DataOut[0]),
        .Q(IntFrmDat_0));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_reg1
       (.C(CLK),
        .CE(CE1),
        .CLR(AR),
        .D(FDCE_inst_reg7_0[0]),
        .Q(IntFrmDat_1));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_reg2
       (.C(CLK),
        .CE(CE1),
        .CLR(AR),
        .D(DataOut[1]),
        .Q(IntFrmDat_2));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_reg2_0
       (.C(CLK),
        .CE(CE1),
        .CLR(AR),
        .D(D__0),
        .Q(Q_0));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_reg2_1
       (.C(CLK),
        .CE(CE1),
        .CLR(AR),
        .D(FDCE_inst2_1_i_1_n_0),
        .Q(FDCE_inst_reg2_1_n_0));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_reg2_2
       (.C(CLK),
        .CE(CE1),
        .CLR(AR),
        .D(FDCE_inst2_2_i_1_n_0),
        .Q(FDCE_inst_reg2_2_n_0));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_reg2_3
       (.C(CLK),
        .CE(CE1),
        .CLR(AR),
        .D(FDCE_inst2_3_i_1_n_0),
        .Q(FDCE_inst_reg2_3_n_0));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_reg2_4
       (.C(CLK),
        .CE(CE1),
        .CLR(AR),
        .D(FDCE_inst2_4_i_1_n_0),
        .Q(FDCE_inst_reg2_4_n_0));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_reg2_5
       (.C(CLK),
        .CE(CE1),
        .CLR(AR),
        .D(FDCE_inst2_5_i_1_n_0),
        .Q(FDCE_inst_reg2_5_n_0));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_reg2_6
       (.C(CLK),
        .CE(CE1),
        .CLR(AR),
        .D(FDCE_inst2_6_i_1_n_0),
        .Q(FDCE_inst_reg2_6_n_0));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_reg2_7
       (.C(CLK),
        .CE(CE1),
        .CLR(AR),
        .D(IntFrmDatMux_reg),
        .Q(FDCE_inst_reg2_7_n_0));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_reg3
       (.C(CLK),
        .CE(CE1),
        .CLR(AR),
        .D(FDCE_inst_reg7_0[1]),
        .Q(IntFrmDat_3));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_reg4
       (.C(CLK),
        .CE(CE1),
        .CLR(AR),
        .D(DataOut[2]),
        .Q(IntFrmDat_4));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_reg5
       (.C(CLK),
        .CE(CE1),
        .CLR(AR),
        .D(FDCE_inst_reg7_0[2]),
        .Q(IntFrmDat_5));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_reg6
       (.C(CLK),
        .CE(CE1),
        .CLR(AR),
        .D(DataOut[3]),
        .Q(IntFrmDat_6));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_reg7
       (.C(CLK),
        .CE(CE1),
        .CLR(AR),
        .D(FDCE_inst_reg7_0[3]),
        .Q(IntFrmDat_7));
  LUT2 #(
    .INIT(4'h8)) 
    \IntFrmBitSlip[0]_i_1 
       (.I0(IntFrmEvntCntTc_d),
        .I1(\IntFrmBitSlip[0]_i_2_n_0 ),
        .O(IntFrmBitSlip_1[0]));
  LUT6 #(
    .INIT(64'h0000000001111111)) 
    \IntFrmBitSlip[0]_i_2 
       (.I0(IntFrmBitSlip[2]),
        .I1(IntFrmBitSlip[5]),
        .I2(FDCE_inst_FrmSwapMux_d_0),
        .I3(IntFrmBitSlip[3]),
        .I4(IntFrmEqu_d),
        .I5(IntFrmEquSet_d),
        .O(\IntFrmBitSlip[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0088008880000000)) 
    \IntFrmBitSlip[1]_i_1 
       (.I0(\IntFrmBitSlip[1]_i_2_n_0 ),
        .I1(IntFrmEvntCntTc_d),
        .I2(FDCE_inst_FrmSwapMux_d_0),
        .I3(IntFrmBitSlip[3]),
        .I4(IntFrmEqu_d),
        .I5(IntFrmBitSlip[2]),
        .O(IntFrmBitSlip_1[1]));
  LUT2 #(
    .INIT(4'h1)) 
    \IntFrmBitSlip[1]_i_2 
       (.I0(IntFrmBitSlip[5]),
        .I1(IntFrmEquSet_d),
        .O(\IntFrmBitSlip[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h0414)) 
    \IntFrmBitSlip[2]_i_1 
       (.I0(IntFrmBitSlip[5]),
        .I1(IntFrmEvntCntTc_d),
        .I2(IntFrmBitSlip[2]),
        .I3(IntFrmBitSlip[3]),
        .O(IntFrmBitSlip_1[2]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h0410)) 
    \IntFrmBitSlip[3]_i_1 
       (.I0(IntFrmBitSlip[5]),
        .I1(IntFrmEvntCntTc_d),
        .I2(IntFrmBitSlip[3]),
        .I3(IntFrmBitSlip[2]),
        .O(IntFrmBitSlip_1[3]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \IntFrmBitSlip[4]_i_1 
       (.I0(IntFrmBitSlip[5]),
        .I1(IntFrmBitSlip[2]),
        .I2(IntFrmBitSlip[3]),
        .O(IntFrmBitSlip_1[4]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT5 #(
    .INIT(32'hFFFFF888)) 
    \IntFrmBitSlip[5]_i_1 
       (.I0(IntFrmEvntCntTc_d),
        .I1(IntFrmEqu_d),
        .I2(IntFrmBitSlip[2]),
        .I3(IntFrmBitSlip[3]),
        .I4(IntFrmBitSlip[5]),
        .O(\IntFrmBitSlip[5]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \IntFrmBitSlip_reg[0] 
       (.C(CLK),
        .CE(IntFrmEvntCnt0),
        .CLR(AR),
        .D(IntFrmBitSlip_1[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \IntFrmBitSlip_reg[1] 
       (.C(CLK),
        .CE(IntFrmEvntCnt0),
        .CLR(AR),
        .D(IntFrmBitSlip_1[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \IntFrmBitSlip_reg[2] 
       (.C(CLK),
        .CE(IntFrmEvntCnt0),
        .CLR(AR),
        .D(IntFrmBitSlip_1[2]),
        .Q(IntFrmBitSlip[2]));
  FDCE #(
    .INIT(1'b0)) 
    \IntFrmBitSlip_reg[3] 
       (.C(CLK),
        .CE(IntFrmEvntCnt0),
        .CLR(AR),
        .D(IntFrmBitSlip_1[3]),
        .Q(IntFrmBitSlip[3]));
  FDCE #(
    .INIT(1'b0)) 
    \IntFrmBitSlip_reg[4] 
       (.C(CLK),
        .CE(IntFrmEvntCnt0),
        .CLR(AR),
        .D(IntFrmBitSlip_1[4]),
        .Q(IntFrmEquSet_d));
  FDCE #(
    .INIT(1'b0)) 
    \IntFrmBitSlip_reg[5] 
       (.C(CLK),
        .CE(IntFrmEvntCnt0),
        .CLR(AR),
        .D(\IntFrmBitSlip[5]_i_1_n_0 ),
        .Q(IntFrmBitSlip[5]));
  LUT2 #(
    .INIT(4'h2)) 
    IntFrmEvntCntTc_d_i_1
       (.I0(CE1),
        .I1(IntFrmEquSet_d),
        .O(IntFrmEvntCnt0));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    IntFrmEvntCntTc_d_i_2
       (.I0(IntFrmEvntCnt_reg[0]),
        .I1(IntFrmEvntCnt_reg[2]),
        .I2(IntFrmEvntCnt_reg[3]),
        .I3(IntFrmEvntCnt_reg[1]),
        .O(IntFrmEvntCntTc_d_i_2_n_0));
  FDCE #(
    .INIT(1'b0)) 
    IntFrmEvntCntTc_d_reg
       (.C(CLK),
        .CE(IntFrmEvntCnt0),
        .CLR(AR),
        .D(IntFrmEvntCntTc_d_i_2_n_0),
        .Q(IntFrmEvntCntTc_d));
  LUT1 #(
    .INIT(2'h1)) 
    \IntFrmEvntCnt[0]_i_1 
       (.I0(IntFrmEvntCnt_reg[0]),
        .O(plusOp[0]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \IntFrmEvntCnt[1]_i_1 
       (.I0(IntFrmEvntCnt_reg[0]),
        .I1(IntFrmEvntCnt_reg[1]),
        .O(plusOp[1]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \IntFrmEvntCnt[2]_i_1 
       (.I0(IntFrmEvntCnt_reg[0]),
        .I1(IntFrmEvntCnt_reg[1]),
        .I2(IntFrmEvntCnt_reg[2]),
        .O(plusOp[2]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \IntFrmEvntCnt[3]_i_1 
       (.I0(IntFrmEvntCnt_reg[1]),
        .I1(IntFrmEvntCnt_reg[0]),
        .I2(IntFrmEvntCnt_reg[2]),
        .I3(IntFrmEvntCnt_reg[3]),
        .O(plusOp[3]));
  FDCE #(
    .INIT(1'b0)) 
    \IntFrmEvntCnt_reg[0] 
       (.C(CLK),
        .CE(IntFrmEvntCnt0),
        .CLR(AR),
        .D(plusOp[0]),
        .Q(IntFrmEvntCnt_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \IntFrmEvntCnt_reg[1] 
       (.C(CLK),
        .CE(IntFrmEvntCnt0),
        .CLR(AR),
        .D(plusOp[1]),
        .Q(IntFrmEvntCnt_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \IntFrmEvntCnt_reg[2] 
       (.C(CLK),
        .CE(IntFrmEvntCnt0),
        .CLR(AR),
        .D(plusOp[2]),
        .Q(IntFrmEvntCnt_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \IntFrmEvntCnt_reg[3] 
       (.C(CLK),
        .CE(IntFrmEvntCnt0),
        .CLR(AR),
        .D(plusOp[3]),
        .Q(IntFrmEvntCnt_reg[3]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT5 #(
    .INIT(32'hFFFF777F)) 
    IntFrmLsbRegEna_d_i_1
       (.I0(IntFrmEqu_d),
        .I1(IntFrmLsbRegEna_d_reg_0),
        .I2(IntFrmRegEna_d),
        .I3(IntFrmLsbMsb_d),
        .I4(IntFrmMsbRegEna_d_reg_0),
        .O(IntFrmLsbRegEna_d_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    IntFrmLsbRegEna_d_reg
       (.C(CLK),
        .CE(1'b1),
        .D(IntFrmLsbRegEna_d_i_1_n_0),
        .Q(IntFrmLsbRegEna_d_reg_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT5 #(
    .INIT(32'h22200000)) 
    IntFrmMsbRegEna_d_i_1
       (.I0(IntFrmLsbRegEna_d_reg_0),
        .I1(IntFrmMsbRegEna_d_reg_0),
        .I2(IntFrmRegEna_d),
        .I3(IntFrmLsbMsb_d),
        .I4(IntFrmEqu_d),
        .O(IntFrmMsbRegEna_d_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    IntFrmMsbRegEna_d_reg
       (.C(CLK),
        .CE(1'b1),
        .D(IntFrmMsbRegEna_d_i_1_n_0),
        .Q(IntFrmMsbRegEna_d_reg_0),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hFFEA)) 
    IntFrmReSyncOut
       (.I0(IntFrmSlipCntTc_d2),
        .I1(IntFrmDbleNibFnlOdd_d),
        .I2(IntFrmDbleNibFnlEvn_d),
        .I3(SigOut),
        .O(IntFrmReSyncOut_n_0));
  LUT4 #(
    .INIT(16'h0A80)) 
    IntFrmRegEna_d_i_1
       (.I0(IntFrmEqu_d),
        .I1(IntFrmRegEna_d),
        .I2(IntFrmMsbRegEna_d_reg_0),
        .I3(IntFrmLsbRegEna_d_reg_0),
        .O(IntFrmRegEna_d_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    IntFrmRegEna_d_reg
       (.C(CLK),
        .CE(1'b1),
        .D(IntFrmRegEna_d_i_1_n_0),
        .Q(IntFrmRegEna_d),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00000010)) 
    IntFrmSlipCntTc_d_i_1
       (.I0(IntFrmSlipCnt_reg[3]),
        .I1(IntFrmSlipCnt_reg[2]),
        .I2(IntFrmSlipCnt_reg[4]),
        .I3(IntFrmSlipCnt_reg[0]),
        .I4(IntFrmSlipCnt_reg[1]),
        .O(IntFrmSlipCntTc_d_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    IntFrmSlipCntTc_d_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(IntFrmSlipCntTc_d_i_1_n_0),
        .Q(IntFrmSlipCntTc_d));
  LUT1 #(
    .INIT(2'h1)) 
    \IntFrmSlipCnt[0]_i_1 
       (.I0(IntFrmSlipCnt_reg[0]),
        .O(plusOp__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \IntFrmSlipCnt[1]_i_1 
       (.I0(IntFrmSlipCnt_reg[0]),
        .I1(IntFrmSlipCnt_reg[1]),
        .O(plusOp__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \IntFrmSlipCnt[2]_i_1 
       (.I0(IntFrmSlipCnt_reg[0]),
        .I1(IntFrmSlipCnt_reg[1]),
        .I2(IntFrmSlipCnt_reg[2]),
        .O(plusOp__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \IntFrmSlipCnt[3]_i_1 
       (.I0(IntFrmSlipCnt_reg[1]),
        .I1(IntFrmSlipCnt_reg[0]),
        .I2(IntFrmSlipCnt_reg[2]),
        .I3(IntFrmSlipCnt_reg[3]),
        .O(plusOp__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \IntFrmSlipCnt[4]_i_1 
       (.I0(IntFrmSlipCnt_reg[2]),
        .I1(IntFrmSlipCnt_reg[0]),
        .I2(IntFrmSlipCnt_reg[1]),
        .I3(IntFrmSlipCnt_reg[3]),
        .I4(IntFrmSlipCnt_reg[4]),
        .O(plusOp__0[4]));
  FDCE #(
    .INIT(1'b0)) 
    \IntFrmSlipCnt_reg[0] 
       (.C(CLK),
        .CE(IntFrmEvntCntTc_d),
        .CLR(AR),
        .D(plusOp__0[0]),
        .Q(IntFrmSlipCnt_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \IntFrmSlipCnt_reg[1] 
       (.C(CLK),
        .CE(IntFrmEvntCntTc_d),
        .CLR(AR),
        .D(plusOp__0[1]),
        .Q(IntFrmSlipCnt_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \IntFrmSlipCnt_reg[2] 
       (.C(CLK),
        .CE(IntFrmEvntCntTc_d),
        .CLR(AR),
        .D(plusOp__0[2]),
        .Q(IntFrmSlipCnt_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \IntFrmSlipCnt_reg[3] 
       (.C(CLK),
        .CE(IntFrmEvntCntTc_d),
        .CLR(AR),
        .D(plusOp__0[3]),
        .Q(IntFrmSlipCnt_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \IntFrmSlipCnt_reg[4] 
       (.C(CLK),
        .CE(IntFrmEvntCntTc_d),
        .CLR(AR),
        .D(plusOp__0[4]),
        .Q(IntFrmSlipCnt_reg[4]));
  FDCE #(
    .INIT(1'b0)) 
    IntFrmWarnCntTc_d_reg
       (.C(CLK),
        .CE(IntFrmSlipCntTc_d),
        .CLR(AR),
        .D(\eqOp_inferred__1/i__n_0 ),
        .Q(FrmClkSyncWarn_OBUF));
  LUT2 #(
    .INIT(4'h6)) 
    \IntFrmWarnCnt[0]_i_1 
       (.I0(IntFrmSlipCntTc_d),
        .I1(IntFrmWarnCnt[0]),
        .O(\IntFrmWarnCnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \IntFrmWarnCnt[1]_i_1 
       (.I0(IntFrmWarnCnt[0]),
        .I1(IntFrmSlipCntTc_d),
        .I2(IntFrmWarnCnt[1]),
        .O(\IntFrmWarnCnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \IntFrmWarnCnt[2]_i_1 
       (.I0(IntFrmWarnCnt[0]),
        .I1(IntFrmWarnCnt[1]),
        .I2(IntFrmSlipCntTc_d),
        .I3(IntFrmWarnCnt[2]),
        .O(\IntFrmWarnCnt[2]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \IntFrmWarnCnt_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\IntFrmWarnCnt[0]_i_1_n_0 ),
        .Q(IntFrmWarnCnt[0]));
  FDCE #(
    .INIT(1'b0)) 
    \IntFrmWarnCnt_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\IntFrmWarnCnt[1]_i_1_n_0 ),
        .Q(IntFrmWarnCnt[1]));
  FDCE #(
    .INIT(1'b0)) 
    \IntFrmWarnCnt_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\IntFrmWarnCnt[2]_i_1_n_0 ),
        .Q(IntFrmWarnCnt[2]));
  LUT3 #(
    .INIT(8'h08)) 
    \eqOp_inferred__1/i_ 
       (.I0(IntFrmWarnCnt[1]),
        .I1(IntFrmWarnCnt[2]),
        .I2(IntFrmWarnCnt[0]),
        .O(\eqOp_inferred__1/i__n_0 ));
  FCLK_GenPulse genpulse1
       (.AdcReSync_IBUF(AdcReSync_IBUF),
        .CLK(CLK),
        .SigOut(SigOut));
endmodule

module FCLK_ADC
   (FrmClkDat_OBUF,
    FrmClkLsbRegEna_OBUF,
    FrmClkMsbRegEna_OBUF,
    FrmClkSwapMux_OBUF,
    FrmClkReSyncOut_OBUF,
    FrmClkSyncWarn_OBUF,
    Q,
    CLK,
    AdcReSync_IBUF,
    AR,
    FrmClkEna,
    BitClkDone_OBUF,
    FCLK_p,
    FCLK_n,
    DatClk,
    lopt);
  output [15:0]FrmClkDat_OBUF;
  output FrmClkLsbRegEna_OBUF;
  output FrmClkMsbRegEna_OBUF;
  output FrmClkSwapMux_OBUF;
  output FrmClkReSyncOut_OBUF;
  output FrmClkSyncWarn_OBUF;
  output [1:0]Q;
  input CLK;
  input AdcReSync_IBUF;
  input [0:0]AR;
  input FrmClkEna;
  input BitClkDone_OBUF;
  input FCLK_p;
  input FCLK_n;
  input DatClk;
  output lopt;

  wire [0:0]AR;
  wire AdcReSync_IBUF;
  wire BitClkDone_OBUF;
  wire CE;
  wire CE1;
  wire CLK;
  wire DatClk;
  wire FCLK_EVN_n_5;
  wire FCLK_EVN_n_6;
  wire FCLK_EVN_n_7;
  wire FCLK_ODD_n_0;
  wire FCLK_n;
  wire FCLK_p;
  wire [15:0]FrmClkDat_OBUF;
  wire FrmClkEna;
  wire FrmClkLsbRegEna_OBUF;
  wire FrmClkMsbRegEna_OBUF;
  wire FrmClkReSyncOut_OBUF;
  wire FrmClkSwapMux_OBUF;
  wire FrmClkSyncWarn_OBUF;
  wire IntFCLK_n;
  wire IntFCLK_p;
  wire IntFrmDbleNibFnlEvn;
  wire IntFrmDbleNibFnlEvn_d;
  wire IntFrmDbleNibFnlOdd;
  wire IntFrmDbleNibFnlOdd_d;
  wire IntFrmEqu_d;
  wire [3:0]IntFrmSrdsDatEvn;
  wire [3:0]IntFrmSrdsDatEvn_d;
  wire [3:0]IntFrmSrdsDatOdd;
  wire [3:0]IntFrmSrdsDatOdd_d;
  wire [1:0]Q;
  wire lopt;
  wire NLW_ISERDESE2_inst_FCLK_N_O_UNCONNECTED;
  wire NLW_ISERDESE2_inst_FCLK_N_Q5_UNCONNECTED;
  wire NLW_ISERDESE2_inst_FCLK_N_Q6_UNCONNECTED;
  wire NLW_ISERDESE2_inst_FCLK_N_Q7_UNCONNECTED;
  wire NLW_ISERDESE2_inst_FCLK_N_Q8_UNCONNECTED;
  wire NLW_ISERDESE2_inst_FCLK_N_SHIFTOUT1_UNCONNECTED;
  wire NLW_ISERDESE2_inst_FCLK_N_SHIFTOUT2_UNCONNECTED;
  wire NLW_ISERDESE2_inst_FCLK_P_O_UNCONNECTED;
  wire NLW_ISERDESE2_inst_FCLK_P_Q5_UNCONNECTED;
  wire NLW_ISERDESE2_inst_FCLK_P_Q6_UNCONNECTED;
  wire NLW_ISERDESE2_inst_FCLK_P_Q7_UNCONNECTED;
  wire NLW_ISERDESE2_inst_FCLK_P_Q8_UNCONNECTED;
  wire NLW_ISERDESE2_inst_FCLK_P_SHIFTOUT1_UNCONNECTED;
  wire NLW_ISERDESE2_inst_FCLK_P_SHIFTOUT2_UNCONNECTED;

  FCLKSrdsReg ADCFrame
       (.AR(AR),
        .AdcReSync_IBUF(AdcReSync_IBUF),
        .BitClkDone_OBUF(BitClkDone_OBUF),
        .CE(CE),
        .CE1(CE1),
        .CLK(CLK),
        .DataOut(IntFrmSrdsDatEvn_d),
        .FDCE_inst_FrmEqu_d_0(FCLK_EVN_n_5),
        .FDCE_inst_FrmLsbMsb_d_0(FCLK_ODD_n_0),
        .FDCE_inst_FrmSwapMux_d_0(FrmClkSwapMux_OBUF),
        .FDCE_inst_FrmSwapMux_d_1(FCLK_EVN_n_7),
        .FDCE_inst_reg7_0(IntFrmSrdsDatOdd_d),
        .FrmClkDat_OBUF(FrmClkDat_OBUF),
        .FrmClkEna(FrmClkEna),
        .FrmClkReSyncOut_OBUF(FrmClkReSyncOut_OBUF),
        .FrmClkSyncWarn_OBUF(FrmClkSyncWarn_OBUF),
        .IntFrmDbleNibFnlEvn_d(IntFrmDbleNibFnlEvn_d),
        .IntFrmDbleNibFnlOdd_d(IntFrmDbleNibFnlOdd_d),
        .IntFrmEqu_d(IntFrmEqu_d),
        .IntFrmLsbRegEna_d_reg_0(FrmClkLsbRegEna_OBUF),
        .IntFrmMsbRegEna_d_reg_0(FrmClkMsbRegEna_OBUF),
        .Q(Q),
        .lopt(lopt));
  FclkCntEqu FCLK_EVN
       (.CE(CE),
        .CE1(CE1),
        .CLK(CLK),
        .DataOut(IntFrmSrdsDatOdd_d),
        .FDCE_instOut0(FCLK_EVN_n_5),
        .FDCE_instOut1(FCLK_EVN_n_6),
        .FDCE_instOut2(FCLK_EVN_n_7),
        .FDCE_instOut3(IntFrmSrdsDatEvn_d),
        .IntFrmDbleNibFnlEvn(IntFrmDbleNibFnlEvn),
        .IntFrmEqu_d(IntFrmEqu_d),
        .IntFrmSrdsDatEvn(IntFrmSrdsDatEvn));
  FclkCntEqu_0 FCLK_ODD
       (.CLK(CLK),
        .DataOut(IntFrmSrdsDatOdd_d),
        .FDCE_instOut3(FCLK_ODD_n_0),
        .FDCE_inst_FrmLsbMsb_d(IntFrmSrdsDatEvn_d[3]),
        .FDCE_inst_FrmLsbMsb_d_0(FCLK_EVN_n_6),
        .IntFrmDbleNibFnlOdd(IntFrmDbleNibFnlOdd),
        .IntFrmSrdsDatOdd(IntFrmSrdsDatOdd));
  (* CCIO_EN_M = "TRUE" *) 
  (* CCIO_EN_S = "TRUE" *) 
  (* IOSTANDARD = "DEFAULT" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS_DIFF_OUT_UNIQ_BASE_ IBUFDS_DIFF_OUT_FCLK
       (.I(FCLK_p),
        .IB(FCLK_n),
        .O(IntFCLK_p),
        .OB(IntFCLK_n));
  (* box_type = "PRIMITIVE" *) 
  ISERDESE2 #(
    .DATA_RATE("SDR"),
    .DATA_WIDTH(4),
    .DYN_CLKDIV_INV_EN("FALSE"),
    .DYN_CLK_INV_EN("FALSE"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .INIT_Q3(1'b0),
    .INIT_Q4(1'b0),
    .INTERFACE_TYPE("NETWORKING"),
    .IOBDELAY("NONE"),
    .IS_CLKB_INVERTED(1'b0),
    .IS_CLKDIVP_INVERTED(1'b0),
    .IS_CLKDIV_INVERTED(1'b0),
    .IS_CLK_INVERTED(1'b1),
    .IS_D_INVERTED(1'b0),
    .IS_OCLKB_INVERTED(1'b0),
    .IS_OCLK_INVERTED(1'b0),
    .NUM_CE(1),
    .OFB_USED("FALSE"),
    .SERDES_MODE("MASTER"),
    .SRVAL_Q1(1'b0),
    .SRVAL_Q2(1'b0),
    .SRVAL_Q3(1'b0),
    .SRVAL_Q4(1'b0)) 
    ISERDESE2_inst_FCLK_N
       (.BITSLIP(1'b0),
        .CE1(CE1),
        .CE2(1'b0),
        .CLK(DatClk),
        .CLKB(1'b0),
        .CLKDIV(CLK),
        .CLKDIVP(1'b0),
        .D(IntFCLK_n),
        .DDLY(1'b0),
        .DYNCLKDIVSEL(1'b0),
        .DYNCLKSEL(1'b0),
        .O(NLW_ISERDESE2_inst_FCLK_N_O_UNCONNECTED),
        .OCLK(1'b0),
        .OCLKB(1'b0),
        .OFB(1'b0),
        .Q1(IntFrmSrdsDatOdd[3]),
        .Q2(IntFrmSrdsDatOdd[2]),
        .Q3(IntFrmSrdsDatOdd[1]),
        .Q4(IntFrmSrdsDatOdd[0]),
        .Q5(NLW_ISERDESE2_inst_FCLK_N_Q5_UNCONNECTED),
        .Q6(NLW_ISERDESE2_inst_FCLK_N_Q6_UNCONNECTED),
        .Q7(NLW_ISERDESE2_inst_FCLK_N_Q7_UNCONNECTED),
        .Q8(NLW_ISERDESE2_inst_FCLK_N_Q8_UNCONNECTED),
        .RST(1'b0),
        .SHIFTIN1(1'b0),
        .SHIFTIN2(1'b0),
        .SHIFTOUT1(NLW_ISERDESE2_inst_FCLK_N_SHIFTOUT1_UNCONNECTED),
        .SHIFTOUT2(NLW_ISERDESE2_inst_FCLK_N_SHIFTOUT2_UNCONNECTED));
  (* box_type = "PRIMITIVE" *) 
  ISERDESE2 #(
    .DATA_RATE("SDR"),
    .DATA_WIDTH(4),
    .DYN_CLKDIV_INV_EN("FALSE"),
    .DYN_CLK_INV_EN("FALSE"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .INIT_Q3(1'b0),
    .INIT_Q4(1'b0),
    .INTERFACE_TYPE("NETWORKING"),
    .IOBDELAY("NONE"),
    .IS_CLKB_INVERTED(1'b0),
    .IS_CLKDIVP_INVERTED(1'b0),
    .IS_CLKDIV_INVERTED(1'b0),
    .IS_CLK_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_OCLKB_INVERTED(1'b0),
    .IS_OCLK_INVERTED(1'b0),
    .NUM_CE(1),
    .OFB_USED("FALSE"),
    .SERDES_MODE("MASTER"),
    .SRVAL_Q1(1'b0),
    .SRVAL_Q2(1'b0),
    .SRVAL_Q3(1'b0),
    .SRVAL_Q4(1'b0)) 
    ISERDESE2_inst_FCLK_P
       (.BITSLIP(1'b0),
        .CE1(CE1),
        .CE2(1'b0),
        .CLK(DatClk),
        .CLKB(1'b0),
        .CLKDIV(CLK),
        .CLKDIVP(1'b0),
        .D(IntFCLK_p),
        .DDLY(1'b0),
        .DYNCLKDIVSEL(1'b0),
        .DYNCLKSEL(1'b0),
        .O(NLW_ISERDESE2_inst_FCLK_P_O_UNCONNECTED),
        .OCLK(1'b0),
        .OCLKB(1'b0),
        .OFB(1'b0),
        .Q1(IntFrmSrdsDatEvn[3]),
        .Q2(IntFrmSrdsDatEvn[2]),
        .Q3(IntFrmSrdsDatEvn[1]),
        .Q4(IntFrmSrdsDatEvn[0]),
        .Q5(NLW_ISERDESE2_inst_FCLK_P_Q5_UNCONNECTED),
        .Q6(NLW_ISERDESE2_inst_FCLK_P_Q6_UNCONNECTED),
        .Q7(NLW_ISERDESE2_inst_FCLK_P_Q7_UNCONNECTED),
        .Q8(NLW_ISERDESE2_inst_FCLK_P_Q8_UNCONNECTED),
        .RST(1'b0),
        .SHIFTIN1(1'b0),
        .SHIFTIN2(1'b0),
        .SHIFTOUT1(NLW_ISERDESE2_inst_FCLK_P_SHIFTOUT1_UNCONNECTED),
        .SHIFTOUT2(NLW_ISERDESE2_inst_FCLK_P_SHIFTOUT2_UNCONNECTED));
  FDRE #(
    .INIT(1'b0)) 
    IntFrmDbleNibFnlEvn_d_reg
       (.C(CLK),
        .CE(1'b1),
        .D(IntFrmDbleNibFnlEvn),
        .Q(IntFrmDbleNibFnlEvn_d),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    IntFrmDbleNibFnlOdd_d_reg
       (.C(CLK),
        .CE(1'b1),
        .D(IntFrmDbleNibFnlOdd),
        .Q(IntFrmDbleNibFnlOdd_d),
        .R(1'b0));
endmodule

module FCLK_GenPulse
   (SigOut,
    CLK,
    AdcReSync_IBUF);
  output SigOut;
  input CLK;
  input AdcReSync_IBUF;

  wire AdcReSync_IBUF;
  wire CLK;
  wire GenPulse_Fdcr_2_n_0;
  wire SigOut;

  FCLK_GenPulse_Fdcr GenPulse_Fdcr_1
       (.CLK(CLK),
        .FDCE_inst_genPulse_0(GenPulse_Fdcr_2_n_0),
        .SigOut(SigOut));
  FCLK_GenPulse_Fdcr_8 GenPulse_Fdcr_2
       (.AdcReSync_IBUF(AdcReSync_IBUF),
        .CLK(CLK),
        .FDCE_inst_genPulse_0(GenPulse_Fdcr_2_n_0));
endmodule

module FCLK_GenPulse_Fdcr
   (SigOut,
    FDCE_inst_genPulse_0,
    CLK);
  output SigOut;
  input FDCE_inst_genPulse_0;
  input CLK;

  wire CLK;
  wire FDCE_inst_genPulse_0;
  wire SigOut;

  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_genPulse
       (.C(CLK),
        .CE(1'b1),
        .CLR(1'b0),
        .D(FDCE_inst_genPulse_0),
        .Q(SigOut));
endmodule

(* ORIG_REF_NAME = "FCLK_GenPulse_Fdcr" *) 
module FCLK_GenPulse_Fdcr_8
   (FDCE_inst_genPulse_0,
    AdcReSync_IBUF,
    CLK);
  output FDCE_inst_genPulse_0;
  input AdcReSync_IBUF;
  input CLK;

  wire AdcReSync_IBUF;
  wire CLK;
  wire FDCE_inst_genPulse_0;
  wire IntSigClr;

  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_inst_genPulse
       (.C(CLK),
        .CE(1'b1),
        .CLR(1'b0),
        .D(AdcReSync_IBUF),
        .Q(IntSigClr));
  LUT2 #(
    .INIT(4'h2)) 
    FDCE_inst_genPulse_i_1
       (.I0(AdcReSync_IBUF),
        .I1(IntSigClr),
        .O(FDCE_inst_genPulse_0));
endmodule

module FclkCntEqu
   (CE,
    FDCE_instOut3,
    FDCE_instOut0,
    FDCE_instOut1,
    FDCE_instOut2,
    IntFrmDbleNibFnlEvn,
    CLK,
    IntFrmSrdsDatEvn,
    DataOut,
    IntFrmEqu_d,
    CE1);
  output CE;
  output [3:0]FDCE_instOut3;
  output FDCE_instOut0;
  output FDCE_instOut1;
  output FDCE_instOut2;
  output IntFrmDbleNibFnlEvn;
  input CLK;
  input [3:0]IntFrmSrdsDatEvn;
  input [3:0]DataOut;
  input IntFrmEqu_d;
  input CE1;

  wire CE;
  wire CE1;
  wire CLK;
  wire [3:0]DataOut;
  wire EquCnt1_n_6;
  wire FDCE_instOut0;
  wire FDCE_instOut1;
  wire FDCE_instOut2;
  wire [3:0]FDCE_instOut3;
  wire [2:0]IntAddr;
  wire IntEqu;
  wire [3:2]IntEquCnt_d;
  wire IntEqu_d;
  wire IntFrmDbleNibFnlEvn;
  wire IntFrmEqu_d;
  wire [3:0]IntFrmSrdsDatEvn;
  wire IntPulse;
  wire IntRegOut1_n_5;
  wire [3:0]IntRegOutIn;
  wire IntRstIn_d;
  wire IntSlipCntRst;
  wire [2:0]IntSlipCnt_d;
  wire [3:0]IntSrlOut;
  wire slipCnt1_n_4;
  wire slipCnt1_n_5;
  wire slipCnt1_n_6;
  wire slipCnt1_n_7;

  EquCntModule_1 EquCnt1
       (.CLK(CLK),
        .D(IntAddr),
        .E(EquCnt1_n_6),
        .EquCnt_3_0(IntEquCnt_d),
        .FDSE_instrstIn7(slipCnt1_n_4),
        .IntEqu(IntEqu),
        .IntRstIn_d(IntRstIn_d),
        .IntRstSet(IntFrmDbleNibFnlEvn),
        .IntSlipCnt_d(IntSlipCnt_d),
        .SRLC32E_instintreg0(slipCnt1_n_5),
        .SRLC32E_instintreg0_0(slipCnt1_n_7),
        .SRLC32E_instintreg0_1(slipCnt1_n_6));
  IntRegOutModule_2 IntRegOut1
       (.CLK(CLK),
        .ISERDESE2_inst_FCLK_P(IntRegOut1_n_5),
        .IntEqu(IntEqu),
        .IntEqu_d(IntEqu_d),
        .IntFrmSrdsDatEvn(IntFrmSrdsDatEvn),
        .IntPulse(IntPulse),
        .IntRegOutIn(IntRegOutIn),
        .IntRstIn_d(IntRstIn_d));
  IntRstFfModule_3 IntRstFf1
       (.CLK(CLK),
        .IntRstIn_d(IntRstIn_d),
        .IntRstSet(IntFrmDbleNibFnlEvn));
  IntSrlModule_4 IntSrl1
       (.CLK(CLK),
        .D(IntAddr),
        .E(EquCnt1_n_6),
        .IntRegOutIn(IntRegOutIn),
        .IntSrlOut(IntSrlOut));
  RSTSetModule_5 RstSet1
       (.CLK(CLK),
        .IntEqu(IntEqu),
        .IntEqu_d(IntEqu_d),
        .IntSlipCntRst(IntSlipCntRst));
  DataOutModule_6 dataOut1
       (.CE(CE),
        .CE1(CE1),
        .CLK(CLK),
        .DataOut(DataOut),
        .FDCE_instOut0_0(FDCE_instOut0),
        .FDCE_instOut1_0(FDCE_instOut1),
        .FDCE_instOut2_0(FDCE_instOut2),
        .FDCE_instOut3_0(FDCE_instOut3),
        .IntFrmEqu_d(IntFrmEqu_d),
        .IntRstIn_d(IntRstIn_d),
        .IntSrlOut(IntSrlOut));
  IntSlipCntModule_7 slipCnt1
       (.CLK(CLK),
        .EquCnt_3(slipCnt1_n_5),
        .FDSE_instrstIn7(IntRegOut1_n_5),
        .\IntAddr_reg[0]_i_1 (IntEquCnt_d),
        .IntEqu_d(IntEqu_d),
        .IntFrmSrdsDatEvn(IntFrmSrdsDatEvn[3]),
        .IntPulse(IntPulse),
        .IntRegOutIn(IntRegOutIn[3]),
        .IntRstIn_d(IntRstIn_d),
        .IntSlipCntRst(IntSlipCntRst),
        .IntSlipCnt_0_0(slipCnt1_n_7),
        .IntSlipCnt_1_0(slipCnt1_n_4),
        .IntSlipCnt_1_1(slipCnt1_n_6),
        .IntSlipCnt_d(IntSlipCnt_d));
endmodule

(* ORIG_REF_NAME = "FclkCntEqu" *) 
module FclkCntEqu_0
   (FDCE_instOut3,
    DataOut,
    IntFrmDbleNibFnlOdd,
    CLK,
    IntFrmSrdsDatOdd,
    FDCE_inst_FrmLsbMsb_d,
    FDCE_inst_FrmLsbMsb_d_0);
  output FDCE_instOut3;
  output [3:0]DataOut;
  output IntFrmDbleNibFnlOdd;
  input CLK;
  input [3:0]IntFrmSrdsDatOdd;
  input [0:0]FDCE_inst_FrmLsbMsb_d;
  input FDCE_inst_FrmLsbMsb_d_0;

  wire CLK;
  wire [3:0]DataOut;
  wire EquCnt1_n_6;
  wire FDCE_instOut3;
  wire [0:0]FDCE_inst_FrmLsbMsb_d;
  wire FDCE_inst_FrmLsbMsb_d_0;
  wire [2:0]IntAddr;
  wire IntEqu;
  wire [3:2]IntEquCnt_d;
  wire IntEqu_d;
  wire IntFrmDbleNibFnlOdd;
  wire [3:0]IntFrmSrdsDatOdd;
  wire IntPulse;
  wire IntRegOut1_n_5;
  wire [3:0]IntRegOutIn;
  wire IntRstIn_d;
  wire IntSlipCntRst;
  wire [2:0]IntSlipCnt_d;
  wire [3:0]IntSrlOut;
  wire slipCnt1_n_4;
  wire slipCnt1_n_5;
  wire slipCnt1_n_6;
  wire slipCnt1_n_7;

  EquCntModule EquCnt1
       (.CLK(CLK),
        .D(IntAddr),
        .E(EquCnt1_n_6),
        .EquCnt_3_0(IntEquCnt_d),
        .FDSE_instrstIn7(slipCnt1_n_4),
        .IntEqu(IntEqu),
        .IntRstIn_d(IntRstIn_d),
        .IntRstSet(IntFrmDbleNibFnlOdd),
        .IntSlipCnt_d(IntSlipCnt_d),
        .SRLC32E_instintreg0(slipCnt1_n_5),
        .SRLC32E_instintreg0_0(slipCnt1_n_7),
        .SRLC32E_instintreg0_1(slipCnt1_n_6));
  IntRegOutModule IntRegOut1
       (.CLK(CLK),
        .ISERDESE2_inst_FCLK_N(IntRegOut1_n_5),
        .IntEqu(IntEqu),
        .IntEqu_d(IntEqu_d),
        .IntFrmSrdsDatOdd(IntFrmSrdsDatOdd),
        .IntPulse(IntPulse),
        .IntRegOutIn(IntRegOutIn),
        .IntRstIn_d(IntRstIn_d));
  IntRstFfModule IntRstFf1
       (.CLK(CLK),
        .IntRstIn_d(IntRstIn_d),
        .IntRstSet(IntFrmDbleNibFnlOdd));
  IntSrlModule IntSrl1
       (.CLK(CLK),
        .D(IntAddr),
        .E(EquCnt1_n_6),
        .IntRegOutIn(IntRegOutIn),
        .IntSrlOut(IntSrlOut));
  RSTSetModule RstSet1
       (.CLK(CLK),
        .IntEqu(IntEqu),
        .IntEqu_d(IntEqu_d),
        .IntSlipCntRst(IntSlipCntRst));
  DataOutModule dataOut1
       (.CLK(CLK),
        .DataOut(DataOut),
        .FDCE_instOut3_0(FDCE_instOut3),
        .FDCE_inst_FrmLsbMsb_d(FDCE_inst_FrmLsbMsb_d),
        .FDCE_inst_FrmLsbMsb_d_0(FDCE_inst_FrmLsbMsb_d_0),
        .IntRstIn_d(IntRstIn_d),
        .IntSrlOut(IntSrlOut));
  IntSlipCntModule slipCnt1
       (.CLK(CLK),
        .EquCnt_3(slipCnt1_n_5),
        .FDSE_instrstIn7(IntRegOut1_n_5),
        .\IntAddr_reg[0]_i_1__0 (IntEquCnt_d),
        .IntEqu_d(IntEqu_d),
        .IntFrmSrdsDatOdd(IntFrmSrdsDatOdd[3]),
        .IntPulse(IntPulse),
        .IntRegOutIn(IntRegOutIn[3]),
        .IntRstIn_d(IntRstIn_d),
        .IntSlipCntRst(IntSlipCntRst),
        .IntSlipCnt_0_0(slipCnt1_n_7),
        .IntSlipCnt_1_0(slipCnt1_n_4),
        .IntSlipCnt_1_1(slipCnt1_n_6),
        .IntSlipCnt_d(IntSlipCnt_d));
endmodule

module IntRegOutModule
   (IntRegOutIn,
    IntPulse,
    ISERDESE2_inst_FCLK_N,
    IntEqu,
    IntFrmSrdsDatOdd,
    CLK,
    IntRstIn_d,
    IntEqu_d);
  output [3:0]IntRegOutIn;
  output IntPulse;
  output ISERDESE2_inst_FCLK_N;
  output IntEqu;
  input [3:0]IntFrmSrdsDatOdd;
  input CLK;
  input IntRstIn_d;
  input IntEqu_d;

  wire CLK;
  wire ISERDESE2_inst_FCLK_N;
  wire IntEqu;
  wire IntEqu_d;
  wire [3:0]IntFrmSrdsDatOdd;
  wire IntPulse;
  wire [3:0]IntRegOutIn;
  wire IntRstIn_d;

  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'h84)) 
    FDCE_instIntEqu_i_1__0
       (.I0(IntFrmSrdsDatOdd[3]),
        .I1(ISERDESE2_inst_FCLK_N),
        .I2(IntRegOutIn[3]),
        .O(IntEqu));
  LUT6 #(
    .INIT(64'h8008200240041001)) 
    FDCE_instIntEqu_i_3__0
       (.I0(IntFrmSrdsDatOdd[2]),
        .I1(IntFrmSrdsDatOdd[1]),
        .I2(IntRegOutIn[0]),
        .I3(IntFrmSrdsDatOdd[0]),
        .I4(IntRegOutIn[1]),
        .I5(IntRegOutIn[2]),
        .O(ISERDESE2_inst_FCLK_N));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_instdata0
       (.C(CLK),
        .CE(1'b1),
        .CLR(IntRstIn_d),
        .D(IntFrmSrdsDatOdd[0]),
        .Q(IntRegOutIn[0]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_instdata1
       (.C(CLK),
        .CE(1'b1),
        .CLR(IntRstIn_d),
        .D(IntFrmSrdsDatOdd[1]),
        .Q(IntRegOutIn[1]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_instdata2
       (.C(CLK),
        .CE(1'b1),
        .CLR(IntRstIn_d),
        .D(IntFrmSrdsDatOdd[2]),
        .Q(IntRegOutIn[2]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_instdata3
       (.C(CLK),
        .CE(1'b1),
        .CLR(IntRstIn_d),
        .D(IntFrmSrdsDatOdd[3]),
        .Q(IntRegOutIn[3]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT4 #(
    .INIT(16'hFF84)) 
    IntSlipCnt_0_i_1__0
       (.I0(IntRegOutIn[3]),
        .I1(ISERDESE2_inst_FCLK_N),
        .I2(IntFrmSrdsDatOdd[3]),
        .I3(IntEqu_d),
        .O(IntPulse));
endmodule

(* ORIG_REF_NAME = "IntRegOutModule" *) 
module IntRegOutModule_2
   (IntRegOutIn,
    IntPulse,
    ISERDESE2_inst_FCLK_P,
    IntEqu,
    IntFrmSrdsDatEvn,
    CLK,
    IntRstIn_d,
    IntEqu_d);
  output [3:0]IntRegOutIn;
  output IntPulse;
  output ISERDESE2_inst_FCLK_P;
  output IntEqu;
  input [3:0]IntFrmSrdsDatEvn;
  input CLK;
  input IntRstIn_d;
  input IntEqu_d;

  wire CLK;
  wire ISERDESE2_inst_FCLK_P;
  wire IntEqu;
  wire IntEqu_d;
  wire [3:0]IntFrmSrdsDatEvn;
  wire IntPulse;
  wire [3:0]IntRegOutIn;
  wire IntRstIn_d;

  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'h84)) 
    FDCE_instIntEqu_i_1
       (.I0(IntFrmSrdsDatEvn[3]),
        .I1(ISERDESE2_inst_FCLK_P),
        .I2(IntRegOutIn[3]),
        .O(IntEqu));
  LUT6 #(
    .INIT(64'h8008200240041001)) 
    FDCE_instIntEqu_i_3
       (.I0(IntFrmSrdsDatEvn[2]),
        .I1(IntFrmSrdsDatEvn[1]),
        .I2(IntRegOutIn[0]),
        .I3(IntFrmSrdsDatEvn[0]),
        .I4(IntRegOutIn[1]),
        .I5(IntRegOutIn[2]),
        .O(ISERDESE2_inst_FCLK_P));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_instdata0
       (.C(CLK),
        .CE(1'b1),
        .CLR(IntRstIn_d),
        .D(IntFrmSrdsDatEvn[0]),
        .Q(IntRegOutIn[0]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_instdata1
       (.C(CLK),
        .CE(1'b1),
        .CLR(IntRstIn_d),
        .D(IntFrmSrdsDatEvn[1]),
        .Q(IntRegOutIn[1]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_instdata2
       (.C(CLK),
        .CE(1'b1),
        .CLR(IntRstIn_d),
        .D(IntFrmSrdsDatEvn[2]),
        .Q(IntRegOutIn[2]));
  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_instdata3
       (.C(CLK),
        .CE(1'b1),
        .CLR(IntRstIn_d),
        .D(IntFrmSrdsDatEvn[3]),
        .Q(IntRegOutIn[3]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT4 #(
    .INIT(16'hFF84)) 
    IntSlipCnt_0_i_1
       (.I0(IntRegOutIn[3]),
        .I1(ISERDESE2_inst_FCLK_P),
        .I2(IntFrmSrdsDatEvn[3]),
        .I3(IntEqu_d),
        .O(IntPulse));
endmodule

module IntRstFfModule
   (IntRstIn_d,
    IntRstSet,
    CLK);
  output IntRstIn_d;
  input IntRstSet;
  input CLK;

  wire CLK;
  wire IntRstFf_d_0;
  wire IntRstFf_d_1;
  wire IntRstFf_d_2;
  wire IntRstFf_d_3;
  wire IntRstFf_d_4;
  wire IntRstFf_d_5;
  wire IntRstFf_d_6;
  wire IntRstIn_d;
  wire IntRstSet;

  (* box_type = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    FDSE_instrstIn0
       (.C(CLK),
        .CE(1'b1),
        .D(1'b0),
        .Q(IntRstFf_d_0),
        .S(IntRstSet));
  (* box_type = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    FDSE_instrstIn1
       (.C(CLK),
        .CE(1'b1),
        .D(IntRstFf_d_0),
        .Q(IntRstFf_d_1),
        .S(IntRstSet));
  (* box_type = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    FDSE_instrstIn2
       (.C(CLK),
        .CE(1'b1),
        .D(IntRstFf_d_1),
        .Q(IntRstFf_d_2),
        .S(IntRstSet));
  (* box_type = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    FDSE_instrstIn3
       (.C(CLK),
        .CE(1'b1),
        .D(IntRstFf_d_2),
        .Q(IntRstFf_d_3),
        .S(IntRstSet));
  (* box_type = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    FDSE_instrstIn4
       (.C(CLK),
        .CE(1'b1),
        .D(IntRstFf_d_3),
        .Q(IntRstFf_d_4),
        .S(IntRstSet));
  (* box_type = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    FDSE_instrstIn5
       (.C(CLK),
        .CE(1'b1),
        .D(IntRstFf_d_4),
        .Q(IntRstFf_d_5),
        .S(IntRstSet));
  (* box_type = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    FDSE_instrstIn6
       (.C(CLK),
        .CE(1'b1),
        .D(IntRstFf_d_5),
        .Q(IntRstFf_d_6),
        .S(IntRstSet));
  (* box_type = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    FDSE_instrstIn7
       (.C(CLK),
        .CE(1'b1),
        .D(IntRstFf_d_6),
        .Q(IntRstIn_d),
        .S(IntRstSet));
endmodule

(* ORIG_REF_NAME = "IntRstFfModule" *) 
module IntRstFfModule_3
   (IntRstIn_d,
    IntRstSet,
    CLK);
  output IntRstIn_d;
  input IntRstSet;
  input CLK;

  wire CLK;
  wire IntRstFf_d_0;
  wire IntRstFf_d_1;
  wire IntRstFf_d_2;
  wire IntRstFf_d_3;
  wire IntRstFf_d_4;
  wire IntRstFf_d_5;
  wire IntRstFf_d_6;
  wire IntRstIn_d;
  wire IntRstSet;

  (* box_type = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    FDSE_instrstIn0
       (.C(CLK),
        .CE(1'b1),
        .D(1'b0),
        .Q(IntRstFf_d_0),
        .S(IntRstSet));
  (* box_type = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    FDSE_instrstIn1
       (.C(CLK),
        .CE(1'b1),
        .D(IntRstFf_d_0),
        .Q(IntRstFf_d_1),
        .S(IntRstSet));
  (* box_type = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    FDSE_instrstIn2
       (.C(CLK),
        .CE(1'b1),
        .D(IntRstFf_d_1),
        .Q(IntRstFf_d_2),
        .S(IntRstSet));
  (* box_type = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    FDSE_instrstIn3
       (.C(CLK),
        .CE(1'b1),
        .D(IntRstFf_d_2),
        .Q(IntRstFf_d_3),
        .S(IntRstSet));
  (* box_type = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    FDSE_instrstIn4
       (.C(CLK),
        .CE(1'b1),
        .D(IntRstFf_d_3),
        .Q(IntRstFf_d_4),
        .S(IntRstSet));
  (* box_type = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    FDSE_instrstIn5
       (.C(CLK),
        .CE(1'b1),
        .D(IntRstFf_d_4),
        .Q(IntRstFf_d_5),
        .S(IntRstSet));
  (* box_type = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    FDSE_instrstIn6
       (.C(CLK),
        .CE(1'b1),
        .D(IntRstFf_d_5),
        .Q(IntRstFf_d_6),
        .S(IntRstSet));
  (* box_type = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    FDSE_instrstIn7
       (.C(CLK),
        .CE(1'b1),
        .D(IntRstFf_d_6),
        .Q(IntRstIn_d),
        .S(IntRstSet));
endmodule

module IntSlipCntModule
   (IntSlipCnt_d,
    IntSlipCntRst,
    IntSlipCnt_1_0,
    EquCnt_3,
    IntSlipCnt_1_1,
    IntSlipCnt_0_0,
    IntPulse,
    CLK,
    IntRegOutIn,
    FDSE_instrstIn7,
    IntFrmSrdsDatOdd,
    IntEqu_d,
    IntRstIn_d,
    \IntAddr_reg[0]_i_1__0 );
  output [2:0]IntSlipCnt_d;
  output IntSlipCntRst;
  output IntSlipCnt_1_0;
  output EquCnt_3;
  output IntSlipCnt_1_1;
  output IntSlipCnt_0_0;
  input IntPulse;
  input CLK;
  input [0:0]IntRegOutIn;
  input FDSE_instrstIn7;
  input [0:0]IntFrmSrdsDatOdd;
  input IntEqu_d;
  input IntRstIn_d;
  input [1:0]\IntAddr_reg[0]_i_1__0 ;

  wire CLK;
  wire D;
  wire EquCnt_3;
  wire FDSE_instrstIn7;
  wire [1:0]\IntAddr_reg[0]_i_1__0 ;
  wire IntEqu_d;
  wire [0:0]IntFrmSrdsDatOdd;
  wire IntPulse;
  wire [0:0]IntRegOutIn;
  wire IntRstIn_d;
  wire IntSlipCntRst;
  wire IntSlipCnt_0_0;
  wire IntSlipCnt_1_0;
  wire IntSlipCnt_1_1;
  wire IntSlipCnt_1_i_1__0_n_0;
  wire IntSlipCnt_2_i_1__0_n_0;
  wire [2:0]IntSlipCnt_d;

  LUT4 #(
    .INIT(16'hFF08)) 
    FDCE_instIntEqu_i_2__0
       (.I0(IntSlipCnt_d[0]),
        .I1(IntSlipCnt_d[2]),
        .I2(IntSlipCnt_d[1]),
        .I3(IntRstIn_d),
        .O(IntSlipCntRst));
  LUT6 #(
    .INIT(64'h0000000055554010)) 
    FDSE_instrstIn0_i_2__0
       (.I0(IntSlipCnt_d[1]),
        .I1(IntRegOutIn),
        .I2(FDSE_instrstIn7),
        .I3(IntFrmSrdsDatOdd),
        .I4(IntEqu_d),
        .I5(IntSlipCnt_d[2]),
        .O(IntSlipCnt_1_0));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT5 #(
    .INIT(32'h00004000)) 
    \IntAddr_reg[0]_i_2__0 
       (.I0(\IntAddr_reg[0]_i_1__0 [1]),
        .I1(IntSlipCnt_d[2]),
        .I2(IntSlipCnt_d[1]),
        .I3(IntSlipCnt_d[0]),
        .I4(\IntAddr_reg[0]_i_1__0 [0]),
        .O(EquCnt_3));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \IntAddr_reg[0]_i_3__0 
       (.I0(IntSlipCnt_d[0]),
        .I1(IntSlipCnt_d[1]),
        .I2(IntSlipCnt_d[2]),
        .I3(\IntAddr_reg[0]_i_1__0 [1]),
        .O(IntSlipCnt_0_0));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \IntAddr_reg[1]_i_2__0 
       (.I0(IntSlipCnt_d[1]),
        .I1(IntSlipCnt_d[2]),
        .O(IntSlipCnt_1_1));
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    IntSlipCnt_0
       (.C(CLK),
        .CE(IntPulse),
        .D(D),
        .Q(IntSlipCnt_d[0]),
        .R(IntSlipCntRst));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT2 #(
    .INIT(4'h9)) 
    IntSlipCnt_0_i_2__0
       (.I0(IntSlipCnt_d[2]),
        .I1(IntSlipCnt_d[1]),
        .O(D));
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    IntSlipCnt_1
       (.C(CLK),
        .CE(IntPulse),
        .D(IntSlipCnt_1_i_1__0_n_0),
        .Q(IntSlipCnt_d[1]),
        .R(IntSlipCntRst));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'h74)) 
    IntSlipCnt_1_i_1__0
       (.I0(IntSlipCnt_d[2]),
        .I1(IntSlipCnt_d[0]),
        .I2(IntSlipCnt_d[1]),
        .O(IntSlipCnt_1_i_1__0_n_0));
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    IntSlipCnt_2
       (.C(CLK),
        .CE(IntPulse),
        .D(IntSlipCnt_2_i_1__0_n_0),
        .Q(IntSlipCnt_d[2]),
        .R(IntSlipCntRst));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hB0)) 
    IntSlipCnt_2_i_1__0
       (.I0(IntSlipCnt_d[2]),
        .I1(IntSlipCnt_d[0]),
        .I2(IntSlipCnt_d[1]),
        .O(IntSlipCnt_2_i_1__0_n_0));
endmodule

(* ORIG_REF_NAME = "IntSlipCntModule" *) 
module IntSlipCntModule_7
   (IntSlipCnt_d,
    IntSlipCntRst,
    IntSlipCnt_1_0,
    EquCnt_3,
    IntSlipCnt_1_1,
    IntSlipCnt_0_0,
    IntPulse,
    CLK,
    IntRegOutIn,
    FDSE_instrstIn7,
    IntFrmSrdsDatEvn,
    IntEqu_d,
    IntRstIn_d,
    \IntAddr_reg[0]_i_1 );
  output [2:0]IntSlipCnt_d;
  output IntSlipCntRst;
  output IntSlipCnt_1_0;
  output EquCnt_3;
  output IntSlipCnt_1_1;
  output IntSlipCnt_0_0;
  input IntPulse;
  input CLK;
  input [0:0]IntRegOutIn;
  input FDSE_instrstIn7;
  input [0:0]IntFrmSrdsDatEvn;
  input IntEqu_d;
  input IntRstIn_d;
  input [1:0]\IntAddr_reg[0]_i_1 ;

  wire CLK;
  wire D;
  wire EquCnt_3;
  wire FDSE_instrstIn7;
  wire [1:0]\IntAddr_reg[0]_i_1 ;
  wire IntEqu_d;
  wire [0:0]IntFrmSrdsDatEvn;
  wire IntPulse;
  wire [0:0]IntRegOutIn;
  wire IntRstIn_d;
  wire IntSlipCntRst;
  wire IntSlipCnt_0_0;
  wire IntSlipCnt_1_0;
  wire IntSlipCnt_1_1;
  wire IntSlipCnt_1_i_1_n_0;
  wire IntSlipCnt_2_i_1_n_0;
  wire [2:0]IntSlipCnt_d;

  LUT4 #(
    .INIT(16'hFF08)) 
    FDCE_instIntEqu_i_2
       (.I0(IntSlipCnt_d[0]),
        .I1(IntSlipCnt_d[2]),
        .I2(IntSlipCnt_d[1]),
        .I3(IntRstIn_d),
        .O(IntSlipCntRst));
  LUT6 #(
    .INIT(64'h0000000055554010)) 
    FDSE_instrstIn0_i_2
       (.I0(IntSlipCnt_d[1]),
        .I1(IntRegOutIn),
        .I2(FDSE_instrstIn7),
        .I3(IntFrmSrdsDatEvn),
        .I4(IntEqu_d),
        .I5(IntSlipCnt_d[2]),
        .O(IntSlipCnt_1_0));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT5 #(
    .INIT(32'h00004000)) 
    \IntAddr_reg[0]_i_2 
       (.I0(\IntAddr_reg[0]_i_1 [1]),
        .I1(IntSlipCnt_d[2]),
        .I2(IntSlipCnt_d[1]),
        .I3(IntSlipCnt_d[0]),
        .I4(\IntAddr_reg[0]_i_1 [0]),
        .O(EquCnt_3));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \IntAddr_reg[0]_i_3 
       (.I0(IntSlipCnt_d[0]),
        .I1(IntSlipCnt_d[1]),
        .I2(IntSlipCnt_d[2]),
        .I3(\IntAddr_reg[0]_i_1 [1]),
        .O(IntSlipCnt_0_0));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \IntAddr_reg[1]_i_2 
       (.I0(IntSlipCnt_d[1]),
        .I1(IntSlipCnt_d[2]),
        .O(IntSlipCnt_1_1));
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    IntSlipCnt_0
       (.C(CLK),
        .CE(IntPulse),
        .D(D),
        .Q(IntSlipCnt_d[0]),
        .R(IntSlipCntRst));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT2 #(
    .INIT(4'h9)) 
    IntSlipCnt_0_i_2
       (.I0(IntSlipCnt_d[2]),
        .I1(IntSlipCnt_d[1]),
        .O(D));
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    IntSlipCnt_1
       (.C(CLK),
        .CE(IntPulse),
        .D(IntSlipCnt_1_i_1_n_0),
        .Q(IntSlipCnt_d[1]),
        .R(IntSlipCntRst));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'h74)) 
    IntSlipCnt_1_i_1
       (.I0(IntSlipCnt_d[2]),
        .I1(IntSlipCnt_d[0]),
        .I2(IntSlipCnt_d[1]),
        .O(IntSlipCnt_1_i_1_n_0));
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    IntSlipCnt_2
       (.C(CLK),
        .CE(IntPulse),
        .D(IntSlipCnt_2_i_1_n_0),
        .Q(IntSlipCnt_d[2]),
        .R(IntSlipCntRst));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB0)) 
    IntSlipCnt_2_i_1
       (.I0(IntSlipCnt_d[2]),
        .I1(IntSlipCnt_d[0]),
        .I2(IntSlipCnt_d[1]),
        .O(IntSlipCnt_2_i_1_n_0));
endmodule

module IntSrlModule
   (IntSrlOut,
    IntRegOutIn,
    CLK,
    D,
    E);
  output [3:0]IntSrlOut;
  input [3:0]IntRegOutIn;
  input CLK;
  input [2:0]D;
  input [0:0]E;

  wire [2:0]A;
  wire CLK;
  wire [2:0]D;
  wire [0:0]E;
  wire [3:0]IntRegOutIn;
  wire [3:0]IntSrlOut;

  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \IntAddr_reg[0] 
       (.CLR(1'b0),
        .D(D[0]),
        .G(E),
        .GE(1'b1),
        .Q(A[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \IntAddr_reg[1] 
       (.CLR(1'b0),
        .D(D[1]),
        .G(E),
        .GE(1'b1),
        .Q(A[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \IntAddr_reg[2] 
       (.CLR(1'b0),
        .D(D[2]),
        .G(E),
        .GE(1'b1),
        .Q(A[2]));
  (* OPT_MODIFIED = "RETARGET" *) 
  (* XILINX_LEGACY_PRIM = "SRLC32E" *) 
  (* box_type = "PRIMITIVE" *) 
  (* srl_name = "\fclk/FCLK_ODD/IntSrl1/SRLC32E_instintreg0 " *) 
  SRL16E #(
    .INIT(16'h0000),
    .IS_CLK_INVERTED(1'b0)) 
    SRLC32E_instintreg0
       (.A0(A[0]),
        .A1(A[1]),
        .A2(A[2]),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(CLK),
        .D(IntRegOutIn[0]),
        .Q(IntSrlOut[0]));
  (* OPT_MODIFIED = "RETARGET" *) 
  (* XILINX_LEGACY_PRIM = "SRLC32E" *) 
  (* box_type = "PRIMITIVE" *) 
  (* srl_name = "\fclk/FCLK_ODD/IntSrl1/SRLC32E_instintreg1 " *) 
  SRL16E #(
    .INIT(16'h0000),
    .IS_CLK_INVERTED(1'b0)) 
    SRLC32E_instintreg1
       (.A0(A[0]),
        .A1(A[1]),
        .A2(A[2]),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(CLK),
        .D(IntRegOutIn[1]),
        .Q(IntSrlOut[1]));
  (* OPT_MODIFIED = "RETARGET" *) 
  (* XILINX_LEGACY_PRIM = "SRLC32E" *) 
  (* box_type = "PRIMITIVE" *) 
  (* srl_name = "\fclk/FCLK_ODD/IntSrl1/SRLC32E_instintreg2 " *) 
  SRL16E #(
    .INIT(16'h0000),
    .IS_CLK_INVERTED(1'b0)) 
    SRLC32E_instintreg2
       (.A0(A[0]),
        .A1(A[1]),
        .A2(A[2]),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(CLK),
        .D(IntRegOutIn[2]),
        .Q(IntSrlOut[2]));
  (* OPT_MODIFIED = "RETARGET" *) 
  (* XILINX_LEGACY_PRIM = "SRLC32E" *) 
  (* box_type = "PRIMITIVE" *) 
  (* srl_name = "\fclk/FCLK_ODD/IntSrl1/SRLC32E_instintreg3 " *) 
  SRL16E #(
    .INIT(16'h0000),
    .IS_CLK_INVERTED(1'b0)) 
    SRLC32E_instintreg3
       (.A0(A[0]),
        .A1(A[1]),
        .A2(A[2]),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(CLK),
        .D(IntRegOutIn[3]),
        .Q(IntSrlOut[3]));
endmodule

(* ORIG_REF_NAME = "IntSrlModule" *) 
module IntSrlModule_4
   (IntSrlOut,
    IntRegOutIn,
    CLK,
    D,
    E);
  output [3:0]IntSrlOut;
  input [3:0]IntRegOutIn;
  input CLK;
  input [2:0]D;
  input [0:0]E;

  wire [2:0]A;
  wire CLK;
  wire [2:0]D;
  wire [0:0]E;
  wire [3:0]IntRegOutIn;
  wire [3:0]IntSrlOut;

  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \IntAddr_reg[0] 
       (.CLR(1'b0),
        .D(D[0]),
        .G(E),
        .GE(1'b1),
        .Q(A[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \IntAddr_reg[1] 
       (.CLR(1'b0),
        .D(D[1]),
        .G(E),
        .GE(1'b1),
        .Q(A[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \IntAddr_reg[2] 
       (.CLR(1'b0),
        .D(D[2]),
        .G(E),
        .GE(1'b1),
        .Q(A[2]));
  (* OPT_MODIFIED = "RETARGET" *) 
  (* XILINX_LEGACY_PRIM = "SRLC32E" *) 
  (* box_type = "PRIMITIVE" *) 
  (* srl_name = "\fclk/FCLK_EVN/IntSrl1/SRLC32E_instintreg0 " *) 
  SRL16E #(
    .INIT(16'h0000),
    .IS_CLK_INVERTED(1'b0)) 
    SRLC32E_instintreg0
       (.A0(A[0]),
        .A1(A[1]),
        .A2(A[2]),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(CLK),
        .D(IntRegOutIn[0]),
        .Q(IntSrlOut[0]));
  (* OPT_MODIFIED = "RETARGET" *) 
  (* XILINX_LEGACY_PRIM = "SRLC32E" *) 
  (* box_type = "PRIMITIVE" *) 
  (* srl_name = "\fclk/FCLK_EVN/IntSrl1/SRLC32E_instintreg1 " *) 
  SRL16E #(
    .INIT(16'h0000),
    .IS_CLK_INVERTED(1'b0)) 
    SRLC32E_instintreg1
       (.A0(A[0]),
        .A1(A[1]),
        .A2(A[2]),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(CLK),
        .D(IntRegOutIn[1]),
        .Q(IntSrlOut[1]));
  (* OPT_MODIFIED = "RETARGET" *) 
  (* XILINX_LEGACY_PRIM = "SRLC32E" *) 
  (* box_type = "PRIMITIVE" *) 
  (* srl_name = "\fclk/FCLK_EVN/IntSrl1/SRLC32E_instintreg2 " *) 
  SRL16E #(
    .INIT(16'h0000),
    .IS_CLK_INVERTED(1'b0)) 
    SRLC32E_instintreg2
       (.A0(A[0]),
        .A1(A[1]),
        .A2(A[2]),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(CLK),
        .D(IntRegOutIn[2]),
        .Q(IntSrlOut[2]));
  (* OPT_MODIFIED = "RETARGET" *) 
  (* XILINX_LEGACY_PRIM = "SRLC32E" *) 
  (* box_type = "PRIMITIVE" *) 
  (* srl_name = "\fclk/FCLK_EVN/IntSrl1/SRLC32E_instintreg3 " *) 
  SRL16E #(
    .INIT(16'h0000),
    .IS_CLK_INVERTED(1'b0)) 
    SRLC32E_instintreg3
       (.A0(A[0]),
        .A1(A[1]),
        .A2(A[2]),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(CLK),
        .D(IntRegOutIn[3]),
        .Q(IntSrlOut[3]));
endmodule

module RSTSetModule
   (IntEqu_d,
    IntEqu,
    CLK,
    IntSlipCntRst);
  output IntEqu_d;
  input IntEqu;
  input CLK;
  input IntSlipCntRst;

  wire CLK;
  wire IntEqu;
  wire IntEqu_d;
  wire IntSlipCntRst;

  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_instIntEqu
       (.C(CLK),
        .CE(IntEqu),
        .CLR(IntSlipCntRst),
        .D(1'b1),
        .Q(IntEqu_d));
endmodule

(* ORIG_REF_NAME = "RSTSetModule" *) 
module RSTSetModule_5
   (IntEqu_d,
    IntEqu,
    CLK,
    IntSlipCntRst);
  output IntEqu_d;
  input IntEqu;
  input CLK;
  input IntSlipCntRst;

  wire CLK;
  wire IntEqu;
  wire IntEqu_d;
  wire IntSlipCntRst;

  (* box_type = "PRIMITIVE" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0)) 
    FDCE_instIntEqu
       (.C(CLK),
        .CE(IntEqu),
        .CLR(IntSlipCntRst),
        .D(1'b1),
        .Q(IntEqu_d));
endmodule

(* ECO_CHECKSUM = "574c2411" *) 
(* NotValidForBitStream *)
module adcClock_FclkFrm
   (FCLK_n,
    FCLK_p,
    DClk_p,
    DCLK_n,
    Data_n,
    Data_p,
    AdcReSync,
    AdcIntrfcRst,
    AdcIntrfcEna,
    IntRst,
    FrmClkEna_out,
    FrmClkMsbRegEna,
    FrmClkLsbRegEna,
    FrmClkSwapMux,
    FrmClkReSyncOut,
    FrmClkSyncWarn,
    AdcBitClkAlgnWrn,
    AdcBitClkInvrld,
    FrmClkDat,
    dataOut,
    BitClkDone);
  input FCLK_n;
  input FCLK_p;
  input DClk_p;
  input DCLK_n;
  input Data_n;
  input Data_p;
  input AdcReSync;
  input AdcIntrfcRst;
  input AdcIntrfcEna;
  output IntRst;
  output FrmClkEna_out;
  output FrmClkMsbRegEna;
  output FrmClkLsbRegEna;
  output FrmClkSwapMux;
  output FrmClkReSyncOut;
  output FrmClkSyncWarn;
  output AdcBitClkAlgnWrn;
  output AdcBitClkInvrld;
  output [15:0]FrmClkDat;
  output [13:0]dataOut;
  output BitClkDone;

  wire \ADCFrame/CLR ;
  wire AdcBitClkAlgnWrn;
  wire AdcBitClkAlgnWrn_OBUF;
  wire AdcBitClkInvrld;
  wire AdcBitClkInvrld_OBUF;
  wire AdcIntrfcEna;
  wire AdcIntrfcEna_IBUF;
  wire AdcIntrfcRst;
  wire AdcIntrfcRst_IBUF;
  wire AdcReSync;
  wire AdcReSync_IBUF;
  wire BitClkDone;
  wire BitClkDone_OBUF;
  wire BitClk_MonClkIn;
  wire BitClk_RefClkIn;
  (* DIFF_TERM = 0 *) (* IBUF_LOW_PWR *) wire DCLK_n;
  wire DCLK_p_Int;
  (* DIFF_TERM = 0 *) (* IBUF_LOW_PWR *) wire DClk_p;
  wire D__0;
  wire Data_n;
  wire Data_n_IBUF;
  wire Data_p;
  wire Data_p_IBUF;
  (* DIFF_TERM = 0 *) (* IBUF_LOW_PWR *) wire FCLK_n;
  (* DIFF_TERM = 0 *) (* IBUF_LOW_PWR *) wire FCLK_p;
  wire FrmClkBitSlip_n;
  wire FrmClkBitSlip_p;
  wire [15:0]FrmClkDat;
  wire [15:0]FrmClkDat_OBUF;
  wire FrmClkEna_out;
  wire FrmClkEna_out_OBUF;
  wire FrmClkLsbRegEna;
  wire FrmClkLsbRegEna_OBUF;
  wire FrmClkMsbRegEna;
  wire FrmClkMsbRegEna_OBUF;
  wire FrmClkReSyncOut;
  wire FrmClkReSyncOut_OBUF;
  wire FrmClkSwapMux;
  wire FrmClkSwapMux_OBUF;
  wire FrmClkSyncWarn;
  wire FrmClkSyncWarn_OBUF;
  wire IntDatDone;
  wire IntDatEna;
  wire IntRst;
  wire IntRst_OBUF;
  wire RST;
  wire \adcclkp/IntProceedCnt0 ;
  wire [13:0]dataOut;
  wire [12:0]dataOutIn;
  wire [13:0]dataOut_OBUF;
  wire iserdes_dat_in_n_10;
  wire iserdes_dat_in_n_11;
  wire iserdes_dat_in_n_12;
  wire iserdes_dat_in_n_13;
  wire iserdes_dat_in_n_8;
  wire iserdes_dat_in_n_9;
  wire lopt;

initial begin
 $sdf_annotate("iserdes_1_time_impl.sdf",,,,"tool_control");
end
  OBUF AdcBitClkAlgnWrn_OBUF_inst
       (.I(AdcBitClkAlgnWrn_OBUF),
        .O(AdcBitClkAlgnWrn));
  OBUF AdcBitClkInvrld_OBUF_inst
       (.I(AdcBitClkInvrld_OBUF),
        .O(AdcBitClkInvrld));
  IBUF #(
    .CCIO_EN("TRUE")) 
    AdcIntrfcEna_IBUF_inst
       (.I(AdcIntrfcEna),
        .O(AdcIntrfcEna_IBUF));
  IBUF #(
    .CCIO_EN("TRUE")) 
    AdcIntrfcRst_IBUF_inst
       (.I(AdcIntrfcRst),
        .O(AdcIntrfcRst_IBUF));
  IBUF #(
    .CCIO_EN("TRUE")) 
    AdcReSync_IBUF_inst
       (.I(AdcReSync),
        .O(AdcReSync_IBUF));
  OBUF BitClkDone_OBUF_inst
       (.I(BitClkDone_OBUF),
        .O(BitClkDone));
  Dat_Iserdes_Out D
       (.CLK(BitClk_RefClkIn),
        .D(D__0),
        .DatOut({dataOutIn[12],dataOutIn[10],dataOutIn[8],dataOutIn[6],dataOutIn[4],dataOutIn[2],dataOutIn[0]}),
        .Dat_Reg_10_0(iserdes_dat_in_n_12),
        .Dat_Reg_12_0(iserdes_dat_in_n_13),
        .Dat_Reg_2_0(iserdes_dat_in_n_8),
        .Dat_Reg_4_0(iserdes_dat_in_n_9),
        .Dat_Reg_6_0(iserdes_dat_in_n_10),
        .Dat_Reg_8_0(iserdes_dat_in_n_11),
        .FrmClkReSyncOut_OBUF(FrmClkReSyncOut_OBUF),
        .FrmClkSwapMux_OBUF(FrmClkSwapMux_OBUF),
        .IntDatEna(IntDatEna),
        .dataOut_OBUF(dataOut_OBUF));
  IBUF #(
    .CCIO_EN("TRUE")) 
    Data_n_IBUF_inst
       (.I(Data_n),
        .O(Data_n_IBUF));
  IBUF #(
    .CCIO_EN("TRUE")) 
    Data_p_IBUF_inst
       (.I(Data_p),
        .O(Data_p_IBUF));
  OBUF \FrmClkDat_OBUF[0]_inst 
       (.I(FrmClkDat_OBUF[0]),
        .O(FrmClkDat[0]));
  OBUF \FrmClkDat_OBUF[10]_inst 
       (.I(FrmClkDat_OBUF[10]),
        .O(FrmClkDat[10]));
  OBUF \FrmClkDat_OBUF[11]_inst 
       (.I(FrmClkDat_OBUF[11]),
        .O(FrmClkDat[11]));
  OBUF \FrmClkDat_OBUF[12]_inst 
       (.I(FrmClkDat_OBUF[12]),
        .O(FrmClkDat[12]));
  OBUF \FrmClkDat_OBUF[13]_inst 
       (.I(FrmClkDat_OBUF[13]),
        .O(FrmClkDat[13]));
  OBUF \FrmClkDat_OBUF[14]_inst 
       (.I(FrmClkDat_OBUF[14]),
        .O(FrmClkDat[14]));
  OBUF \FrmClkDat_OBUF[15]_inst 
       (.I(FrmClkDat_OBUF[15]),
        .O(FrmClkDat[15]));
  OBUF \FrmClkDat_OBUF[1]_inst 
       (.I(FrmClkDat_OBUF[1]),
        .O(FrmClkDat[1]));
  OBUF \FrmClkDat_OBUF[2]_inst 
       (.I(FrmClkDat_OBUF[2]),
        .O(FrmClkDat[2]));
  OBUF \FrmClkDat_OBUF[3]_inst 
       (.I(FrmClkDat_OBUF[3]),
        .O(FrmClkDat[3]));
  OBUF \FrmClkDat_OBUF[4]_inst 
       (.I(FrmClkDat_OBUF[4]),
        .O(FrmClkDat[4]));
  OBUF \FrmClkDat_OBUF[5]_inst 
       (.I(FrmClkDat_OBUF[5]),
        .O(FrmClkDat[5]));
  OBUF \FrmClkDat_OBUF[6]_inst 
       (.I(FrmClkDat_OBUF[6]),
        .O(FrmClkDat[6]));
  OBUF \FrmClkDat_OBUF[7]_inst 
       (.I(FrmClkDat_OBUF[7]),
        .O(FrmClkDat[7]));
  OBUF \FrmClkDat_OBUF[8]_inst 
       (.I(FrmClkDat_OBUF[8]),
        .O(FrmClkDat[8]));
  OBUF \FrmClkDat_OBUF[9]_inst 
       (.I(FrmClkDat_OBUF[9]),
        .O(FrmClkDat[9]));
  OBUF FrmClkEna_out_OBUF_inst
       (.I(FrmClkEna_out_OBUF),
        .O(FrmClkEna_out));
  OBUF FrmClkLsbRegEna_OBUF_inst
       (.I(FrmClkLsbRegEna_OBUF),
        .O(FrmClkLsbRegEna));
  OBUF FrmClkMsbRegEna_OBUF_inst
       (.I(FrmClkMsbRegEna_OBUF),
        .O(FrmClkMsbRegEna));
  OBUF FrmClkReSyncOut_OBUF_inst
       (.I(FrmClkReSyncOut_OBUF),
        .O(FrmClkReSyncOut));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF FrmClkSwapMux_OBUF_inst
       (.I(lopt),
        .O(FrmClkSwapMux));
  OBUF FrmClkSyncWarn_OBUF_inst
       (.I(FrmClkSyncWarn_OBUF),
        .O(FrmClkSyncWarn));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* XILINX_LEGACY_PRIM = "IBUFGDS" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .CCIO_EN_M("TRUE"),
    .CCIO_EN_S("TRUE"),
    .IOSTANDARD("DEFAULT")) 
    IBUFGDS_inst
       (.I(DClk_p),
        .IB(DCLK_n),
        .O(DCLK_p_Int));
  OBUF IntRst_OBUF_inst
       (.I(IntRst_OBUF),
        .O(IntRst));
  AdcClock adc
       (.AdcBitClkAlgnWrn_OBUF(AdcBitClkAlgnWrn_OBUF),
        .AdcBitClkInvrld_OBUF(AdcBitClkInvrld_OBUF),
        .BitClkDone_OBUF(BitClkDone_OBUF),
        .CLK(BitClk_RefClkIn),
        .DCLK_p_Int(DCLK_p_Int),
        .DatClk(BitClk_MonClkIn),
        .FrmClkEna(FrmClkEna_out_OBUF),
        .IntProceedCnt0(\adcclkp/IntProceedCnt0 ),
        .IntRst(IntRst_OBUF),
        .RST(RST));
  Adc_FDPE adc_F
       (.AR(\ADCFrame/CLR ),
        .AdcIntrfcEna(AdcIntrfcEna_IBUF),
        .AdcIntrfcRst(AdcIntrfcRst_IBUF),
        .AdcReSync_IBUF(AdcReSync_IBUF),
        .BitClkDone_OBUF(BitClkDone_OBUF),
        .CLK(BitClk_RefClkIn),
        .FrmClkEna(FrmClkEna_out_OBUF),
        .FrmClkReSyncOut_OBUF(FrmClkReSyncOut_OBUF),
        .IntDatDone(IntDatDone),
        .IntDatEna(IntDatEna),
        .IntProceedCnt0(\adcclkp/IntProceedCnt0 ),
        .IntRst(IntRst_OBUF),
        .RST(RST));
  AdcDataDone adcdone
       (.BitClkDone_OBUF(BitClkDone_OBUF),
        .CLK(BitClk_RefClkIn),
        .IntDatDone(IntDatDone),
        .IntRst(IntRst_OBUF));
  OBUF \dataOut_OBUF[0]_inst 
       (.I(dataOut_OBUF[0]),
        .O(dataOut[0]));
  OBUF \dataOut_OBUF[10]_inst 
       (.I(dataOut_OBUF[10]),
        .O(dataOut[10]));
  OBUF \dataOut_OBUF[11]_inst 
       (.I(dataOut_OBUF[11]),
        .O(dataOut[11]));
  OBUF \dataOut_OBUF[12]_inst 
       (.I(dataOut_OBUF[12]),
        .O(dataOut[12]));
  OBUF \dataOut_OBUF[13]_inst 
       (.I(dataOut_OBUF[13]),
        .O(dataOut[13]));
  OBUF \dataOut_OBUF[1]_inst 
       (.I(dataOut_OBUF[1]),
        .O(dataOut[1]));
  OBUF \dataOut_OBUF[2]_inst 
       (.I(dataOut_OBUF[2]),
        .O(dataOut[2]));
  OBUF \dataOut_OBUF[3]_inst 
       (.I(dataOut_OBUF[3]),
        .O(dataOut[3]));
  OBUF \dataOut_OBUF[4]_inst 
       (.I(dataOut_OBUF[4]),
        .O(dataOut[4]));
  OBUF \dataOut_OBUF[5]_inst 
       (.I(dataOut_OBUF[5]),
        .O(dataOut[5]));
  OBUF \dataOut_OBUF[6]_inst 
       (.I(dataOut_OBUF[6]),
        .O(dataOut[6]));
  OBUF \dataOut_OBUF[7]_inst 
       (.I(dataOut_OBUF[7]),
        .O(dataOut[7]));
  OBUF \dataOut_OBUF[8]_inst 
       (.I(dataOut_OBUF[8]),
        .O(dataOut[8]));
  OBUF \dataOut_OBUF[9]_inst 
       (.I(dataOut_OBUF[9]),
        .O(dataOut[9]));
  FCLK_ADC fclk
       (.AR(\ADCFrame/CLR ),
        .AdcReSync_IBUF(AdcReSync_IBUF),
        .BitClkDone_OBUF(BitClkDone_OBUF),
        .CLK(BitClk_RefClkIn),
        .DatClk(BitClk_MonClkIn),
        .FCLK_n(FCLK_n),
        .FCLK_p(FCLK_p),
        .FrmClkDat_OBUF(FrmClkDat_OBUF),
        .FrmClkEna(FrmClkEna_out_OBUF),
        .FrmClkLsbRegEna_OBUF(FrmClkLsbRegEna_OBUF),
        .FrmClkMsbRegEna_OBUF(FrmClkMsbRegEna_OBUF),
        .FrmClkReSyncOut_OBUF(FrmClkReSyncOut_OBUF),
        .FrmClkSwapMux_OBUF(FrmClkSwapMux_OBUF),
        .FrmClkSyncWarn_OBUF(FrmClkSyncWarn_OBUF),
        .Q({FrmClkBitSlip_n,FrmClkBitSlip_p}),
        .lopt(lopt));
  iserdes_adc iserdes_dat_in
       (.ADCDATANInt(Data_n_IBUF),
        .ADCDATAPInt(Data_p_IBUF),
        .CLK(BitClk_RefClkIn),
        .D(D__0),
        .DatClk(BitClk_MonClkIn),
        .DatOut({dataOutIn[12],dataOutIn[10],dataOutIn[8],dataOutIn[6],dataOutIn[4],dataOutIn[2],dataOutIn[0]}),
        .ISERDESE2_inst_D0_n_0(iserdes_dat_in_n_8),
        .ISERDESE2_inst_D0_n_1(iserdes_dat_in_n_9),
        .ISERDESE2_inst_D0_n_2(iserdes_dat_in_n_10),
        .ISERDESE2_inst_D0_n_3(iserdes_dat_in_n_11),
        .ISERDESE2_inst_D0_n_4(iserdes_dat_in_n_12),
        .ISERDESE2_inst_D0_n_5(iserdes_dat_in_n_13),
        .IntDatDone(IntDatDone),
        .IntRst(IntRst_OBUF),
        .Q({FrmClkBitSlip_n,FrmClkBitSlip_p}));
endmodule

module iserdes_adc
   (D,
    DatOut,
    ISERDESE2_inst_D0_n_0,
    ISERDESE2_inst_D0_n_1,
    ISERDESE2_inst_D0_n_2,
    ISERDESE2_inst_D0_n_3,
    ISERDESE2_inst_D0_n_4,
    ISERDESE2_inst_D0_n_5,
    Q,
    IntDatDone,
    DatClk,
    CLK,
    ADCDATAPInt,
    IntRst,
    ADCDATANInt);
  output D;
  output [6:0]DatOut;
  output ISERDESE2_inst_D0_n_0;
  output ISERDESE2_inst_D0_n_1;
  output ISERDESE2_inst_D0_n_2;
  output ISERDESE2_inst_D0_n_3;
  output ISERDESE2_inst_D0_n_4;
  output ISERDESE2_inst_D0_n_5;
  input [1:0]Q;
  input IntDatDone;
  input DatClk;
  input CLK;
  input ADCDATAPInt;
  input IntRst;
  input ADCDATANInt;

  wire ADCDATANInt;
  wire ADCDATAPInt;
  wire CLK;
  wire D;
  wire DatClk;
  wire [6:0]DatOut;
  wire ISERDESE2_inst_D0_n_0;
  wire ISERDESE2_inst_D0_n_1;
  wire ISERDESE2_inst_D0_n_2;
  wire ISERDESE2_inst_D0_n_3;
  wire ISERDESE2_inst_D0_n_4;
  wire ISERDESE2_inst_D0_n_5;
  wire IntDatDone;
  wire IntRst;
  wire [1:0]Q;
  wire [13:1]dataOutIn;
  wire NLW_ISERDESE2_inst_D0_P_O_UNCONNECTED;
  wire NLW_ISERDESE2_inst_D0_P_Q8_UNCONNECTED;
  wire NLW_ISERDESE2_inst_D0_P_SHIFTOUT1_UNCONNECTED;
  wire NLW_ISERDESE2_inst_D0_P_SHIFTOUT2_UNCONNECTED;
  wire NLW_ISERDESE2_inst_D0_n_O_UNCONNECTED;
  wire NLW_ISERDESE2_inst_D0_n_Q8_UNCONNECTED;
  wire NLW_ISERDESE2_inst_D0_n_SHIFTOUT1_UNCONNECTED;
  wire NLW_ISERDESE2_inst_D0_n_SHIFTOUT2_UNCONNECTED;

  LUT1 #(
    .INIT(2'h1)) 
    Dat_Reg_0_i_2
       (.I0(dataOutIn[13]),
        .O(D));
  LUT1 #(
    .INIT(2'h1)) 
    Dat_Reg_10_i_1
       (.I0(dataOutIn[3]),
        .O(ISERDESE2_inst_D0_n_4));
  LUT1 #(
    .INIT(2'h1)) 
    Dat_Reg_12_i_1
       (.I0(dataOutIn[1]),
        .O(ISERDESE2_inst_D0_n_5));
  LUT1 #(
    .INIT(2'h1)) 
    Dat_Reg_2_i_1
       (.I0(dataOutIn[11]),
        .O(ISERDESE2_inst_D0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    Dat_Reg_4_i_1
       (.I0(dataOutIn[9]),
        .O(ISERDESE2_inst_D0_n_1));
  LUT1 #(
    .INIT(2'h1)) 
    Dat_Reg_6_i_1
       (.I0(dataOutIn[7]),
        .O(ISERDESE2_inst_D0_n_2));
  LUT1 #(
    .INIT(2'h1)) 
    Dat_Reg_8_i_1
       (.I0(dataOutIn[5]),
        .O(ISERDESE2_inst_D0_n_3));
  (* box_type = "PRIMITIVE" *) 
  ISERDESE2 #(
    .DATA_RATE("SDR"),
    .DATA_WIDTH(7),
    .DYN_CLKDIV_INV_EN("FALSE"),
    .DYN_CLK_INV_EN("FALSE"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .INIT_Q3(1'b0),
    .INIT_Q4(1'b0),
    .INTERFACE_TYPE("NETWORKING"),
    .IOBDELAY("NONE"),
    .IS_CLKB_INVERTED(1'b0),
    .IS_CLKDIVP_INVERTED(1'b0),
    .IS_CLKDIV_INVERTED(1'b0),
    .IS_CLK_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_OCLKB_INVERTED(1'b0),
    .IS_OCLK_INVERTED(1'b0),
    .NUM_CE(1),
    .OFB_USED("FALSE"),
    .SERDES_MODE("MASTER"),
    .SRVAL_Q1(1'b0),
    .SRVAL_Q2(1'b0),
    .SRVAL_Q3(1'b0),
    .SRVAL_Q4(1'b0)) 
    ISERDESE2_inst_D0_P
       (.BITSLIP(Q[1]),
        .CE1(IntDatDone),
        .CE2(1'b0),
        .CLK(DatClk),
        .CLKB(1'b0),
        .CLKDIV(CLK),
        .CLKDIVP(1'b0),
        .D(ADCDATAPInt),
        .DDLY(1'b0),
        .DYNCLKDIVSEL(1'b0),
        .DYNCLKSEL(1'b0),
        .O(NLW_ISERDESE2_inst_D0_P_O_UNCONNECTED),
        .OCLK(1'b0),
        .OCLKB(1'b0),
        .OFB(1'b0),
        .Q1(DatOut[6]),
        .Q2(DatOut[5]),
        .Q3(DatOut[4]),
        .Q4(DatOut[3]),
        .Q5(DatOut[2]),
        .Q6(DatOut[1]),
        .Q7(DatOut[0]),
        .Q8(NLW_ISERDESE2_inst_D0_P_Q8_UNCONNECTED),
        .RST(IntRst),
        .SHIFTIN1(1'b0),
        .SHIFTIN2(1'b0),
        .SHIFTOUT1(NLW_ISERDESE2_inst_D0_P_SHIFTOUT1_UNCONNECTED),
        .SHIFTOUT2(NLW_ISERDESE2_inst_D0_P_SHIFTOUT2_UNCONNECTED));
  (* box_type = "PRIMITIVE" *) 
  ISERDESE2 #(
    .DATA_RATE("SDR"),
    .DATA_WIDTH(7),
    .DYN_CLKDIV_INV_EN("FALSE"),
    .DYN_CLK_INV_EN("FALSE"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .INIT_Q3(1'b0),
    .INIT_Q4(1'b0),
    .INTERFACE_TYPE("NETWORKING"),
    .IOBDELAY("NONE"),
    .IS_CLKB_INVERTED(1'b0),
    .IS_CLKDIVP_INVERTED(1'b0),
    .IS_CLKDIV_INVERTED(1'b0),
    .IS_CLK_INVERTED(1'b1),
    .IS_D_INVERTED(1'b0),
    .IS_OCLKB_INVERTED(1'b0),
    .IS_OCLK_INVERTED(1'b0),
    .NUM_CE(1),
    .OFB_USED("FALSE"),
    .SERDES_MODE("MASTER"),
    .SRVAL_Q1(1'b0),
    .SRVAL_Q2(1'b0),
    .SRVAL_Q3(1'b0),
    .SRVAL_Q4(1'b0)) 
    ISERDESE2_inst_D0_n
       (.BITSLIP(Q[0]),
        .CE1(IntDatDone),
        .CE2(1'b0),
        .CLK(DatClk),
        .CLKB(1'b0),
        .CLKDIV(CLK),
        .CLKDIVP(1'b0),
        .D(ADCDATANInt),
        .DDLY(1'b0),
        .DYNCLKDIVSEL(1'b0),
        .DYNCLKSEL(1'b0),
        .O(NLW_ISERDESE2_inst_D0_n_O_UNCONNECTED),
        .OCLK(1'b0),
        .OCLKB(1'b0),
        .OFB(1'b0),
        .Q1(dataOutIn[13]),
        .Q2(dataOutIn[11]),
        .Q3(dataOutIn[9]),
        .Q4(dataOutIn[7]),
        .Q5(dataOutIn[5]),
        .Q6(dataOutIn[3]),
        .Q7(dataOutIn[1]),
        .Q8(NLW_ISERDESE2_inst_D0_n_Q8_UNCONNECTED),
        .RST(IntRst),
        .SHIFTIN1(1'b0),
        .SHIFTIN2(1'b0),
        .SHIFTOUT1(NLW_ISERDESE2_inst_D0_n_SHIFTOUT1_UNCONNECTED),
        .SHIFTOUT2(NLW_ISERDESE2_inst_D0_n_SHIFTOUT2_UNCONNECTED));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
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
    reg GRESTORE_int;

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
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

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

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
