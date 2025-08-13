function scr_exitlevelscript()
{
	with (obj_pause)
	{
	    if (room == hub_room1 || room == cowboytask || room == Titlescreen || room == Scootertransition || room == hub_roomextra)
	    {
	        pause = 0;
	        instance_activate_all();
	        room = Realtitlescreen;
	        
	        with (obj_player1)
	        {
	            character = "P";
	            scr_characterspr();
	            ini_open("SGOUTDATA new.ini");
	            paletteselect = ini_read_real("palette", "Ppal", 1);
	            ini_close();
	        }
	        
	        scr_playerreset();
	        obj_player.state = states.titlescreen;
	        global.cowboyhat = 0;
	        obj_player1.targetDoor = "A";
	    }
	    else
	    {
	        pause = 0;
	        instance_activate_all();
	        scr_playerreset();
	        obj_player.targetDoor = "A";
	        room = hub_room1;
	    }
	    
	    global.deathmode = 0;
	}
	
	audio_stop_all();
	global.levelrestartamount = 0;
	global.playingsnickchallenge = 0;
}
