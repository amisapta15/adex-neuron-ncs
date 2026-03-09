v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -440 -260 -440 -210 {lab=#net1}
N -240 -260 -240 -210 {lab=#net1}
N -340 -260 -240 -260 {lab=#net1}
N -340 90 -280 90 {lab=#net2}
N -340 40 -340 90 {lab=#net2}
N -400 90 -340 90 {lab=#net2}
N -440 40 -340 40 {lab=#net2}
N -460 90 -440 90 {lab=0}
N -440 120 -440 180 {lab=GND}
N -240 90 -220 90 {lab=0}
N -240 120 -240 180 {lab=GND}
N -240 -40 -240 -30 {lab=#net3}
N -240 -40 -150 -40 {lab=#net3}
N -90 -40 0 -40 {lab=out}
N -340 -280 -340 -260 {lab=#net1}
N -440 -260 -340 -260 {lab=#net1}
N -440 -150 -440 -140 {lab=#net4}
N -440 40 -440 60 {lab=#net2}
N -440 -80 -440 40 {lab=#net2}
N -240 30 -240 60 {lab=#net5}
N -240 -150 -240 -130 {lab=#net6}
N -240 -70 -240 -40 {lab=#net3}
N -340 -420 -300 -420 {lab=VDD}
N -300 -490 -300 -420 {lab=VDD}
N -490 -420 -380 -420 {lab=Vbias}
N -340 -390 -340 -340 {lab=#net7}
N -440 -180 -410 -180 {lab=VDD}
N -200 -180 -180 -180 {lab=inn_cm}
N -500 -180 -480 -180 {lab=inp_cm}
N -270 -180 -240 -180 {lab=VDD}
N -340 -550 -340 -450 {lab=VDD}
N -440 180 -340 180 {lab=GND}
N -340 180 -340 240 {lab=GND}
N -340 180 -240 180 {lab=GND}
C {ammeter.sym} -120 -40 3 0 {name=VIout savecurrent=true spice_ignore=0}
C {sg13g2_pr/sg13_hv_pmos.sym} -460 -180 0 0 {name=M2
l=1u
w=4u
ng=1
m=4
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -420 90 0 1 {name=M5
l=1u
w=4u
ng=1
m=4
model=sg13_hv_nmos
spiceprefix=X
}
C {ipin.sym} -180 -180 2 0 {name=inn_cm lab=inn_cm}
C {ammeter.sym} -340 -310 0 1 {name=Vbias1 savecurrent=true spice_ignore=0}
C {ammeter.sym} -240 -100 0 1 {name=Vbranch1 savecurrent=true spice_ignore=0}
C {ammeter.sym} -440 -110 0 1 {name=Vbranch2 savecurrent=true spice_ignore=0}
C {ammeter.sym} -240 0 0 1 {name=Vbranch3 savecurrent=true spice_ignore=0}
C {gnd.sym} -460 90 0 0 {name=l5 lab=0}
C {gnd.sym} -220 90 0 0 {name=l12 lab=0}
C {sg13g2_pr/sg13_hv_pmos.sym} -360 -420 0 0 {name=M13
l=1u
w=4u
ng=1
m=4
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_wire.sym} -300 -450 1 0 {name=p4 sig_type=std_logic lab=VDD}
C {ipin.sym} -500 -180 0 0 {name=inp_cm1
lab=inp_cm}
C {lab_wire.sym} -260 -180 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -430 -180 2 0 {name=p3 sig_type=std_logic lab=VDD}
C {sg13g2_pr/sg13_hv_nmos.sym} -260 90 0 0 {name=M1
l=1u
w=4u
ng=1
m=4
model=sg13_hv_nmos
spiceprefix=X
}
C {lab_wire.sym} -20 -40 0 0 {name=p6 sig_type=std_logic lab=out}
C {opin.sym} 0 -40 0 0 {name=p8 lab=out}
C {lab_wire.sym} -430 -420 0 0 {name=p11 sig_type=std_logic lab=Vbias}
C {sg13g2_pr/sg13_hv_pmos.sym} -220 -180 0 1 {name=M3
l=1u
w=4u
ng=1
m=4
model=sg13_hv_pmos
spiceprefix=X
}
C {ipin.sym} -490 -420 0 0 {name=p5 lab=Vbias}
C {iopin.sym} -340 -550 3 0 {name=p10 lab=VDD}
C {iopin.sym} -340 240 1 0 {name=p7 lab=GND}
