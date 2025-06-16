function scr_sgoutsaves()
{
	ini_open("SGOUTDATA.ini");
	
	if (!ini_section_exists("general"))
	{
	    ini_write_string("general", "content unlocked", 0);
	    ini_write_string("general", "skibidi toilet", 0);
	}
	
	if (!ini_section_exists("afterimages"))
	    scr_afterimagessave();
	
	if (!ini_section_exists("the 🎶"))
	{
	    ini_write_real("the 🎶", "sfx", global.audiosfxvol);
	    ini_write_real("the 🎶", "mus", global.audiomusvol);
	}
	
	if (!ini_section_exists("Treasure status"))
	{
	    ini_write_real("Treasure status", "dungeon", 0);
	    ini_write_real("Treasure status", "medieval", 0);
	    ini_write_real("Treasure status", "ruin", 0);
	    ini_write_real("Treasure status", "mansionz", 0);
	    ini_write_real("Treasure status", "freezerz", 0);
	    ini_write_real("Treasure status", "windy", 0);
	    ini_write_real("Treasure status", "flooded", 0);
	}
	
	if (!ini_section_exists("Ranks"))
	{
	    ini_write_string("Ranks", "snickchallenge", "null");
	    ini_write_real("Ranks", "snickchallengeM", 0);
	    ini_write_real("Ranks", "snickchallengeS", 0);
	}
	
	global.hascontent = ini_read_string("general", "content unlocked", 0);
	ini_close();
}
