v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 160 -460 160 -270 {lab=#net1}
N 60 -460 160 -460 {lab=#net1}
N 60 30 120 30 {lab=#net2}
N 60 -20 60 30 {lab=#net2}
N 0 30 60 30 {lab=#net2}
N -40 -20 60 -20 {lab=#net2}
N -60 30 -40 30 {lab=0}
N -40 60 -40 120 {lab=GND}
N 160 30 180 30 {lab=0}
N 160 -100 160 -90 {lab=#net3}
N 160 -100 250 -100 {lab=#net3}
N 60 -480 60 -460 {lab=#net1}
N -40 -460 60 -460 {lab=#net1}
N -40 -210 -40 -200 {lab=#net4}
N -40 -20 -40 0 {lab=#net2}
N -40 -140 -40 -20 {lab=#net2}
N 160 -30 160 0 {lab=#net5}
N 160 -210 160 -190 {lab=#net6}
N 160 -130 160 -100 {lab=#net3}
N 60 -620 100 -620 {lab=VDD}
N 100 -690 100 -620 {lab=VDD}
N 60 -590 60 -540 {lab=M13_d}
N -190 -620 20 -620 {lab=Vbias}
N -40 -240 -10 -240 {lab=VDD}
N -100 -240 -80 -240 {lab=inp_cm}
N 140 -240 160 -240 {lab=VDD}
N 200 -240 280 -240 {lab=out}
N 310 -100 400 -100 {lab=out}
N -40 -460 -40 -270 {lab=#net1}
N 60 -760 60 -650 {lab=VDD}
N -40 120 60 120 {lab=GND}
N 60 120 60 140 {lab=GND}
N 60 120 160 120 {lab=GND}
N 160 60 160 120 {lab=GND}
C {ammeter.sym} 280 -100 3 0 {name=VIout savecurrent=true spice_ignore=0}
C {sg13g2_pr/sg13_hv_pmos.sym} -60 -240 0 0 {name=M2
l=1u
w=4u
ng=1
m=4
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -20 30 0 1 {name=M5
l=1u
w=4u
ng=1
m=4
model=sg13_hv_nmos
spiceprefix=X
}
C {ammeter.sym} 60 -510 0 1 {name=Vbias1 savecurrent=true spice_ignore=0}
C {ammeter.sym} 160 -160 0 1 {name=Vbranch1 savecurrent=true spice_ignore=0}
C {ammeter.sym} -40 -170 0 1 {name=Vbranch2 savecurrent=true spice_ignore=0}
C {ammeter.sym} 160 -60 0 1 {name=Vbranch3 savecurrent=true spice_ignore=0}
C {gnd.sym} -60 30 0 0 {name=l5 lab=0}
C {gnd.sym} 180 30 0 0 {name=l12 lab=0}
C {sg13g2_pr/sg13_hv_pmos.sym} 40 -620 0 0 {name=M13
l=1u
w=4u
ng=1
m=4
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_wire.sym} 100 -650 1 0 {name=p4 sig_type=std_logic lab=VDD}
C {ipin.sym} -100 -240 0 0 {name=inp_cm1
lab=inp_cm}
C {lab_wire.sym} 140 -240 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -30 -240 2 0 {name=p3 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 380 -100 0 0 {name=p6 sig_type=std_logic lab=out}
C {opin.sym} 400 -100 0 0 {name=p8 lab=out}
C {lab_wire.sym} -30 -620 0 0 {name=p11 sig_type=std_logic lab=Vbias}
C {lab_wire.sym} 60 -560 0 0 {name=p12 sig_type=std_logic lab=M13_d}
C {sg13g2_pr/sg13_hv_pmos.sym} 180 -240 0 1 {name=M3
l=1u
w=4u
ng=1
m=4
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 140 30 0 0 {name=M1
l=1u
w=4u
ng=1
m=4
model=sg13_hv_nmos
spiceprefix=X
}
C {lab_wire.sym} 260 -240 0 0 {name=p7 sig_type=std_logic lab=out}
C {iopin.sym} 60 -760 3 0 {name=p10 lab=VDD}
C {iopin.sym} 60 140 1 0 {name=p1 lab=GND}
C {ipin.sym} -190 -620 0 0 {name=p5 lab=Vbias}
