bgalpha = 1;
bgalpha2 = 1;
bgalpha3 = 1;
bgalpha4 = 1;
level = "none";
ini_open("saveData.ini");
global.entrancehighscore = ini_read_string("Highscore", "entrance", 0);
global.medievalhighscore = ini_read_string("Highscore", "medieval", 0);
global.ruinhighscore = ini_read_string("Highscore", "ruin", 0);
global.dungeonhighscore = ini_read_string("Highscore", "dungeon", 0);
global.snickchallengehighscore = ini_read_string("Highscore", "snickchallenge", 0);
global.entrancetoppin1 = ini_read_string("Toppin", "entrance1", 0);
global.entrancetoppin2 = ini_read_string("Toppin", "entrance2", 0);
global.entrancetoppin3 = ini_read_string("Toppin", "entrance3", 0);
global.entrancetoppin4 = ini_read_string("Toppin", "entrance4", 0);
global.entrancetoppin5 = ini_read_string("Toppin", "entrance5", 0);
global.medievaltoppin1 = ini_read_string("Toppin", "medieval1", 0);
global.medievaltoppin2 = ini_read_string("Toppin", "medieval2", 0);
global.medievaltoppin3 = ini_read_string("Toppin", "medieval3", 0);
global.medievaltoppin4 = ini_read_string("Toppin", "medieval4", 0);
global.medievaltoppin5 = ini_read_string("Toppin", "medieval5", 0);
global.ruintoppin1 = ini_read_string("Toppin", "ruin1", 0);
global.ruintoppin2 = ini_read_string("Toppin", "ruin2", 0);
global.ruintoppin3 = ini_read_string("Toppin", "ruin3", 0);
global.ruintoppin4 = ini_read_string("Toppin", "ruin4", 0);
global.ruintoppin5 = ini_read_string("Toppin", "ruin5", 0);
global.dungeontoppin1 = ini_read_string("Toppin", "dungeon1", 0);
global.dungeontoppin2 = ini_read_string("Toppin", "dungeon2", 0);
global.dungeontoppin3 = ini_read_string("Toppin", "dungeon3", 0);
global.dungeontoppin4 = ini_read_string("Toppin", "dungeon4", 0);
global.dungeontoppin5 = ini_read_string("Toppin", "dungeon5", 0);
global.snickchallengetoppin1 = ini_read_string("Toppin", "snickchallenge1", 0);
global.snickchallengetoppin2 = ini_read_string("Toppin", "snickchallenge2", 0);
global.snickchallengetoppin3 = ini_read_string("Toppin", "snickchallenge3", 0);
global.snickchallengetoppin4 = ini_read_string("Toppin", "snickchallenge4", 0);
global.snickchallengetoppin5 = ini_read_string("Toppin", "snickchallenge5", 0);
global.medievalsecret = ini_read_string("Secret", "medieval", 0);
global.ruinsecret = ini_read_string("Secret", "ruin", 0);
global.dungeonsecret = ini_read_string("Secret", "dungeon", 0);
global.medievaltreasure = ini_read_string("Treasure", "medieval", 0);
global.ruintreasure = ini_read_string("Treasure", "ruin", 0);
global.dungeontreasure = ini_read_string("Treasure", "dungeon", 0);
ini_close();
targetDoor = "A";
treasure = 0;
treasuresprite = spr_treasure1pick;
bosslevel = 0;
