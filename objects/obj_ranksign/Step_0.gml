ini_open("saveData.ini");
global.entrancerank = ini_read_string("Ranks", "entrance", "none");
global.medievalrank = ini_read_string("Ranks", "medieval", "none");
global.ruinrank = ini_read_string("Ranks", "ruin", "none");
global.dungeonrank = ini_read_string("Ranks", "dungeon", "none");
global.snickchallengerank = ini_read_string("Ranks", "snickchallenge", "none");
var rank = ini_read_string("Ranks", levelsign, "none");

if (rank == "none")
    visible = false;
else
    visible = true;

if (rank == "s")
    image_index = 0;

if (rank == "a")
    image_index = 1;

if (rank == "b")
    image_index = 2;

if (rank == "c")
    image_index = 3;

if (rank == "d")
    image_index = 4;

ini_close();
ini_open("SGOUTDATA.ini");

if (ini_read_string("P Ranks", levelsign, 0) == 1)
    image_index = 10;

ini_close();

with (obj_startgate)
{
    if (level == "snickchallenge")
    {
        if (global.medievalrank == "none" || global.ruinrank == "none" || global.dungeonrank == "none")
            instance_destroy();
    }
}
