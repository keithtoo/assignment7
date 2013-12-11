// bass1.ck

// single note bass throb.
// I thought it was kind of cool as it's slightly out of synch as the score begins, but ends up tying in nicely.

Moog m => Gain mGain => dac;

1 => m.gain;
.6 => m.filterQ;
.6 => m.filterSweepRate;

Std.mtof(27) => m.freq;

while (true)
{    
    1 => m.noteOn;
    .625::second => now;
    1 => m.noteOff;
    .625::second => now;
}