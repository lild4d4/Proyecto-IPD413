v {xschem version=3.1.0 file_version=1.2 
}
G {}
K {}
V {}
S {}
E {}
N 1060 -470 1060 -450 { lab=out}
N 980 -350 1060 -350 { lab=pos}
N 680 -350 680 -320 {
lab=ref}
N 1060 -450 1150 -450 {
lab=out}
N 1170 -530 1470 -530 {
lab=out}
N 1250 -530 1250 -510 {
lab=out}
N 1470 -530 1470 -510 {
lab=out}
N 600 -470 720 -470 {
lab=#net1}
N 600 -470 600 -320 {
lab=#net1}
N 1060 -370 1060 -330 {
lab=pos}
N 1060 -450 1060 -430 {
lab=out}
N 760 -370 760 -320 {
lab=vin}
N 920 -500 1020 -500 {
lab=op_out}
N 1370 -510 1400 -510 {
lab=GND}
N 1060 -500 1080 -500 {
lab=vin}
N 1080 -540 1080 -500 {
lab=vin}
N 1060 -540 1080 -540 {
lab=vin}
N 830 -610 830 -570 {
lab=vin}
N 1060 -610 1060 -530 {
lab=vin}
C {devices/gnd.sym} 830 -430 0 0 {name=l22 lab=GND}
C {devices/isource.sym} 600 -290 2 0 {name=I1 value=1.5u
}
C {devices/gnd.sym} 600 -260 0 0 {name=l10 lab=GND}
C {devices/gnd.sym} 1060 -270 0 0 {name=l1 lab=GND}
C {devices/opin.sym} 1150 -450 1 0 {name=p3 lab=out
}
C {devices/gnd.sym} 680 -260 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 680 -350 1 0 {name=l4 sig_type=std_logic lab=ref
}
C {devices/lab_pin.sym} 720 -500 0 0 {name=l6 sig_type=std_logic lab=ref
}
C {devices/vsource.sym} 680 -290 0 0 {name=V1 value=1.2}
C {devices/code_shown.sym} 1708.75 -891.875 0 0 {name=snalysis
only_toplevel=true
value="
*TRANSIENT
.control
save all
tran 1ns 24us
plot v(out) v(ref) v(pos) v(vin)
*plot v(op_out)
*plot v(out)
*plot i(v3)
*plot i(v3)*v(vin)
.endc
"}
C {devices/res.sym} 1060 -400 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 1060 -300 0 0 {name=R6
value=2k
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 760 -260 0 0 {name=l9 lab=GND}
C {devices/vsource.sym} 760 -290 0 0 {name=vin value=2}
C {devices/opin.sym} 760 -370 0 0 {name=l5 sig_type=std_logic lab=vin
}
C {devices/lab_pin.sym} 945 -500 1 0 {name=l12 sig_type=std_logic lab=op_out

}
C {gfamp.sym} 810 -500 0 0 {name=X1}
C {symbols/pfet_03v3.sym} 1040 -500 0 0 {name=M0
L=0.7u
W=1000u
nf=11
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {devices/ipin.sym} 720 -530 0 0 {name=p1 lab=pos}
C {devices/opin.sym} 980 -350 2 0 {name=p2 lab=pos}
C {devices/code.sym} 618.75 -771.875 0 0 {name=dependencies
only_toplevel=false
format="tcleval( @value )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/design.ngspice
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice mimcap_statistical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice cap_mim

.include /foss/designs/Xschem/ldo-parameters.spice

.options savecurrents
"}
C {devices/code.sym} 798.75 -771.875 0 0 {name=initial-conditions
only_toplevel=true
value="


.nodeset v(out)=0
.nodeset v(pos)=0
"}
C {devices/ipin.sym} 1170 -530 1 0 {name=p4 lab=out}
C {devices/capa.sym} 1250 -480 0 0 {name=CL
m=1
value=\{loadc\}
footprint=1206
device="ceramic capacitor"}
C {devices/isource.sym} 1470 -480 0 0 {name=IL2 value="PWL(0 0.1m 10u 0.1m 20u 10m 30u 10m)"}
C {devices/res.sym} 1370 -480 0 0 {name=R10
value=\{loadr\}
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 1250 -450 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 1470 -450 0 0 {name=l13 lab=GND}
C {devices/gnd.sym} 1370 -450 0 0 {name=l14 lab=GND}
C {devices/ipin.sym} 830 -610 0 0 {name=l11 sig_type=std_logic lab=vin
}
C {devices/ipin.sym} 1060 -610 0 0 {name=l15 sig_type=std_logic lab=vin
}
C {devices/gnd.sym} 1400 -510 0 0 {name=l7 lab=GND}
C {devices/code_shown.sym} 2288.75 -421.875 0 0 {name=snalysis1
only_toplevel=true
value="
*Stability_Analysis
*.control
*alter IL 0
*alter Vs AC =0
*alter Vt AC=1
*ac dec 10 1 1G
*plot vdb(out)
*plot (180/pi)*vp(out)
*let ph= (180/pi)*vp(out)
*meas ac pm FIND ph WHEN vdb(out)=0
*.endc
"}
C {devices/code_shown.sym} 2258.75 -731.875 0 0 {name="SUPPLY SWEEP"
only_toplevel=true
value="
*.control
*save all
*dc V3 3.3 0 -0.01
*plot v(out) v(ref) v(pos) v(vin)
 *wrdata /foss/designs/LDO_Design/data/data_SuplySweep_Vout.dat v(out)
 *wrdata /foss/designs/LDO_Design/data/data_SuplySweep_Vref.dat v(ref)
 *wrdata /foss/designs/LDO_Design/data/data_SuplySweep_Vin.dat v(vin)
*plot v(op_out)
*.endc
"}
C {devices/code_shown.sym} 1718.75 -291.875 0 0 {name=snalysis3
only_toplevel=true
value="
**Load_Transient
*.control
*alter IL 50u
*alter R10 3600k
*tran 0.1u 100u
*meas TRAN V_ldo_100u FIND v(out) AT=5u
*meas TRAN V_ldo_10m FIND v(out) AT=100u
*let load_reg= V_ldo_100u-V_ldo_10m
*let load_current =(-1*i(V3)-131.8e-6)
*print load_reg
*plot load_current v(out)-1.8
*.endc
"}
C {devices/code_shown.sym} 1718.75 -601.875 0 0 {name=snalysis4
only_toplevel=true
value="
*PSRR_Analysis
*.control
*save all
*alter V3 AC =1
*ac dec 100 1 1G
*plot vdb(out)
*let gm0=@m.xm0.m0[gm]
*let Zout=(1.5)/(gm0*v(op_out))
*let Zout2=v(out)/gm0
*plot vdb(Zout2)
*wrdata /foss/designs/LDO_Design/data/data_PSRR.dat vdb(out)
*.endc
"}
