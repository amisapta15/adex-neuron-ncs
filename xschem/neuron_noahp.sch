v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 400 -230 400 -170 {lab=VDD}
N 400 -90 400 -20 {lab=GND}
N 480 -130 550 -130 {lab=#net1}
N 610 -230 610 -170 {lab=VDD}
N 610 -90 610 -20 {lab=GND}
N 290 -130 340 -130 {lab=Vfb}
N -40 -130 -10 -130 {lab=Vmem}
N 400 -20 610 -20 {lab=GND}
N 690 -130 720 -130 {lab=REQ}
N 550 260 720 260 {lab=REQ}
N 190 280 250 280 {lab=V_ref}
N 290 -230 400 -230 {lab=VDD}
N 520 -230 610 -230 {lab=VDD}
N 400 100 400 200 {lab=VDD}
N 400 100 520 100 {lab=VDD}
N 520 -230 520 100 {lab=VDD}
N 400 -230 520 -230 {lab=VDD}
N 720 80 720 260 {lab=REQ}
N 100 -20 100 380 {lab=GND}
N 100 380 400 380 {lab=GND}
N 70 380 100 380 {lab=GND}
N -40 250 250 250 {lab=Vmem}
N -40 60 -40 250 {lab=Vmem}
N 290 -300 290 -230 {lab=VDD}
N 70 380 70 460 {lab=GND}
N 550 230 580 230 {lab=ACK}
N 720 80 750 80 {lab=REQ}
N 720 -130 720 80 {lab=REQ}
N -550 -150 -510 -150 {lab=I_in}
N -100 -130 -100 -110 {lab=Vmem}
N -100 -130 -40 -130 {lab=Vmem}
N -100 -50 -100 380 {lab=GND}
N -100 380 70 380 {lab=GND}
N -210 -130 -100 -130 {lab=Vmem}
N 140 -230 290 -230 {lab=VDD}
N -360 -230 -360 -180 {lab=VDD}
N -360 -80 -360 -20 {lab=GND}
N -360 -20 100 -20 {lab=GND}
N -550 -110 -510 -110 {lab=V_lk}
N 100 -20 140 -20 {lab=GND}
N 400 320 400 380 {lab=GND}
N -40 60 -20 60 {lab=Vmem}
N -40 -130 -40 60 {lab=Vmem}
N 140 -230 140 -190 {lab=VDD}
N -360 -230 140 -230 {lab=VDD}
N 140 -70 140 -20 {lab=GND}
N 170 -70 170 -40 {lab=nwell}
N 140 -20 400 -20 {lab=GND}
N 200 -70 200 -40 {lab=psub}
N 580 290 580 310 {lab=Vrefcap}
N 550 290 580 290 {lab=Vrefcap}
N 580 370 580 380 {lab=GND}
N 400 380 580 380 {lab=GND}
N 580 290 620 290 {lab=Vrefcap}
C {inv.sym} 480 -130 0 0 {name=Xinv1}
C {inv.sym} 690 -130 0 0 {name=Xinv2}
C {DPI.sym} -360 -130 0 0 {name=Xdpi1}
C {FB_system.sym} 140 -130 0 0 {name=Xfb}
C {REF_system.sym} 400 260 0 0 {name=Xref}
C {ipin.sym} 190 280 0 0 {name=p1 lab=V_ref}
C {iopin.sym} 70 460 0 0 {name=p2 lab=GND}
C {iopin.sym} 290 -300 0 0 {name=p3 lab=VDD}
C {opin.sym} 750 80 0 0 {name=p4 lab=REQ}
C {ipin.sym} 580 230 0 1 {name=p5 lab=ACK}
C {ipin.sym} -550 -150 0 0 {name=p6 lab=I_in
}
C {ipin.sym} -550 -110 0 0 {name=p8 lab=V_lk
}
C {capa.sym} -100 -80 0 0 {name=Cmem
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {opin.sym} -20 60 0 0 {name=p13 lab=Vmem}
C {lab_wire.sym} 320 -130 0 0 {name=p14 sig_type=std_logic lab=Vfb}
C {lab_wire.sym} 170 -40 0 0 {name=p9 sig_type=std_logic lab=nwell}
C {lab_wire.sym} 200 -40 0 0 {name=p10 sig_type=std_logic lab=psub}
C {capa.sym} 580 340 0 0 {name=Cref
m=1
value=0.5p
footprint=1206
device="ceramic capacitor"}
C {opin.sym} 620 290 0 0 {name=p7 lab=Vrefcap}
