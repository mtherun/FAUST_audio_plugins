import("stdfaust.lib");
//cf=cutoff freq
harmfm(cf,hratio,idx)=os.square(cf + os.osc(cf*hratio)*idx*hratio);
fm1=hgroup("[0]FM",harmfm(carfreq,harmratio,index))
  with{
  harmratio=hslider("[0]Distortion[style:knob]",1,0,10,0.01); //Harmonic ratio
  index=hslider("[1]Modulation Index[style:knob]",100,0,1000,0.01);
  carfreq=hslider("[2]freq",440,10,2000,0.01);
};
envelope=hgroup("[1]Envelope",en.adsr(attack,decay,sustain,release,gate)*gain*0.3)
  with{
  attack=hslider("[0]Attack[style:knob]",500,1,1000,1)*0.001;
  decay=hslider("[0]Decay[style:knob]",50,1,1000,1)*0.001; 
  sustain=hslider("[0]Sustain[style:knob]",250,1,1000,1)*0.001;
  release=hslider("[0]Release[style:knob]",50,1,1000,1)*0.001;
  gain=hslider("[0]Gain[style:knob]",1,0,1,0.01);
  gate=checkbox("[5]Click here to enable");
};
fm=fm1:hgroup("[2]Bandpass Filter+LFO",fi.resonbp(resfreq,q,1))
  with{
    ctfreq=hslider("[0]Pedal control[style:knob]",200,10,10000,0.1); //Cutoff freq
  q=hslider("[1]Q[style:knob]",5,1,30,0.1);
  lfofreq=hslider("[2]LFO Frequency[style:knob]",10,0.1,20,0.01);
   lfodepth=hslider("[3]LFO depth[style:knob]",500,1,10000,1);
  resfreq=os.osc(lfofreq)*lfodepth+ctfreq:max(50);
};
fm2=fm*envelope;
fm3=fm1*0;
process =vgroup("Wah Wah Effect",fm2,fm3:>_);
