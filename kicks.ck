me.dir(-1) + "/audio/kick_01.wav" => string kickPath;

SndBuf s => dac;
5 => s.gain;

kickPath => s.read;
s.samples() => s.pos;


.625 => float qNote; 

while (true)
{
    0 => s.pos;
    (qNote)::second => now; // 1 beat per quarter
}
