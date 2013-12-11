SinOsc signal => blackhole; // don't want to hear the main sinewave
Gain g;
// define transfer function
fun float SineDrive(UGen input, UGen output)
{
    Step result => g => output; 
    do 
    { 
        Math.sin(2 * pi * input.last()) => result.next; // set next point in the signal
    }
    while (samp => now);   
}

spork ~ SineDrive(signal, dac);
.6 => dac.gain; // keep the level down

1.0 => float sg;
while (true)
{
    Std.mtof(27) => signal.freq;
    sg => signal.gain;   // set drive gain
    (.625 / 48)::second => now;
    (sg + 1) => sg;
    if (sg > 30.0) 
        { 1 => sg; } // reset the overdrive
    g.gain() - (0.01 * g.gain()) => g.gain; // fade the effect out over time - the score will remove this when it's ready
}
