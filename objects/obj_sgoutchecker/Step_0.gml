ini_open("SGOUTDATA new.ini");

if (global.medievalrank != "none" && global.ruinrank != "none" && global.dungeonrank != "none" && !global.hascontent)
{
    ini_write_string("general", "content unlocked", 1);
    global.hascontent = obj_solid;
    room = rm_contentunlocked;
    obj_player.state = states.titlescreen;
    obj_player.x = 50;
    obj_player.y = -100;
}

ini_close();
