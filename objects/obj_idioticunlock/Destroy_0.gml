obj_tv.message = "YOU UNLOCKED IDIOT";
obj_tv.showtext = 1;
obj_tv.alarm[0] = 150;
ini_open("SGOUTDATA new.ini");
ini_write_real("unlocks", "idiot", 1);
ini_close();

if (global.unlockedidiot)
    obj_tv.message = "YOU ARE AN IDIOT!!!";

global.unlockedidiot = 1;
