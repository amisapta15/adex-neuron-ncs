v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -90 -320 -90 -270 {lab=Vhead}
N 110 -320 110 -270 {lab=Vhead}
N 10 -320 110 -320 {lab=Vhead}
N 10 30 70 30 {lab=#net1}
N 10 -20 10 30 {lab=#net1}
N -50 30 10 30 {lab=#net1}
N -90 -20 10 -20 {lab=#net1}
N -110 30 -90 30 {lab=GND}
N -90 60 -90 120 {lab=GND}
N 110 30 130 30 {lab=GND}
N 110 60 110 120 {lab=GND}
N 110 -100 110 -90 {lab=#net2}
N 110 -100 200 -100 {lab=#net2}
N 260 -100 350 -100 {lab=out}
N 10 -340 10 -320 {lab=Vhead}
N -90 -320 10 -320 {lab=Vhead}
N -90 -210 -90 -200 {lab=#net3}
N -90 -20 -90 0 {lab=#net1}
N -90 -140 -90 -20 {lab=#net1}
N 110 -30 110 0 {lab=#net4}
N 110 -210 110 -190 {lab=#net5}
N 110 -130 110 -100 {lab=#net2}
N 10 -480 50 -480 {lab=VDD}
N 50 -550 50 -480 {lab=VDD}
N -140 -480 -30 -480 {lab=Vbias}
N 10 -450 10 -400 {lab=#net6}
N -90 -240 -60 -240 {lab=VDD}
N 150 -240 170 -240 {lab=inn_cm}
N -150 -240 -130 -240 {lab=inp_cm}
N 80 -240 110 -240 {lab=VDD}
N 10 -610 10 -510 {lab=VDD}
N -90 120 10 120 {lab=GND}
N 10 120 10 180 {lab=GND}
N 10 120 110 120 {lab=GND}
N 550 -300 590 -300 {lab=VDD}
N 590 -370 590 -300 {lab=VDD}
N 410 -300 510 -300 {lab=Vbias}
N 550 -160 550 -50 {lab=out}
N 550 -270 550 -220 {lab=#net7}
N 550 -420 550 -330 {lab=VDD}
C {ammeter.sym} 230 -100 3 0 {name=VIout savecurrent=true spice_ignore=0}
C {sg13g2_pr/sg13_hv_pmos.sym} -110 -240 0 0 {name=M2
l=1u
w=4u
ng=1
m=4
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -70 30 0 1 {name=M5
l=1u
w=4u
ng=1
m=4
model=sg13_hv_nmos
spiceprefix=X
}
C {ipin.sym} 170 -240 2 0 {name=inn_cm lab=inn_cm}
C {ammeter.sym} 10 -370 0 1 {name=Vbias1 savecurrent=true spice_ignore=0}
C {ammeter.sym} 110 -160 0 1 {name=Vbranch1 savecurrent=true spice_ignore=0}
C {ammeter.sym} -90 -170 0 1 {name=Vbranch2 savecurrent=true spice_ignore=0}
C {ammeter.sym} 110 -60 0 1 {name=Vbranch3 savecurrent=true spice_ignore=0}
C {sg13g2_pr/sg13_hv_pmos.sym} -10 -480 0 0 {name=M13
l=1u
w=4u
ng=1
m=4
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_wire.sym} 50 -510 1 0 {name=p4 sig_type=std_logic lab=VDD}
C {ipin.sym} -150 -240 0 0 {name=inp_cm1
lab=inp_cm}
C {lab_wire.sym} 90 -240 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -80 -240 2 0 {name=p3 sig_type=std_logic lab=VDD}
C {sg13g2_pr/sg13_hv_nmos.sym} 90 30 0 0 {name=M1
l=1u
w=4u
ng=1
m=4
model=sg13_hv_nmos
spiceprefix=X
}
C {lab_wire.sym} 330 -100 0 0 {name=p6 sig_type=std_logic lab=out}
C {opin.sym} 350 -100 0 0 {name=p8 lab=out}
C {lab_wire.sym} -80 -480 0 0 {name=p11 sig_type=std_logic lab=Vbias}
C {sg13g2_pr/sg13_hv_pmos.sym} 130 -240 0 1 {name=M3
l=1u
w=4u
ng=1
m=4
model=sg13_hv_pmos
spiceprefix=X
}
C {ipin.sym} -140 -480 0 0 {name=p5 lab=Vbias}
C {iopin.sym} 10 -610 3 0 {name=p10 lab=VDD}
C {iopin.sym} 10 180 1 0 {name=p7 lab=GND}
C {lab_wire.sym} 590 -330 1 0 {name=p9 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 470 -300 0 0 {name=p1 sig_type=std_logic lab=Vbias}
C {ammeter.sym} 550 -190 0 1 {name=Vbias3 savecurrent=true spice_ignore=0}
C {lab_wire.sym} 550 -100 0 0 {name=p12 sig_type=std_logic lab=out}
C {sg13g2_pr/sg13_hv_pmos.sym} 530 -300 0 0 {name=M4
l=1u
w=4u
ng=1
m=3
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_wire.sym} 550 -380 1 0 {name=p13 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -110 30 0 0 {name=p14 sig_type=std_logic lab=GND}
C {lab_wire.sym} 130 30 0 1 {name=p15 sig_type=std_logic lab=GND}
C {lab_wire.sym} -40 -320 0 0 {name=p16 sig_type=std_logic lab=Vhead}
