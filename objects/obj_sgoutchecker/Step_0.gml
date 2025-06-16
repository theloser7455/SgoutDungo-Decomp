ini_open("SGOUTDATA.ini");

if (global.medievalrank != "none" && global.ruinrank != "none" && global.dungeonrank != "none" && !global.hascontent)
{
    ini_write_string("general", "content unlocked", 1);
    global.hascontent = obj_solid;
    room = rm_contentunlocked;
}

ini_close();
