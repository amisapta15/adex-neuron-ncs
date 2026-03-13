v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 350 -310 350 -290 {lab=I_in}
N 540 -310 540 -290 {lab=I_in}
N 450 -310 540 -310 {lab=I_in}
N 580 -260 580 -230 {lab=V_mem}
N 540 -230 580 -230 {lab=V_mem}
N 350 -310 450 -310 {lab=I_in}
N 450 -360 450 -310 {lab=I_in}
N 540 -130 540 -70 {lab=GND}
N 445 -70 540 -70 {lab=GND}
N 350 -230 350 -70 {lab=GND}
N 580 -130 620 -130 {lab=V_lk}
N 460 -260 540 -260 {lab=VDD}
N 580 -260 690 -260 {lab=V_mem}
N 270 -260 310 -260 {lab=V_lk}
N 460 -280 460 -260 {lab=VDD}
N 350 -260 460 -260 {lab=VDD}
N 445 -70 445 -45 {lab=GND}
N 350 -70 445 -70 {lab=GND}
N 540 -230 540 -160 {lab=V_mem}
C {sg13g2_pr/sg13_hv_pmos.sym} 330 -260 0 0 {name=Mdifl
l=2u
w=2u
ng=2
m=8
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 560 -260 0 1 {name=Mdifr
l=2u
w=2u
ng=2
m=8
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 560 -130 0 1 {name=Mtau
l=4u
w=4u
ng=2
m=4
model=sg13_hv_nmos
spiceprefix=X
}
C {opin.sym} 690 -260 0 0 {name=p1 lab=V_mem}
C {ipin.sym} 620 -130 0 1 {name=p2 lab=V_lk}
C {ipin.sym} 450 -360 0 1 {name=p4 lab=I_in}
C {iopin.sym} 460 -280 0 1 {name=p5 lab=VDD}
C {iopin.sym} 445 -45 0 0 {name=p6 lab=GND}
C {lab_wire.sym} 280 -260 0 0 {name=p3 sig_type=std_logic lab=V_lk}
