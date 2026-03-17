v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -10 -100 -10 -80 {lab=VDD}
N 10 -120 10 -80 {lab=GND}
N 30 -110 30 -80 {lab=#net1}
N 50 -110 50 -80 {lab=#net2}
N -180 -20 -130 -20 {lab=V_in}
N -10 80 -10 150 {lab=V_cm}
N 10 80 10 150 {lab=V_bias}
N 30 80 30 150 {lab=V_lk}
N 50 80 50 150 {lab=V_ref}
N -180 0 -130 0 {lab=ACK}
N 170 0 240 0 {lab=Vmem}
N 170 20 240 20 {lab=Vrefcap}
N 170 -20 240 -20 {lab=REQ}
C {neuron_row.sym} 20 -10 0 0 {name=xrow}
C {vdd.sym} -10 -100 0 0 {name=l13 lab=VDD}
C {lab_wire.sym} 10 -80 3 1 {name=p23 sig_type=std_logic lab=GND}
C {lab_wire.sym} -150 -20 0 0 {name=p24 sig_type=std_logic lab=V_in}
C {lab_wire.sym} -10 120 3 0 {name=p25 sig_type=std_logic lab=V_cm}
C {lab_wire.sym} 10 120 3 0 {name=p26 sig_type=std_logic lab=V_bias}
C {lab_wire.sym} 30 120 3 0 {name=p27 sig_type=std_logic lab=V_lk}
C {lab_wire.sym} 50 120 3 0 {name=p28 sig_type=std_logic lab=V_ref}
C {lab_wire.sym} -150 0 0 0 {name=p29 sig_type=std_logic lab=ACK}
C {lab_wire.sym} 180 -20 0 1 {name=p30 sig_type=std_logic lab=REQ}
C {lab_wire.sym} 180 0 0 1 {name=p31 sig_type=std_logic lab=Vmem}
C {lab_wire.sym} 180 20 0 1 {name=p32 sig_type=std_logic lab=Vrefcap}
