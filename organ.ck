// organ.ck

// Nothing fancy here. Use the BeeThree to generate the break pattern.

BeeThree organ => Gain mGain => dac;
5 => organ.gain;

[27, 30, 32, 36, 27] @=> int notes[];

for (0 => int i; i < notes.cap(); i++)
{
    1 => organ.noteOn;
    Std.mtof(notes[i]) => organ.freq;
    (.625 / 2)::second => now;
}
.3125::second => now;
1 => organ.noteOff;
.3125::second => now;
    