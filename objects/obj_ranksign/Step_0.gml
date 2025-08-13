ini_open("SGOUTsaveData.ini");
global.entrancerank = ini_read_string("Ranks", "entrance", "none");
global.medievalrank = ini_read_string("Ranks", "medieval", "none");
global.ruinrank = ini_read_string("Ranks", "ruin", "none");
global.dungeonrank = ini_read_string("Ranks", "dungeon", "none");
global.snickchallengerank = ini_read_string("Ranks", "snickchallenge", "none");
var deth = "";

if (global.difficulty == 1)
{
    deth = "DEATH";
    
    if (global.pizzafacechasestyle != 0)
        deth = "DEATH" + string(global.pizzafacechasestyle);
}

var rank = ini_read_string("Ranks", levelsign + string(obj_player.character) + deth, "none");

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
ini_open("SGOUTDATA new.ini");

if (ini_read_string("P Ranks", levelsign + string(obj_player.character) + deth, 0) == 1)
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
