declare filename "untitled.dsp";
declare name "untitled";
import("stdfaust.lib");
ff=(_<:(@(dellength):*(gain)),_:>_)
with{
dellength=hslider("Delay Length",25000,1,50000,1);
gain=hslider("b1",0.5,-1,1,0.01);
};
process=button("Tap"):pm.djembe(440,0.5,0.5,1):ff;