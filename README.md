# **HSPICE Circuit Simulation**  

This project focuses on designing and simulating a **2-bit comparator circuit** using **HSPICE**. The system evaluates transistor sizing, delay parameters, and power consumption.

---

## **Project Overview**  

The comparator circuit:  
- **Compares two 2-bit binary inputs** (A1, A0 vs. B1, B0).  
- **Determines three outputs**: Equal (A = B), Greater (A > B), and Less (A < B).  
- **Uses HSPICE for simulation** of circuit behavior and performance.    

---

## **Features**  

1. **2-Bit Comparator Design**  
   - Determines if one binary number is greater than, less than, or equal to another.  

2. **Transistor Sizing**  
   - **PMOS:** 72µm / 0.18µm  
   - **NMOS:** 36µm / 0.18µm  

3. **Subcircuit for Inverter**  
   - Avoids redundant code using reusable `inv` subcircuit.  

4. **HSPICE Simulation Setup**  
   - **Input Stimuli**: PULSE sources applied to inputs.  
   - **Transient Analysis**: Simulated over **160ns** with **10ps** time steps.  

5. **Performance Evaluation**  
   - **Measures Rise Time (Tr) and Fall Time (Tf).**  
   - **Propagation delay (PLHT, PHLT).**  
   - **Calculates total power consumption.**  

---

## **Simulation & Execution**  

### **Simulation Setup**  
- The circuit is modeled in **HSPICE**, with defined transistor parameters and input signals.  
- The following PULSE voltage sources are applied:  
  ```
  VA0 A0 gnd PULSE ('SUPPLY' 0 0ps 100ps 100ps 10ns 20ns)
  VA1 A1 gnd PULSE ('SUPPLY' 0 0ps 100ps 100ps 20ns 40ns)
  VB0 B0 gnd PULSE ('SUPPLY' 0 0ps 100ps 100ps 40ns 80ns)
  VB1 B1 gnd PULSE ('SUPPLY' 0 0ps 100ps 100ps 80ns 160ns)
  ```
- Transient analysis configuration:  
  ```
  .tran 10ps 160ns
  ```

### **Execution Steps**  
1. **Write HSPICE netlist** including the comparator circuit.  
2. **Run simulation** and extract output waveforms.  
3. **Analyze delay, power, and performance metrics.**  
4. **Extend the design** to an 8-bit comparator using subcircuits.  

---

## **Results & Visualization**  

### **Timing & Performance Metrics**  
- **Rise Time (Tr)** and **Fall Time (Tf)** calculated for output transitions.  
- **Propagation Delay**: PLHT (Low to High) and PHLT (High to Low).  
- **Power Consumption**: Measured for dynamic and static operation.  

### **Graphical Representation**  
Waveforms are analyzed to verify:  
- **Correct functionality of the comparator circuit.**  
- **Performance impact of transistor sizing and design choices.**  

---

## **Collaborators**  
- **[Your Name]**  
- **[Your Teammates' Names]**  

## **Feedback**  
For any suggestions or questions, feel free to reach out!  

---

Let me know if you need any changes! 🚀
