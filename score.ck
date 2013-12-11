// score1.ck

// paths
me.dir() + "/overdrive.ck" => string overdrivePath;
me.dir() + "/hats.ck" => string hatsPath;
me.dir() + "/chords.ck" => string chordsPath;

me.dir() + "/bass1.ck" => string bass1Path;
me.dir() + "/kicks.ck" => string kicksPath;
me.dir() + "/organ.ck" => string organPath;

// Establish timing constraints
.625 => float qNote;
(qNote * 4)::second => dur measure;



Machine.add(overdrivePath) => int overdriveID;
(1.5*measure) => now; 

// (3.75 seconds)
Machine.add(bass1Path) => int bass1ID;
(2*measure) => now;
// (8.75 seconds)
Machine.add(kicksPath) => int kicksID;
Machine.remove(overdriveID);
Machine.add(hatsPath) => int hatsID;
(1*measure) => now;
// (11.25 seconds)
Machine.add(chordsPath) => int chordsID;
(3*measure) => now;
// (18.75 seconds)
Machine.add(organPath) => int organID;
(1*measure) => now;
// (21.25 seconds)
Machine.add(overdrivePath) => overdriveID; 
(2.25*measure) => now;
// (26.75 seconds)
Machine.remove(overdriveID);
(1 * measure) => now;
// (29 seconds)
Machine.remove(chordsID);
(.25 * measure) => now;
Machine.remove(hatsID);
//(.25 * measure) => now;
Machine.remove(bass1ID);
(.25 * measure) => now;
Machine.remove(kicksID);
