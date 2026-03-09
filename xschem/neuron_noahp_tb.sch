v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
P 4 5 -180 -530 540 -530 540 -310 -180 -310 -180 -530 {}
N 310 -480 310 -460 {lab=VDD}
N 390 -480 390 -460 {lab=VDD}
N -20 -400 -20 -380 {lab=I_in}
N 390 -400 390 -380 {lab=I_lk}
N 310 -400 310 -380 {lab=I_thr}
N -130 -430 -130 -410 {lab=#net1}
N 470 -480 470 -460 {lab=VDD}
N 470 -400 470 -380 {lab=Iref}
N -40 -150 -40 -130 {lab=VDD}
N -230 -70 -180 -70 {lab=I_in}
N -530 -350 -530 -310 {lab=GND}
N -630 -290 -440 -290 {lab=I_lk}
N -610 -380 -430 -380 {lab=I_thr}
N -530 -260 -530 -220 {lab=GND}
N -530 -310 -490 -310 {lab=GND}
N -530 -220 -500 -220 {lab=GND}
N -530 -150 -530 -110 {lab=GND}
N -530 -110 -490 -110 {lab=GND}
N -620 -180 -450 -180 {lab=Iref}
N -320 -350 -320 -50 {lab=I_thr}
N -430 -350 -320 -350 {lab=I_thr}
N -440 -260 -340 -260 {lab=I_lk}
N -340 -260 -340 -30 {lab=I_lk}
N -450 -150 -370 -150 {lab=Iref}
N -370 -150 -370 -10 {lab=Iref}
N -430 -380 -430 -350 {lab=I_thr}
N -490 -350 -430 -350 {lab=I_thr}
N -440 -290 -440 -260 {lab=I_lk}
N -490 -260 -440 -260 {lab=I_lk}
N -450 -180 -450 -150 {lab=Iref}
N -490 -150 -450 -150 {lab=Iref}
N -230 -30 -180 -30 {lab=I_lk}
N -370 -10 -180 -10 {lab=Iref}
N 430 -10 460 -10 {lab=#net2}
N 600 -10 630 -10 {lab=ACK}
N 350 -130 520 -130 {lab=VDD}
N 520 -130 520 -50 {lab=VDD}
N 350 -130 350 -50 {lab=VDD}
N 630 -10 630 110 {lab=ACK}
N -220 10 -180 10 {lab=ACK}
N 440 90 440 150 {lab=GND}
N 440 90 520 90 {lab=GND}
N 520 30 520 90 {lab=GND}
N 350 30 350 90 {lab=GND}
N 120 -30 190 -30 {lab=REQ}
N 120 -50 170 -50 {lab=vmem}
N 190 -30 190 -10 {lab=REQ}
N -20 -480 -20 -460 {lab=VDD}
N -40 -130 -40 -100 {lab=VDD}
N -20 -120 -20 -100 {lab=GND}
N 350 90 440 90 {lab=GND}
N -220 10 -220 110 {lab=ACK}
N -40 -130 350 -130 {lab=VDD}
N -220 110 630 110 {lab=ACK}
N 190 -10 290 -10 {lab=REQ}
N -230 -50 -230 -30 {lab=I_lk}
N -340 -30 -230 -30 {lab=I_lk}
N -230 -50 -180 -50 {lab=I_lk}
C {neuron_noahp.sym} -30 0 0 0 {name=Xneuron}
C {simulator_commands_shown.sym} 930 -1070 0 0 {name=example_Simulator1
simulator=ngspice
only_toplevel=false 
value="
.param temp=27
.param Iin_amp=200p

.ic V(vmem)=0 V(xneuron.xref.vref)=0 V(REQ)=0 V(ACK)=0 V(CapAdap)=0

.options gmin=1e-13
.control



* ======================================================
*  Iin sweep - measure firing rate of V(REQ) vs Iin
* ======================================================
*  For each DC value of Iin a transient simulation is run.
*  Rising-edge crossings of V(REQ) through a threshold
*  are counted after a settling window and the firing
*  frequency is computed.  Results go to neuron_iin_sweep.raw
* ======================================================

* --- Sweep parameters (Amps) - edit as needed ---
let iin_start = 0
let iin_stop  = 4000e-12
let iin_step  = 200e-12

* --- Compute number of sweep points ---
let num_pts = (iin_stop - iin_start) / iin_step + 1

* --- Create a new plot to hold the accumulated results ---
setplot new
set resplot = $curplot
let iin_values   = unitvec(num_pts)
let firing_rates = unitvec(num_pts)
let sweep_idx = 0
set t_sim = 50m

* --- Main sweep loop ---
dowhile sweep_idx < num_pts

  * Compute cur_iin fresh each iteration to avoid float drift
  let cur_iin = iin_start + sweep_idx * iin_step

  echo
  echo ============================================
  echo   Sweep point: Iin = $&cur_iin A
  echo ============================================

  * Save cur_iin to a shell variable before tran changes the plot context
  set cur_iin_val = $&cur_iin

  * Set the Iin_amp parameter to the current sweep value.
  alterparam Iin_amp = $cur_iin_val
  reset

  save V(REQ)

  * Run transient analysis with adaptive time
  echo   t_sim = $t_sim
  tran 50n $t_sim

  * --- Measure firing frequency using meas tran ---
  * Skip 1st spike (startup glitch), use 2nd-4th spikes
  let t_rise2 = 0
  let t_rise3 = 0
  let t_rise4 = 0
  meas tran t_rise2 WHEN v(REQ)=0.6 RISE=2
  meas tran t_rise3 WHEN v(REQ)=0.6 RISE=3
  meas tran t_rise4 WHEN v(REQ)=0.6 RISE=4

  * Use best available data for frequency
  if t_rise4 > 0
    * 4+ spikes: use 3rd-4th ISI
    let f_rate = 1.0 / (t_rise4 - t_rise3)
  else
    if t_rise3 > 0
      * 3 spikes: use 2nd-3rd ISI
      let f_rate = 1.0 / (t_rise3 - t_rise2)
    else
      if t_rise2 > 0
        * 2 spikes: estimate rate from time to 2nd spike
        let f_rate = 1.0 / t_rise2
      else
        * No real spikes (only glitch or none)
        let f_rate = 0
      end
    end
  end

  echo   freq = $&f_rate Hz

  * --- Update t_sim for next sweep point ---
  * Need ~5 spikes worth of time, clamp to [1ms, 50ms]
  if f_rate > 0
    let t_next = 5.0 / f_rate
    if t_next < 1e-3
      let t_next = 1e-3
    end
    if t_next > 50e-3
      let t_next = 50e-3
    end
    set t_sim = $&t_next
  end

  * --- Store this point's results in the result plot ---
  set save_freq = $&f_rate
  setplot $resplot
  let iin_values[sweep_idx]   = $cur_iin_val
  let firing_rates[sweep_idx] = $save_freq
  let sweep_idx = sweep_idx + 1

end

* --- Write the result vectors to a .raw file ---
setplot $resplot
write neuron_iin_sweep.raw iin_values firing_rates

echo
echo ============================================
echo   Iin sweep complete!
echo   Results saved to:  neuron_iin_sweep.raw
echo   Vectors:
echo     iin_values   (A)  - input current
echo     firing_rates (Hz) - neuron firing rate
echo ============================================

.endc

"




















}
C {isource.sym} 310 -430 0 0 {name=Ithr value=1p}
C {isource.sym} 390 -430 0 0 {name=Ilk value=4p}
C {simulator_commands_shown.sym} -540 -660 0 0 {name=lib_import
simulator=ngspice
only_toplevel=false 
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt"
}
C {isource.sym} -20 -430 0 0 {name=Iin value="dc 0 ac 0 pulse(0 Iin_amp 0 20n 20n 1 1)"
}
C {lab_pin.sym} -20 -380 0 0 {name=p35 sig_type=std_logic lab=I_in}
C {lab_pin.sym} 390 -380 0 0 {name=p37 sig_type=std_logic lab=I_lk}
C {lab_pin.sym} 310 -380 0 0 {name=p39 sig_type=std_logic lab=I_thr}
C {vsource.sym} -130 -460 0 0 {name=VDD1 value=1.2 savecurrent=false}
C {gnd.sym} -130 -350 0 0 {name=l7 lab=GND}
C {vdd.sym} -130 -490 0 0 {name=l8 lab=VDD}
C {isource.sym} 470 -430 0 0 {name=Iref value=10n}
C {lab_pin.sym} 470 -380 0 0 {name=p1 sig_type=std_logic lab=Iref}
C {vdd.sym} 470 -480 0 0 {name=l16 lab=VDD}
C {vdd.sym} -20 -480 0 0 {name=l18 lab=VDD}
C {vdd.sym} 310 -480 0 0 {name=l19 lab=VDD}
C {vdd.sym} 390 -480 0 0 {name=l20 lab=VDD}
C {ammeter.sym} -130 -380 0 0 {name=Vidd savecurrent=true spice_ignore=0}
C {vdd.sym} -40 -150 0 0 {name=l1 lab=VDD}
C {gnd.sym} 440 150 0 0 {name=l2 lab=GND}
C {lab_pin.sym} -230 -70 0 0 {name=p2 sig_type=std_logic lab=I_in}
C {sg13g2_pr/sg13_hv_nmos.sym} -510 -350 0 1 {name=M26
l=8u
w=1u
ng=2
m=8
model=sg13_hv_nmos
spiceprefix=X
}
C {lab_pin.sym} -610 -380 0 0 {name=p3 sig_type=std_logic lab=I_thr}
C {sg13g2_pr/sg13_hv_nmos.sym} -510 -260 0 1 {name=M27
l=4u
w=4u
ng=2
m=4
model=sg13_hv_nmos
spiceprefix=X
}
C {lab_pin.sym} -630 -290 0 0 {name=p4 sig_type=std_logic lab=I_lk}
C {gnd.sym} -490 -310 3 0 {name=l3 lab=GND}
C {gnd.sym} -500 -220 3 0 {name=l4 lab=GND}
C {sg13g2_pr/sg13_hv_nmos.sym} -510 -150 0 1 {name=M15
l=4u
w=4u
ng=2
m=4
model=sg13_hv_nmos
spiceprefix=X
}
C {gnd.sym} -490 -110 3 0 {name=l5 lab=GND}
C {lab_pin.sym} -620 -180 0 0 {name=p5 sig_type=std_logic lab=Iref}
C {lab_pin.sym} 630 80 2 1 {name=p9 sig_type=std_logic lab=ACK}
C {lab_pin.sym} 190 -10 1 1 {name=p10 sig_type=std_logic lab=REQ}
C {inv.sym} 430 -10 0 0 {name=Xinv3}
C {inv.sym} 600 -10 0 0 {name=Xinv4}
C {capa.sym} -390 -320 0 0 {name=C1
m=1
value=2p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -390 -290 0 0 {name=l12 lab=GND}
C {capa.sym} -400 -230 0 0 {name=C2
m=1
value=2p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -400 -200 0 0 {name=l13 lab=GND}
C {capa.sym} -420 -120 0 0 {name=C3
m=1
value=2p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -420 -90 0 0 {name=l14 lab=GND}
C {lab_pin.sym} 170 -50 2 0 {name=p12 sig_type=std_logic lab=vmem}
C {lab_wire.sym} -20 -110 0 1 {name=p6 sig_type=std_logic lab=GND}
