// chords.ck

// plays the 2 chords used in the tune.
SndBuf s[4];
Gain mGain;
ADSR env;

env.set(5::ms, 312.5::ms, 0.0, 5::ms); // sharp attack, an eighth note worth of decay to a 0 level

// set up 1 sound buff for each note in the chords
for (0=>int i; i < s.cap(); i++)
{
    me.dir(-1) + "/audio/stereo_fx_05.wav" => s[i].read;
    s[i].samples() => s[i].pos;
    s[i] => env => JCRev r => mGain => dac;
    0.25 => s[i].gain;
}

// This array contains precalculated rate values which raise the tone of the buffer by the amount shown
// note: this was tuned by ear against my piano, it may be off a little (probably is).

// Eb4  E4   F4    Gb4   G4   Ab4  A4    Bb4    B4    C4   Db4   D4     Eb5
[ 1.43, 1.5, 1.59, 1.69, 1.8, 1.9, 2.01, 2.135, 2.25, 2.4, 2.54, 2.684, 2.86] @=> float fxScale[];

[[0,3,7,10],[0,3,5,9]] @=> int chords[][];

// load the voices
fun void fxPlay( int notes[], SndBuf voice[] )
{
    for ( 0 => int v; v < notes.cap(); v++)
    {
        fxScale[notes[v]] => voice[v].rate;
        0 => voice[v].pos;
    }
}


while (true)
{
    .6 => mGain.gain;
    fxPlay(chords[0], s);
    1 => env.keyOn;
    .625::second => now;
    1 => env.keyOff;
    .625::second => now;
    1.25::second => now;
    1 => env.keyOn;
    fxPlay(chords[1], s);
    .625::second => now;
    1 => env.keyOff;
    .625::second => now;
    1.25::second => now;
}