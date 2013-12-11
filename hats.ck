// hats.ck

// another nothing fancy pattern. 

SndBuf s;

me.dir(-1) + "/audio/hihat_01.wav" => string hatPath;
hatPath => s.read;
s.samples() => s.pos;

s => Gain mGain => dac;
0 => int count;
while (true)
{
    (.625 / 2)::second => now;
    0 => s.pos;
}