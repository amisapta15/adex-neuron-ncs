v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
L 4 -810 -560 -650 -560 {}
L 4 -810 -420 -650 -420 {}
L 4 -470 -560 -290 -560 {}
L 4 -650 -560 -650 -300 {}
L 4 -470 -460 -290 -460 {}
L 4 -650 -560 -650 -360 {}
L 4 -650 -560 -470 -560 {}
L 4 -470 -560 -470 -300 {}
L 4 -650 -300 -470 -300 {}
L 4 -290 -560 -290 -460 {}
L 4 -810 -560 -810 -420 {}
L 4 -810 -210 -310 -210 {}
L 4 -310 -210 -310 190 {}
L 4 -810 190 -310 190 {}
L 4 -810 -210 -810 190 {}
T {Power} -760 -550 0 0 0.4 0.4 {}
T {Analog} -420 -550 0 0 0.4 0.4 {}
T {Digital} -600 -550 0 0 0.4 0.4 {}
T {Bidirectional pins configurations:
uio[4:0] input
uio[7:5] output} -680 -200 0 0 0.3 0.3 {}
N 160 -380 160 -340 {lab=VGND}
N 180 -380 180 -340 {lab=VDPWR}
N 200 -380 200 -340 {lab=VGND}
N -30 -280 20 -280 {lab=ua[5]}
N 140 -180 140 -110 {lab=ua[3]}
N 160 -180 160 -110 {lab=ua[4]}
N 180 -180 180 -110 {lab=ua[2]}
N 200 -180 200 -110 {lab=ua[1]}
N -30 -260 20 -260 {lab=uio_in[4:2],ui_in[7:0]}
N 320 -260 390 -260 {lab=NN_mem_VNT[10:0]}
N 320 -240 390 -240 {lab=NN_refcap_VT[10:0]}
N 320 -280 390 -280 {lab=uio_out[7:5],uo_out[7:0]}
N 140 -380 140 -340 {lab=VDPWR}
N 440 -10 440 20 {lab=VDPWR}
N 420 -10 420 20 {lab=ua[4]}
N 440 160 440 190 {lab=VGND}
N 240 90 330 90 {lab=mux2buf_V}
N 550 90 610 90 {lab=ua[0]}
N -110 60 -60 60 {lab=NN_mem_VNT[5]}
N -110 80 -60 80 {lab=NN_refcap_VT[5]}
N 90 -10 90 30 {lab=VDPWR}
N 90 150 90 180 {lab=VGND}
N -30 150 -30 180 {lab=uio_in[0]}
N -10 150 -10 180 {lab=uio_in[1]}
N -660 -30 -600 -30 {lab=uio_oe[7:5]}
N -730 -120 -730 -80 {lab=VGND}
N -750 -120 -750 -80 {lab=VDPWR}
N -490 -120 -490 -80 {lab=VGND}
N -510 -120 -510 -80 {lab=VDPWR}
N -420 -30 -360 -30 {lab=uio_oe[4:0]}
N -490 30 -490 70 {lab=VGND}
N -510 30 -510 70 {lab=VDPWR}
N -420 120 -360 120 {lab=uio_out[4:0]}
N -750 120 -700 120 {lab=uio_in[7:5]}
N 800 -260 840 -260 {lab=NN_mem_VNT[10:6],NN_mem_VNT[4:0]}
N 800 -240 840 -240 {lab=NN_refcap_VT[10:6],NN_refcap_VT[4:0]}
C {neuron_row.sym} 170 -270 0 0 {name=xrow[10:0]}
C {lab_wire.sym} 160 -340 3 1 {name=p23 sig_type=std_logic lab=VGND}
C {lab_wire.sym} 20 -280 0 0 {name=p24 sig_type=std_logic lab=ua[5]}
C {lab_wire.sym} 140 -180 3 0 {name=p25 sig_type=std_logic lab=ua[3]}
C {lab_wire.sym} 160 -180 3 0 {name=p26 sig_type=std_logic lab=ua[4]}
C {lab_wire.sym} 180 -180 3 0 {name=p27 sig_type=std_logic lab=ua[2]}
C {lab_wire.sym} 200 -180 3 0 {name=p28 sig_type=std_logic lab=ua[1]}
C {lab_wire.sym} 20 -260 0 0 {name=p29 sig_type=std_logic lab=uio_in[4:2],ui_in[7:0]}
C {lab_wire.sym} 320 -280 0 1 {name=p30 sig_type=std_logic lab=uio_out[7:5],uo_out[7:0]}
C {lab_wire.sym} 320 -260 0 1 {name=p31 sig_type=std_logic lab=NN_mem_VNT[10:0]}
C {lab_wire.sym} 320 -240 0 1 {name=p32 sig_type=std_logic lab=NN_refcap_VT[10:0]}
C {lab_wire.sym} 140 -340 3 1 {name=p1 sig_type=std_logic lab=VDPWR}
C {lab_wire.sym} 200 -340 3 1 {name=p2 sig_type=std_logic lab=VGND}
C {lab_wire.sym} 180 -340 3 1 {name=p3 sig_type=std_logic lab=VDPWR}
C {buffer_final.sym} 420 350 0 0 {name=xabuf}
C {lab_wire.sym} 550 90 0 1 {name=p19 sig_type=std_logic lab=ua[0]}
C {mux21.sym} 90 90 0 0 {name=xmux}
C {lab_wire.sym} -60 60 0 0 {name=p4 sig_type=std_logic lab=NN_mem_VNT[5]}
C {lab_wire.sym} -60 80 0 0 {name=p5 sig_type=std_logic lab=NN_refcap_VT[5]}
C {lab_wire.sym} 90 30 3 1 {name=p6 sig_type=std_logic lab=VDPWR}
C {iopin.sym} -690 -500 2 0 {name=p8 lab=VDPWR}
C {iopin.sym} -690 -470 2 0 {name=p13 lab=VGND}
C {lab_wire.sym} 330 90 0 0 {name=p10 sig_type=std_logic lab=mux2buf_V}
C {lab_wire.sym} 420 20 3 1 {name=p14 sig_type=std_logic lab=ua[4]}
C {lab_wire.sym} 440 20 3 1 {name=p15 sig_type=std_logic lab=VDPWR}
C {lab_wire.sym} 440 160 3 0 {name=p16 sig_type=std_logic lab=VGND}
C {lab_wire.sym} 90 150 3 0 {name=p17 sig_type=std_logic lab=VGND}
C {lab_wire.sym} -30 150 3 0 {name=p18 sig_type=std_logic lab=uio_in[0]}
C {lab_wire.sym} -10 150 3 0 {name=p20 sig_type=std_logic lab=uio_in[1]}
C {ipin.sym} -520 -500 0 0 {name=p9 lab=ui_in[7:0]}
C {opin.sym} -620 -470 0 0 {name=p11 lab=uo_out[7:0]}
C {ipin.sym} -520 -440 0 0 {name=p12 lab=uio_in[7:0]}
C {opin.sym} -620 -410 0 0 {name=p21 lab=uio_out[7:0]}
C {opin.sym} -620 -380 0 0 {name=p22 lab=uio_oe[7:0]}
C {iopin.sym} -340 -500 2 0 {name=p33 lab=ua[5:0]}
C {lab_wire.sym} -660 -30 0 1 {name=p7 sig_type=std_logic lab=uio_oe[7:5]}
C {sg13g2_tiehi.sym} -810 -30 0 0 {name=xoehi[2:0]}
C {lab_wire.sym} -730 -80 3 1 {name=p35 sig_type=std_logic lab=VGND}
C {lab_wire.sym} -750 -80 3 1 {name=p36 sig_type=std_logic lab=VDPWR}
C {sg13g2_tielo.sym} -570 -30 0 0 {name=xoelo[4:0]}
C {lab_wire.sym} -490 -80 3 1 {name=p37 sig_type=std_logic lab=VGND}
C {lab_wire.sym} -510 -80 3 1 {name=p38 sig_type=std_logic lab=VDPWR}
C {lab_wire.sym} -420 -30 0 1 {name=p39 sig_type=std_logic lab=uio_oe[4:0]}
C {sg13g2_tielo.sym} -570 120 0 0 {name=xoelo1[4:0]}
C {lab_wire.sym} -490 70 3 1 {name=p34 sig_type=std_logic lab=VGND}
C {lab_wire.sym} -510 70 3 1 {name=p40 sig_type=std_logic lab=VDPWR}
C {lab_wire.sym} -420 120 0 1 {name=p41 sig_type=std_logic lab=uio_out[4:0]}
C {noconn.sym} -750 120 0 0 {name=lnoconn1[2:0]}
C {lab_wire.sym} -740 120 0 1 {name=p42 sig_type=std_logic lab=uio_in[7:5]}
C {noconn.sym} 840 -260 0 1 {name=lnoconn2[9:0]}
C {lab_wire.sym} 830 -260 0 0 {name=p43 sig_type=std_logic lab=NN_mem_VNT[10:6],NN_mem_VNT[4:0]}
C {noconn.sym} 840 -240 0 1 {name=lnoconn3[9:0]}
C {lab_wire.sym} 830 -240 0 0 {name=p44 sig_type=std_logic lab=NN_refcap_VT[10:6],NN_refcap_VT[4:0]}
