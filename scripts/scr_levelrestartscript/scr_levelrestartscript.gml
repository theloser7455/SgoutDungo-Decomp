function scr_levelrestartscript()
{
	var roomname = room_get_name(room);
	global.levelrestartamount += 1;
	var RRR = 0;
	
	if (object_index == obj_gameoverrestart)
	    RRR = 1;
	
	with (obj_pause)
	{
	    if (global.snickchallenge == 0)
	    {
	        if ((string_letters(roomname) == "medieval" || string_letters(roomname) == "medievalsecret") || room == medieval_treasure || room == medieval_supersecret1 || room == medieval_supersecret2 || room == medieval_supersecret3)
	        {
	            instance_activate_all();
	            room = medieval_1;
	            scr_playerreset();
	            pause = 0;
	            obj_player1.targetDoor = "A";
	            
	            if (!RRR)
	                audio_stop_all();
	        }
	        else if ((string_letters(roomname) == "ruin" || string_letters(roomname) == "ruinsecret") || room == ruin_treasure)
	        {
	            instance_activate_all();
	            room = ruin_1;
	            scr_playerreset();
	            pause = 0;
	            obj_player1.targetDoor = "A";
	            
	            if (!RRR)
	                audio_stop_all();
	        }
	        else if ((string_letters(roomname) == "dungeon" || string_letters(roomname) == "dungeonsecret" || room == dungeon_5b) || room == dungeon_treasure)
	        {
	            instance_activate_all();
	            room = dungeon_1;
	            scr_playerreset();
	            pause = 0;
	            obj_player1.targetDoor = "A";
	            
	            if (!RRR)
	                audio_stop_all();
	        }
	        else if (room == boss_room1)
	        {
	            instance_activate_all();
	            room = boss_room1;
	            scr_playerreset();
	            pause = 0;
	            obj_player1.targetDoor = "A";
	            
	            if (!RRR)
	                audio_stop_all();
	        }
	        else if (room == boss_devilkin)
	        {
	            instance_activate_all();
	            room = boss_devilkin;
	            scr_playerreset();
	            pause = 0;
	            obj_player1.targetDoor = "A";
	            
	            if (!RRR)
	                audio_stop_all();
	        }
	        else if (room == boss_room1butevil)
	        {
	            instance_activate_all();
	            room = boss_room1butevil;
	            scr_playerreset();
	            pause = 0;
	            obj_player1.targetDoor = "A";
	            
	            if (!RRR)
	                audio_stop_all();
	        }
	        else if (room == boss_angelkin)
	        {
	            instance_activate_all();
	            room = boss_angelkin;
	            scr_playerreset();
	            pause = 0;
	            obj_player1.targetDoor = "A";
	            
	            if (!RRR)
	                audio_stop_all();
	        }
	        else if (room == boss_idiot)
	        {
	            instance_activate_all();
	            room = boss_idiot;
	            scr_playerreset();
	            pause = 0;
	            obj_player1.targetDoor = "A";
	            
	            if (!RRR)
	                audio_stop_all();
	        }
	        else if (room == boss_greaterman || string_letters(roomname) == "pw")
	        {
	            instance_activate_all();
	            room = pw_1;
	            scr_playerreset();
	            pause = 0;
	            obj_player1.targetDoor = "A";
	            
	            if (!RRR)
	                audio_stop_all();
	        }
	        else
	        {
	            scr_soundeffect(sfx_enemyprojectile);
	        }
	    }
	    else if (global.snickchallenge == 1)
	    {
	        instance_activate_all();
	        room = medieval_1;
	        scr_playerreset();
	        global.collect = 10000;
	        global.seconds = 59;
	        global.minutes = 4;
	        global.wave = 0;
	        global.maxwave = ((global.minutes * 60) + global.seconds) * 60;
	        
	        if (global.panicbg)
	            scr_panicbg_init();
	        
	        obj_player1.targetDoor = "A";
	        global.snickchallenge = 1;
	        pause = 0;
	    }
	    
	    if (!pause)
	    {
	        obj_camera.alarm[1] = 60;
	        
	        with (obj_music)
	        {
	            var chancee = round(random_range(20, 0));
	            
	            if (chancee == 20)
	                obj_music.sonec = 1;
	            else
	                obj_music.sonec = 0;
	        }
	    }
	}
	
	if (global.difficulty == 1 && !instance_exists(obj_bosscontrol) && room != pw_1 && room != pw_2 && room != pw_3)
	{
	    global.deathmode = 1;
	    global.draintime = 1;
	}
}
