v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -20 0 -20 90 {lab=in}
N 20 0 20 60 {lab=out}
N 20 0 90 0 {lab=out}
N 20 -50 20 0 {lab=out}
N -70 0 -20 0 {lab=in}
N -20 -80 -20 0 {lab=in}
N -160 -190 -130 -190 {lab=VDD}
N -160 -150 -130 -150 {lab=VSS}
N 210 60 250 60 {lab=VSS}
N 210 60 210 120 {lab=VSS}
N 210 120 250 120 {lab=VSS}
N 250 120 250 160 {lab=VSS}
N 200 -60 240 -60 {lab=VDD}
N 200 -120 200 -60 {lab=VDD}
N 200 -120 240 -120 {lab=VDD}
N 240 -160 240 -120 {lab=VDD}
N 20 120 20 170 {lab=VSS}
N 20 -160 20 -110 {lab=VDD}
N 20 -80 90 -80 {lab=nwell}
N 20 90 90 90 {lab=pwell}
N -270 -110 -270 -80 {lab=VDD}
N -270 -20 -270 -0 {lab=nwell}
N -270 30 -270 50 {lab=VSS}
N -270 110 -270 140 {lab=pwell}
N 240 -90 290 -90 {lab=nwell}
N 250 90 300 90 {lab=pwell}
C {ipin.sym} -70 0 0 0 {name=p2 lab=in}
C {opin.sym} 90 0 0 0 {name=p4 lab=out}
C {sg13g2_pr/sg13_lv_pmos.sym} 0 -80 0 0 {name=M3
l=0.15u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 0 90 0 0 {name=M4
l=0.15u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 220 -90 0 0 {name=dumm1
l=0.15u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 230 90 0 0 {name=dumm2
l=0.15u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {iopin.sym} -160 -190 2 0 {name=p5 lab=VDD}
C {iopin.sym} -160 -150 2 0 {name=p6 lab=VSS}
C {lab_pin.sym} -130 -190 2 0 {name=p7 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -130 -150 2 0 {name=p8 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 20 -160 2 0 {name=p1 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 20 170 2 0 {name=p3 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 240 -160 2 0 {name=p9 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 250 160 2 0 {name=p10 sig_type=std_logic lab=VSS}
C {sg13g2_pr/ntap1.sym} -270 -50 0 0 {name=R1
model=ntap1
spiceprefix=X
w=8.09e-6
l=5.11e-6
}
C {sg13g2_pr/ptap1.sym} -270 80 0 0 {name=R2
model=ptap1
spiceprefix=X
w=7.41e-6
l=5.15e-6
}
C {lab_pin.sym} 90 -80 2 0 {name=p11 sig_type=std_logic lab=nwell}
C {lab_pin.sym} 90 90 2 0 {name=p12 sig_type=std_logic lab=pwell}
C {lab_pin.sym} -270 0 2 0 {name=p13 sig_type=std_logic lab=nwell}
C {lab_pin.sym} -270 -110 2 0 {name=p14 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -270 140 2 0 {name=p15 sig_type=std_logic lab=pwell}
C {lab_pin.sym} -270 30 2 0 {name=p16 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 290 -90 2 0 {name=p17 sig_type=std_logic lab=nwell}
C {lab_pin.sym} 300 90 2 0 {name=p18 sig_type=std_logic lab=pwell}
