declare filename "untitled.dsp";
declare name "untitled";
import("stdfaust.lib");
fb= +~(@(dellength):*(feedback)*gain)
  with
{
dellength=  hslider("Delay Length",30000,1,45000,1);
  feedback= hslider("Feedback",0.5,0,1,0.01);
   gain= hslider("Gain",1,0,1,0.01);
};

ff=(_<:(@(dellength1):*(gain1)),_:>_)
  with{
  dellength1=hslider("Delay Length for FF",25000,1,50000,1);
  gain1=hslider("b1",0.5,-1,1,0.01);
};

perc=vgroup("Percussion",(pm.djembe_ui_MIDI:fb):ff);
chordo=vgroup("Chordophones",(pm.nylonGuitar_ui_MIDI:fb):ff);
aro=vgroup("Looper",(pm.clarinet_ui_MIDI:fb):ff);

process=hgroup("Instrumental",(perc,chordo):>_,(aro):>_);