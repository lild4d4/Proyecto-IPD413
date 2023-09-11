v {xschem version=3.1.0 file_version=1.2 
}
G {}
K {}
V {}
S {}
E {}
N 820 -490 820 -470 { lab=GND}
N 440 -530 710 -530 {
lab=#net1}
N 410 -370 410 -350 {
lab=GND}
N 410 -530 410 -430 {
lab=#net1}
N 410 -530 440 -530 {
lab=#net1}
N 820 -680 820 -630 {
lab=vin}
N 910 -560 1000 -560 {
lab=op_out}
N 1140 -530 1140 -510 { lab=out}
N 1140 -360 1140 -340 { lab=pos}
N 1140 -560 1240 -560 { lab=vin}
N 1060 -350 1140 -350 { lab=pos}
N 1140 -380 1140 -370 { lab=pos}
N 1140 -370 1140 -360 { lab=pos}
N 1140 -160 1140 -120 { lab=GND}
N 1140 -120 1140 -110 { lab=GND}
N 1000 -560 1100 -560 { lab=op_out}
N 1140 -660 1140 -590 {
lab=vin}
N 1240 -660 1240 -560 {
lab=vin}
N 1140 -660 1240 -660 {
lab=vin}
N 550 -350 550 -330 {
lab=GND}
N 550 -440 550 -410 {
lab=ref}
N 1140 -510 1140 -480 {
lab=out}
N 1140 -420 1140 -380 {
lab=pos}
N 1140 -340 1140 -310 {
lab=pos}
N 640 -350 640 -330 {
lab=GND}
N 640 -440 640 -410 {
lab=V3V3}
N 1380 -550 1380 -530 {
lab=GND}
N 1380 -640 1380 -610 {
lab=vin}
N 1380 -740 1380 -640 {
lab=vin}
N 1140 -740 1380 -740 {
lab=vin}
N 1140 -740 1140 -660 {
lab=vin}
N 820 -740 820 -680 {
lab=vin}
N 820 -740 1135 -740 {
lab=vin}
N 1135 -740 1140 -740 {
lab=vin}
N 1140 -520 1230 -520 {
lab=out}
N 1140 -250 1140 -220 {
lab=#net2}
N 1100 -190 1120 -190 {
lab=V3V3}
N 1100 -280 1120 -280 {
lab=V3V3}
N 1040 -240 1090 -240 {
lab=V3V3}
N 1090 -280 1090 -240 {
lab=V3V3}
N 1090 -280 1100 -280 {
lab=V3V3}
N 1090 -240 1090 -190 {
lab=V3V3}
N 1090 -190 1100 -190 {
lab=V3V3}
N 1040 -450 1120 -450 {
lab=V3V3}
C {devices/gnd.sym} 820 -470 0 0 {name=l22 lab=GND}
C {devices/isource.sym} 410 -400 2 0 {name=I1 value=1.5u
}
C {devices/gnd.sym} 410 -350 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} 1060 -350 1 0 {name=l25 sig_type=std_logic lab=pos}
C {devices/gnd.sym} 1140 -110 0 0 {name=l1 lab=GND}
C {devices/opin.sym} 1230 -520 0 0 {name=p3 lab=out
}
C {devices/lab_pin.sym} 710 -590 0 0 {name=l3 sig_type=std_logic lab=pos}
C {devices/gnd.sym} 550 -330 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 550 -440 1 0 {name=l4 sig_type=std_logic lab=ref
}
C {devices/lab_pin.sym} 710 -560 0 0 {name=l6 sig_type=std_logic lab=ref
}
C {devices/vsource.sym} 550 -380 0 0 {name=V1 value=1.2}
C {devices/code.sym} 638.75 -981.875 0 0 {name=dependencies
only_toplevel=true
spice_ignore=false
place=header
format="tcleval( @value )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/design.ngspice
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice typical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice mimcap_statistical
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice cap_mim
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sm141064.ngspice res_typical
.param R=36k
.options savecurrents
"}
C {devices/gnd.sym} 640 -330 0 0 {name=l7 lab=GND}
C {devices/lab_pin.sym} 640 -440 1 0 {name=l8 sig_type=std_logic lab=V3V3
}
C {devices/vsource.sym} 640 -380 0 0 {name=V2 value=3.3}
C {devices/gnd.sym} 1380 -530 0 0 {name=l9 lab=GND}
C {devices/vsource.sym} 1380 -580 0 0 {name=V3 value=2}
C {devices/lab_pin.sym} 1380 -740 1 0 {name=l5 sig_type=std_logic lab=vin
}
C {devices/lab_pin.sym} 1005 -560 1 0 {name=l12 sig_type=std_logic lab=op_out

}
C {gfamp.sym} 800 -560 0 0 {name=X1}
C {symbols/pfet_03v3.sym} 1120 -560 0 0 {name=M1
L=0.7u
W=100u
nf=110
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
C {symbols/ppolyf_u.sym} 1140 -450 0 0 {name=R1
W=0.4e-6
L=3e-6
model=ppolyf_u_1k
spiceprefix=X
m=1}
C {symbols/ppolyf_u.sym} 1140 -280 0 0 {name=R2
W=0.4e-6
L=3e-6
model=ppolyf_u_1k
spiceprefix=X
m=1}
C {symbols/ppolyf_u.sym} 1140 -190 0 0 {name=R3
W=0.4e-6
L=3e-6
model=ppolyf_u_1k
spiceprefix=X
m=1}
C {devices/lab_pin.sym} 1040 -240 1 0 {name=l13 sig_type=std_logic lab=V3V3
}
C {devices/lab_pin.sym} 1040 -450 1 0 {name=l11 sig_type=std_logic lab=V3V3
}
C {devices/code.sym} 828.75 -981.875 0 0 {name=initial_conditions
only_toplevel=true
value="
.nodeset v(out)=0
.nodeset v(pos)=0
"}
C {devices/code_shown.sym} 1608.75 -1111.875 0 0 {name="transient analysis"
only_toplevel=true
value="
*.control
*save all
*tran 1ns 2us
*plot v(out) v(ref) v(pos) v(vin)
*plot v(op_out)
*plot v(out)
*plot i(v3)
*plot i(v3)*v(vin)
*.endc
"}
C {devices/code_shown.sym} 1618.75 -851.875 0 0 {name="Stability_Analysis"
only_toplevel=true
value="
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
C {devices/code_shown.sym} 1598.75 -571.875 0 0 {name="Supply Sweep"
only_toplevel=true
value="
.control
save all
dc V3 3.3 0 -0.01
plot v(out) v(ref) v(pos) v(vin)
*wrdata /foss/designs/LDO_Design/data/data_SuplySweep_Vout.dat v(out)
*wrdata /foss/designs/LDO_Design/data/data_SuplySweep_Vref.dat v(ref)
*wrdata /foss/designs/LDO_Design/data/data_SuplySweep_Vin.dat v(vin)
plot v(op_out)
.endc
"}
C {devices/code_shown.sym} 2288.75 -651.875 0 0 {name="Load Transient"
only_toplevel=true
value="
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
C {devices/code_shown.sym} 2258.75 -951.875 0 0 {name="PSRR"
only_toplevel=true
value="
.control
save all
alter V3 AC =1
ac dec 100 1 1G
plot vdb(out)
let gm0=@m.xm0.m0[gm]
let Zout=(1.5)/(gm0*v(op_out))
let Zout2=v(out)/gm0
plot vdb(Zout2)
*wrdata /foss/designs/LDO_Design/data/data_PSRR.dat vdb(out)
.endc
"}
