ini_open("SGOUTDATA new.ini");
var rank = ini_read_string("Ranks", levelsign + string(obj_player.character), "none");

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

if (ini_read_string("P Ranks", levelsign + string(obj_player.character), 0) == 1)
    image_index = 10;

ini_close();
