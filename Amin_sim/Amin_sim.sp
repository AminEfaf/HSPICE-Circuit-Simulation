
.include 'C:\Users\kiyan\Desktop\mosistsmc180.lib'

* Parameters
.param SUPPLY_VOLTAGE = 1.8

* Power Supply
VDD Vdd 0 'SUPPLY_VOLTAGE'

* Input Pulse Sources
VA0 InputA0 gnd PULSE ('SUPPLY_VOLTAGE' 0 0ps 100ps 100ps 10ns 20ns)
VA1 InputA1 gnd PULSE ('SUPPLY_VOLTAGE' 0 0ps 100ps 100ps 20ns 40ns)
VB0 InputB0 gnd PULSE ('SUPPLY_VOLTAGE' 0 0ps 100ps 100ps 40ns 80ns)
VB1 InputB1 gnd PULSE ('SUPPLY_VOLTAGE' 0 0ps 100ps 100ps 80ns 160ns)

* CMOS Inverter Subcircuit
.subckt CMOS_INVERTER input output vdd
    MP1 output input vdd vdd PMOS L=0.18u W=0.72u AS='0.72u*0.36u' PS='2*0.72u+2*0.36u' AD='0.72u*0.36u' PD='2*0.72u+2*0.36u'
    MN1 output input 0 0 NMOS L=0.18u W=0.36u AS='0.36u*0.36u' PS='2*0.36u+2*0.36u' AD='0.36u*0.36u' PD='2*0.36u+2*0.36u'
.ends

* CMOS XNOR Gate Subcircuit
.subckt CMOS_XNOR input1 input2 not_input1 not_input2 output vdd
    MP1 vdd not_input1 XNOR_pmos_node1 vdd PMOS L=0.18u W=1.44u AS='1.44u*0.36u' PS='2*1.44u+2*0.36u' AD='1.44u*0.36u' PD='2*1.44u+2*0.36u'
    MP2 vdd input2 XNOR_pmos_node2 vdd PMOS L=0.18u W=1.44u AS='1.44u*0.36u' PS='2*1.44u+2*0.36u' AD='1.44u*0.36u' PD='2*1.44u+2*0.36u'
    MP3 XNOR_pmos_node1 not_input2 output vdd PMOS L=0.18u W=1.44u AS='1.44u*0.36u' PS='2*1.44u+2*0.36u' AD='1.44u*0.36u' PD='2*1.44u+2*0.36u'
    MP4 XNOR_pmos_node2 input1 output vdd PMOS L=0.18u W=1.44u AS='1.44u*0.36u' PS='2*1.44u+2*0.36u' AD='1.44u*0.36u' PD='2*1.44u+2*0.36u'
    MN1 0 input2 XNOR_nmos_node1 0 NMOS L=0.18u W=0.72u AS='0.72u*0.36u' PS='2*0.72u+2*0.36u' AD='0.72u*0.36u' PD='2*0.72u+2*0.36u'
    MN2 XNOR_nmos_node1 not_input1 output 0 NMOS L=0.18u W=0.72u AS='0.72u*0.36u' PS='2*0.72u+2*0.36u' AD='0.72u*0.36u' PD='2*0.72u+2*0.36u'
    MN3 0 not_input2 XNOR_nmos_node2 0 NMOS L=0.18u W=0.72u AS='0.72u*0.36u' PS='2*0.72u+2*0.36u' AD='0.72u*0.36u' PD='2*0.72u+2*0.36u'
    MN4 XNOR_nmos_node2 input1 output 0 NMOS L=0.18u W=0.72u AS='0.72u*0.36u' PS='2*0.72u+2*0.36u' AD='0.72u*0.36u' PD='2*0.72u+2*0.36u'
.ends

* CMOS NAND Gate Subcircuit
.subckt CMOS_NAND input1 input2 output vdd
    MP1 vdd input1 output vdd PMOS L=0.18u W=0.72u AS='0.72u*0.36u' PS='2*0.72u+2*0.36u' AD='0.72u*0.36u' PD='2*0.72u+2*0.36u'
    MP2 vdd input2 output vdd PMOS L=0.18u W=0.72u AS='0.72u*0.36u' PS='2*0.72u+2*0.36u' AD='0.72u*0.36u' PD='2*0.72u+2*0.36u'
    MN1 0 input1 NAND_nmos_node1 0 NMOS L=0.18u W=0.72u AS='0.72u*0.36u' PS='2*0.72u+2*0.36u' AD='0.72u*0.36u' PD='2*0.72u+2*0.36u'
    MN2 NAND_nmos_node1 input2 output 0 NMOS L=0.18u W=0.72u AS='0.72u*0.36u' PS='2*0.72u+2*0.36u' AD='0.72u*0.36u' PD='2*0.72u+2*0.36u'
.ends

* CMOS 3-Input NAND Gate Subcircuit
.subckt CMOS_NAND3 input1 input2 input3 output vdd
    MP1 vdd input1 output vdd PMOS L=0.18u W=0.72u AS='0.72u*0.36u' PS='2*0.72u+2*0.36u' AD='0.72u*0.36u' PD='2*0.72u+2*0.36u'
    MP2 vdd input2 output vdd PMOS L=0.18u W=0.72u AS='0.72u*0.36u' PS='2*0.72u+2*0.36u' AD='0.72u*0.36u' PD='2*0.72u+2*0.36u'
    MP3 vdd input3 output vdd PMOS L=0.18u W=0.72u AS='0.72u*0.36u' PS='2*0.72u+2*0.36u' AD='0.72u*0.36u' PD='2*0.72u+2*0.36u'
    MN1 0 input1 NAND3_nmos_node1 0 NMOS L=0.18u W=1.08u AS='1.08u*0.36u' PS='2*1.08u+2*0.36u' AD='1.08u*0.36u' PD='2*1.08u+2*0.36u'
    MN2 NAND3_nmos_node1 input2 NAND3_nmos_node2 0 NMOS L=0.18u W=1.08u AS='1.08u*0.36u' PS='2*1.08u+2*0.36u' AD='1.08u*0.36u' PD='2*1.08u+2*0.36u'
    MN3 NAND3_nmos_node2 input3 output 0 NMOS L=0.18u W=1.08u AS='1.08u*0.36u' PS='2*1.08u+2*0.36u' AD='1.08u*0.36u' PD='2*1.08u+2*0.36u'
.ends

* Invert Inputs
XINV_A0 InputA0 InvertA0 Vdd CMOS_INVERTER
XINV_A1 InputA1 InvertA1 Vdd CMOS_INVERTER
XINV_B0 InputB0 InvertB0 Vdd CMOS_INVERTER
XINV_B1 InputB1 InvertB1 Vdd CMOS_INVERTER

* First Level Logic
* XNOR gates
XXNOR1 InputA1 InputB1 InvertA1 InvertB1 XnorOutput1 Vdd CMOS_XNOR
XXNOR2 InputA0 InputB0 InvertA0 InvertB0 XnorOutput2 Vdd CMOS_XNOR

* NAND gates
XNAND1 InputA1 InvertB1 NandOutput1 Vdd CMOS_NAND
XNAND2 InputA0 InvertB0 XnorOutput1 NandOutput2 Vdd CMOS_NAND3
XNAND3 InvertA1 InputB1 NandOutput3 Vdd CMOS_NAND
XNAND4 InvertA0 InputB0 XnorOutput1 NandOutput4 Vdd CMOS_NAND3

* Second Level Outputs
* A > B
XNAND_A_GT_B NandOutput1 NandOutput2 A_GT_B Vdd CMOS_NAND

* A = B
XNAND_A_EQ_B XnorOutput1 XnorOutput2 NandOutput5 Vdd CMOS_NAND
XINV_A_EQ_B NandOutput5 A_EQ_B Vdd CMOS_INVERTER

* A < B
XNAND_A_LT_B NandOutput3 NandOutput4 A_LT_B Vdd CMOS_NAND

* Output Load Capacitors
CL_A_GT_B A_GT_B gnd 10fF
CL_A_EQ_B A_EQ_B gnd 10fF
CL_A_LT_B A_LT_B gnd 10fF

* Simulation Options
.options post=2 nomod
.op 

* Transient Analysis
.TRAN 10ps 160ns

* Power Measurement
.measure charge INTEGRAL I(Vdd) FROM=0ns TO=80ns
.measure power param = '-charge * SUPPLY_VOLTAGE * 12500000'

* Print Voltages
.print 
+v(InputA0)
+v(InputA1)
+v(InputB0)
+v(InputB1)
+v(A_GT_B)
+v(A_EQ_B)
+v(A_LT_B)

.END
