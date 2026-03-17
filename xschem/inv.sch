v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 150 -210 150 -120 {lab=in}
N 190 -210 190 -150 {lab=out}
N 190 -210 260 -210 {lab=out}
N 190 -260 190 -210 {lab=out}
N 100 -210 150 -210 {lab=in}
N 150 -290 150 -210 {lab=in}
N 190 -370 190 -320 {lab=VDD}
N 190 -90 190 -40 {lab=GND}
N 190 -120 250 -120 {lab=psub}
N 190 -290 250 -290 {lab=nwell}
N 400 -350 400 -330 {lab=VDD}
N 400 -170 400 -150 {lab=GND}
N 400 -90 400 -60 {lab=psub}
N 400 -270 400 -240 {lab=nwell}
C {sg13g2_pr/sg13_hv_pmos.sym} 170 -290 0 0 {name=M1
l=0.5u
w=4u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 170 -120 0 0 {name=M2
l=0.5u
w=4u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {ipin.sym} 100 -210 0 0 {name=p2 lab=in}
C {iopin.sym} 190 -370 0 0 {name=p1 lab=VDD}
C {iopin.sym} 190 -40 0 0 {name=p3 lab=GND}
C {opin.sym} 260 -210 0 0 {name=p4 lab=out}
C {sg13g2_pr/ptap1.sym} 400 -120 0 0 {name=R1
model=ptap1
spiceprefix=X
w=2.75e-6
l=1e-6}
C {sg13g2_pr/ntap1.sym} 400 -300 0 0 {name=R2
model=ntap1
spiceprefix=X
w=2.75e-6
l=1e-6}
C {lab_wire.sym} 250 -290 0 1 {name=p5 sig_type=std_logic lab=nwell}
C {lab_wire.sym} 250 -120 0 1 {name=p6 sig_type=std_logic lab=psub}
C {lab_wire.sym} 400 -170 0 1 {name=p7 sig_type=std_logic lab=GND}
C {lab_wire.sym} 400 -350 0 1 {name=p8 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 400 -240 0 1 {name=p9 sig_type=std_logic lab=nwell}
C {lab_wire.sym} 400 -60 0 1 {name=p10 sig_type=std_logic lab=psub}
