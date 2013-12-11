// initialize.ck
// This one was fun. Wish I didn't have to end at 30 seconds - there is so much more that I could have rolled into this.

<<< "It's got to be jazz, it's too slow for techno" >>>;
me.dir() + "/score.ck" => string scorePath; // set up the score file

Machine.add(scorePath) => int scoreID; // execute the score

