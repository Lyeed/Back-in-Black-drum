<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if real audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o prepiano.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>
sr     = 44100
kr     = 2205
ksmps  = 20
nchnls = 2

instr 1; guitar
  ifrq = cpspch(p4)
  
  kenv linseg 0, .01, 200, p3-.02, 50, .01, 0

  a1     oscil 9,   1      * ifrq,  1
  a2     oscil 8,   2      * ifrq,  1
  a3     oscil 7,   3      * ifrq,  1
  a4     oscil 4,   4      * ifrq,  1
  a5     oscil 3,   6      * ifrq,  1
  a6     oscil 2,   4      * ifrq,  1
  a7     oscil 1,  10      * ifrq,  1
  a8     oscil 2,   4      * ifrq,  1
  a9     oscil 20,  1      * ifrq,  1

  aorgan = kenv* (a1+a2+a3+a4+a5+a6+a7+a8+a9)

  outs aorgan, aorgan
endin

instr 2; kick
  iamp      = p4

  k1  expon     120, .2, 50    
  k2  expon     500, .4, 200
  a1  oscil     iamp, k1, 2
  a2  reson     a1, k2, 50
  a3  butterlp  a2+a1,k1,2
  a4  butterlp  a3,   k1,2
  a5  butterlp  a4,2500,2
  a6  butterhp  a5,50
  a7  butterhp  a6,50
  a8  linen     a7,0.01,p3, .2  
  
  out a8
endin

instr 3; hithat

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

instr 4; snare
aenv1  expon  p4, 0.03, 0.5 
a1   oscili aenv1, 147, 2 
aamp      expon     1000,  0.2,   10 
arand     rand      aamp 
outs a1+arand, a1+arand 
endin

</CsInstruments>

<CsScore>
f1  0 8192 10 1 .02 .01
f2  0 4096 10 1
t 0 60

#define PATTERN_GUITAR_1
#
i1   ^+.13  .21   7.07

i1   ^+.92  .21   7.05
i1   ^+.21  .21   7.05
i1   ^+.21  .21   7.05

i1   ^+.92  .21   7.02
i1   ^+.21  .21   7.02
i1   ^+.21  .21   7.02


i1   ^+1.36 .17  7.09
i1   ^+.17  .17  7.07
i1   ^+.17  .17  7.06
i1   ^+.17  .17  7.04
i1   ^+.17  .17  7.04
i1   ^+.17  .17  7.02
i1   ^+.17  .17  7.01


i1   ^+.25 .21   7.07

i1   ^+.92 .21   7.05
i1   ^+.21 .21   7.05
i1   ^+.21 .21   7.05

i1   ^+.92  .21  7.02
i1   ^+.21  .21  7.02
i1   ^+.21  .21  7.02

i1			^+.68  .18   6.09
i1   ^+.18  .18   6.07

i1   ^+.27  .18   6.09
i1   ^+.18  .18   6.08

i1   ^+.27  .18   6.09
i1   ^+.18  .18   6.08

i1   ^+.27  .18   6.09
i1   ^+.18  .18   6.09
#

#define PATTERN_DRUM_1
#
i3 0 0.66 2000
i3 + . 	  .
i3 + .    .
i3 + .    .
i3 + . 	  .
i3 + . 	  .
i3 + .    .
i3 + .    .
#

#define PATTERN_DRUM_2
#
i3 + 0.33	2500
i2 ^ 0.33 10
i3 + 0.33 2500
i3 + 0.33 2500
i4 ^ 0.33 13000
i3 + 0.33 2500
#

#define PATTERN_DRUM_3
#
i3 + 0.33 2500
i2 ^ 0.33 10

i3 + 0.33 2500

i4 ^+0.3 0.2 13000

i3 + 0.5 2500
i2 ^ 0.3 10

i4 ^+0.3 0.2 13000

i3 + 0.5 2500
i2 ^ 0.3 10

i4 ^+0.3 0.2 13000

i3 + 0.5 2500
i2 ^ 0.3 10

i4 ^+0.3 0.2 13000

i4 ^+0.7 0.2 13000
#

#define PATTERN_DRUM_4
#
$PATTERN_DRUM_3
i4 + 0.15 10000
#

#define PATTERN_GUITAR_SINGLE
#
i1 5.2 0 0
$PATTERN_GUITAR_1
$PATTERN_GUITAR_1
$PATTERN_GUITAR_1
#

#define PATTERN_DRUM_SINGLE
#
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
#

$PATTERN_GUITAR_SINGLE
$PATTERN_DRUM_SINGLE

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
