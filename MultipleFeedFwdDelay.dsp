declare filename "untitled.dsp";
declare name "untitled";
import("stdfaust.lib");
ff=(_<:(@(dellength):*(gain)),(@(rdellength):*(gain)):>_)
with{
dellength=hslider("Left Delay Length",25000,1,50000,1);
rdellength=hslider("Right Delay Length",20000,1,50000,1);
gain=hslider("b1",0.5,-1,1,0.01);
};
process=(button("Tap"):pm.djembe(440,0.5,0.5,1):ff);