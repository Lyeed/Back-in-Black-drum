<CsoundSynthesizer>

<CsOptions>
-odac                             ; real time render
;-o clairLune.wav -W              ; file render
</CsOptions>

<CsInstruments>

sr = 44100                        ; CD sample-rate
ksmps = 10
nchnls = 1                        ; mono sound

instr 1; kick
  iamp      = p4

  k1  expon     120, .2, 50    
  k2  expon     500, .4, 200
  a1  oscil     iamp, k1, 1
  a2  reson     a1, k2, 50
  a3  butterlp  a2+a1,k1,1
  a4  butterlp  a3,   k1,1
  a5  butterlp  a4,2500,1
  a6  butterhp  a5,50
  a7  butterhp  a6,50
  a8  linen     a7,0.01,p3, .2  
  
  out a8
endin

instr 2; hithat

  ilen init p3
  iamp init p4

  kcutfreq  expon     10000, 0.1, 2500
  aamp      expon     iamp,  0.1,   10
  arand     rand      aamp
  alp1      butterlp  arand,kcutfreq
  alp2      butterlp  alp1,kcutfreq
  ahp1      butterhp  alp2,3500
  asigpre   butterhp  ahp1,3500
  asig      linen    (asigpre+arand/2),0,ilen, .05  

  out asig
endin

instr 3; snare
aenv1  expon  p4, 0.03, 0.5 
a1   oscili aenv1, 147, 1 
aamp      expon     1000,  0.2,   10 
arand     rand      aamp 
outs a1+arand, a1+arand 
endin

</CsInstruments>
<CsScore>

f 1 0 4096 10 1            ; sine wave
t 0 60                    ; 1 beats per second
f 2 0 1024 10 1

#define PATTERN_DRUM_1
#
i 2 + 0.66 2000
i 2 + . 	  .
i 2 + .    .
i 2 + .    .
i 2 + . 	  .
i 2 + . 	  .
i 2 + .    .
i 2 + .    .
#

#define PATTERN_DRUM_2
#
i 2 + 0.33	2500
i 1 ^ 0.33 10
i 2 + 0.33 2500
i 2 + 0.33 2500
i 3 ^ 0.33 13000
i 2 + 0.33 2500
#

#define PATTERN_DRUM_3
#
i 2 + 0.33 2500
i 1 ^ 0.33 10

i 2 + 0.33 2500

i 3 ^+0.3 0.2 13000

i 2 + 0.5 2500
i 1 ^ 0.3 10

i 3 ^+0.3 0.2 13000

i 2 + 0.5 2500
i 1 ^ 0.3 10

i 3 ^+0.3 0.2 13000

i 2 + 0.5 2500
i 1 ^ 0.3 10

i 3 ^+0.3 0.2 13000

i 3 ^+0.7 0.2 13000
#

#define PATTERN_DRUM_4
#
$PATTERN_DRUM_3
i 3 + 0.15 10000
#

;
;
$PATTERN_DRUM_1
$PATTERN_DRUM_2
$PATTERN_DRUM_2
$PATTERN_DRUM_2	
$PATTERN_DRUM_2
$PATTERN_DRUM_2
$PATTERN_DRUM_2
$PATTERN_DRUM_3
$PATTERN_DRUM_2
$PATTERN_DRUM_2
$PATTERN_DRUM_2
$PATTERN_DRUM_2
$PATTERN_DRUM_2
$PATTERN_DRUM_2
$PATTERN_DRUM_3
$PATTERN_DRUM_2
$PATTERN_DRUM_2
$PATTERN_DRUM_2
$PATTERN_DRUM_2
$PATTERN_DRUM_2
$PATTERN_DRUM_2
$PATTERN_DRUM_4
e

</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
