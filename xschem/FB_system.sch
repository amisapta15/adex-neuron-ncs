v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -1470 -1430 -1470 -1400 {lab=out}
N -1550 -1370 -1510 -1370 {lab=V_mem}
N -1470 -1500 -1470 -1430 {lab=out}
N -1550 -1530 -1510 -1530 {lab=V_mem}
N -1550 -1530 -1550 -1370 {lab=V_mem}
N -1510 -1760 -1510 -1700 {lab=Vmir}
N -1510 -1700 -1470 -1700 {lab=Vmir}
N -1470 -1730 -1470 -1700 {lab=Vmir}
N -1650 -1760 -1510 -1760 {lab=Vmir}
N -1650 -1670 -1360 -1670 {lab=out}
N -1470 -1430 -1360 -1430 {lab=out}
N -1360 -1670 -1360 -1430 {lab=out}
N -1470 -1840 -1470 -1760 {lab=VDD}
N -1690 -1840 -1690 -1760 {lab=VDD}
N -1360 -1430 -1300 -1430 {lab=out}
N -1560 -1890 -1560 -1840 {lab=VDD}
N -1560 -1840 -1470 -1840 {lab=VDD}
N -1690 -1840 -1560 -1840 {lab=VDD}
N -1690 -1730 -1690 -1700 {lab=#net1}
N -1730 -1670 -1690 -1670 {lab=VDD}
N -1470 -1700 -1470 -1560 {lab=Vmir}
N -1470 -1370 -1440 -1370 {lab=GND}
N -1470 -1340 -1470 -1240 {lab=GND}
N -1470 -1530 -1440 -1530 {lab=VDD}
N -1690 -1370 -1550 -1370 {lab=V_mem}
N -1690 -1640 -1690 -1370 {lab=V_mem}
N -1770 -1370 -1690 -1370 {lab=V_mem}
C {sg13g2_pr/sg13_hv_pmos.sym} -1490 -1760 0 0 {name=M3
l=2u
w=1u
ng=2
m=4
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -1670 -1670 0 1 {name=M20
l=0.5u
w=1u
ng=2
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -1670 -1760 0 1 {name=M2
l=8u
w=1u
ng=2
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -1490 -1530 0 0 {name=M23
l=2u
w=1u
ng=2
m=4
model=sg13_hv_pmos
spiceprefix=X
}
C {opin.sym} -1300 -1430 0 0 {name=p1 lab=out}
C {iopin.sym} -1770 -1370 0 1 {name=p2 lab=V_mem
}
C {iopin.sym} -1560 -1890 0 0 {name=p3 lab=VDD}
C {iopin.sym} -1470 -1240 0 0 {name=p5 lab=GND}
C {sg13g2_pr/sg13_hv_nmos.sym} -1490 -1370 0 0 {name=M4
l=8u
w=1u
ng=2
m=2
model=sg13_hv_nmos
spiceprefix=X
}
C {lab_wire.sym} -1450 -1370 0 1 {name=p4 sig_type=std_logic lab=GND}
C {lab_wire.sym} -1580 -1760 0 0 {name=p6 sig_type=std_logic lab=Vmir}
C {lab_wire.sym} -1450 -1530 0 1 {name=p7 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -1720 -1670 0 0 {name=p8 sig_type=std_logic lab=VDD}
