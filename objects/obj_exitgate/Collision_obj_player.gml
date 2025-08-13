with (obj_player)
{
    if (grounded && x > (other.x - 160) && x < (other.x + 160) && key_up && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.mach3) && (global.panic == 1 || global.snickchallenge == 1))
    {
        targetDoor = "none";
        obj_camera.alarm[2] = -1;
        
        if (!global.deathmode)
        {
            if (global.collect >= global.srank)
            {
                global.rank = "s";
                
                if (global.secretfound >= 6 && !global.combodropped && global.hasthetreasure == 1)
                    global.prank = 1;
            }
            else if (global.collect > global.arank)
            {
                global.rank = "a";
            }
            else if (global.collect > global.brank)
            {
                global.rank = "b";
            }
            else if (global.collect > global.crank)
            {
                global.rank = "c";
            }
            else
            {
                global.rank = "d";
            }
        }
        else
        {
            if (global.uniquecollects < 2)
                global.rank = "d";
            
            if (global.uniquecollects > 2)
                global.rank = "c";
            
            if (global.uniquecollects > 4)
                global.rank = "b";
            
            if (global.uniquecollects > 5)
                global.rank = "a";
            
            if (global.uniquecollects >= 8)
                global.rank = "s";
            
            if (global.uniquecollects >= 9)
            {
                global.rank = "s";
                global.prank = 1;
            }
            
            ini_open("SGOUTsaveData.ini");
            
            if (global.uniquecollects >= 12)
            {
                global.SAGE12uniques = 1;
                ini_write_string("SAGE2025", "12uniques", 1);
            }
            
            ini_close();
        }
        
        var deth = "";
        
        if (global.deathmode)
        {
            deth = "DEATH";
            
            if (global.pizzafacechasestyle != 0)
                deth = "DEATH" + string(global.pizzafacechasestyle);
        }
        
        if (global.rank == "s")
        {
            if (global.prank)
                scr_soundeffect(mu_prank);
            else
                scr_soundeffect(mu_ranks);
        }
        
        if (global.rank == "a")
            scr_soundeffect(mu_ranka);
        
        if (global.rank == "b")
            scr_soundeffect(mu_rankc);
        
        if (global.rank == "c")
            scr_soundeffect(mu_rankc);
        
        if (global.rank == "d")
            scr_soundeffect(mu_rankd);
        
        var roomname = room_get_name(room);
        ini_open("SGOUTDATA new.ini");
        
        if (global.prank == 1)
            ini_write_string("P Ranks", string_letters(roomname) + string(obj_player.character) + deth, global.prank);
        
        ini_write_string("Treasure status", string_letters(roomname), global.hasthetreasure);
        ini_close();
        ini_open("SGOUTsaveData.ini");
        var dethh = "";
        var fih = "";
        
        if (global.difficulty == 1)
            fih = "D";
        
        if (global.pizzafacechasestyle != 0)
            dethh = string(global.pizzafacechasestyle);
        
        if (global.deathmode && ini_read_real("unique collects" + dethh + string(obj_player.character), string_letters(roomname), 0) <= global.uniquecollects)
            ini_write_real("unique collects" + dethh + string(obj_player.character), string_letters(roomname), global.uniquecollects);
        
        if (ini_read_real("Highscore", string_letters(roomname), 0) < global.collect)
            ini_write_string("Highscore", string_letters(roomname), global.collect);
        
        if (ini_read_real("Highscore" + string(obj_player.character) + deth, string_letters(roomname), 0) < global.collect)
            ini_write_string("Highscore" + string(obj_player.character) + deth, string_letters(roomname), global.collect);
        
        if (global.secretfound > ini_read_string("Secret" + string(obj_player.character) + deth, string_letters(roomname), 0))
            ini_write_string("Secret" + string(obj_player.character) + deth, string_letters(roomname), global.secretfound);
        
        if (ini_read_string("Treasure" + string(obj_player.character) + deth, string_letters(roomname), 0) == 0)
            ini_write_string("Treasure" + string(obj_player.character) + deth, string_letters(roomname), global.treasure);
        
        if (ini_read_string("Toppin" + string(obj_player.character) + deth, string_letters(roomname) + "1", 0) == 0)
            ini_write_string("Toppin" + string(obj_player.character) + deth, string_letters(roomname) + "1", global.shroomfollow);
        
        if (ini_read_string("Toppin" + string(obj_player.character) + deth, string_letters(roomname) + "2", 0) == 0)
            ini_write_string("Toppin" + string(obj_player.character) + deth, string_letters(roomname) + "2", global.cheesefollow);
        
        if (ini_read_string("Toppin" + string(obj_player.character) + deth, string_letters(roomname) + "3", 0) == 0)
            ini_write_string("Toppin" + string(obj_player.character) + deth, string_letters(roomname) + "3", global.tomatofollow);
        
        if (ini_read_string("Toppin" + string(obj_player.character) + deth, string_letters(roomname) + "4", 0) == 0)
            ini_write_string("Toppin" + string(obj_player.character) + deth, string_letters(roomname) + "4", global.sausagefollow);
        
        if (ini_read_string("Toppin" + string(obj_player.character) + deth, string_letters(roomname) + "5", 0) == 0)
            ini_write_string("Toppin" + string(obj_player.character) + deth, string_letters(roomname) + "5", global.pineapplefollow);
        
        if (string_letters(roomname) == "medieval")
        {
            ini_open("SGOUTsaveData.ini");
            
            if (global.SAGEknighttaken == 0)
            {
                global.SAGEknight = 1;
                global.SAGEknight = ini_write_string("SAGE2019", "knight", 1);
            }
        }
        
        if (string_letters(roomname) == "ruin")
            ini_open("SGOUTsaveData.ini");
        
        if (string_letters(roomname) == "dungeon")
        {
            ini_open("SGOUTsaveData.ini");
            
            if (obj_player.backupweapon == 1)
            {
                ini_write_string("SAGE2019", "dungeonbackup", 1);
                global.SAGEdungeonbackup = 1;
            }
        }
        
        if (string_letters(roomname) == "snickchallengeend")
        {
            ini_open("SGOUTsaveData.ini");
            
            if (global.SAGEshotgunsnicknumber >= 6)
            {
                global.SAGEshotgunsnick = 1;
                ini_write_string("SAGE2019", "shotgunsnick", 1);
            }
            
            ini_close();
            ini_open("SGOUTDATA new.ini");
            
            if (((global.minutes * 60) + global.seconds) > ((ini_read_real("Ranks", "snickchallengeM", 0) * 60) + ini_read_real("Ranks", "snickchallengeS", 0)))
            {
                var a = "";
                
                if (global.seconds <= 9)
                    a = "0";
                
                ini_write_string("Ranks", "snickchallenge" + string(obj_player.character) + deth, string(global.minutes) + ":" + a + string(global.seconds));
            }
            
            ini_close();
        }
        
        ini_open("SGOUTsaveData.ini");
        
        if (global.rank == "s")
            ini_write_string("Ranks", string_letters(roomname) + deth, global.rank);
        
        if (global.rank == "a" && "s" != ini_read_string("Ranks", string_letters(roomname) + deth, "none"))
            ini_write_string("Ranks", string_letters(roomname) + deth, global.rank);
        
        if (global.rank == "b" && "s" != ini_read_string("Ranks", string_letters(roomname) + deth, "none") && "a" != ini_read_string("Ranks", string_letters(roomname) + deth, "none"))
            ini_write_string("Ranks", string_letters(roomname) + deth, global.rank);
        
        if (global.rank == "c" && "s" != ini_read_string("Ranks", string_letters(roomname) + deth, "none") && "a" != ini_read_string("Ranks", string_letters(roomname) + deth, "none") && "b" != ini_read_string("Ranks", string_letters(roomname) + deth, "none"))
            ini_write_string("Ranks", string_letters(roomname), global.rank);
        
        if (global.rank == "d" && "s" != ini_read_string("Ranks", string_letters(roomname) + deth, "none") && "a" != ini_read_string("Ranks", string_letters(roomname) + deth, "none") && "b" != ini_read_string("Ranks", string_letters(roomname) + deth, "none") && "c" != ini_read_string("Ranks", string_letters(roomname) + deth, "none"))
            ini_write_string("Ranks", string_letters(roomname) + deth, global.rank);
        
        if (global.rank == "s")
            ini_write_string("Ranks", string_letters(roomname) + string(obj_player.character) + deth, global.rank);
        
        if (global.rank == "a" && "s" != ini_read_string("Ranks", string_letters(roomname) + string(obj_player.character) + deth, "none"))
            ini_write_string("Ranks", string_letters(roomname) + string(obj_player.character) + deth, global.rank);
        
        if (global.rank == "b" && "s" != ini_read_string("Ranks", string_letters(roomname) + string(obj_player.character) + deth, "none") && "a" != ini_read_string("Ranks", string_letters(roomname) + string(obj_player.character) + deth, "none"))
            ini_write_string("Ranks", string_letters(roomname) + string(obj_player.character) + deth, global.rank);
        
        if (global.rank == "c" && "s" != ini_read_string("Ranks", string_letters(roomname) + string(obj_player.character) + deth, "none") && "a" != ini_read_string("Ranks", string_letters(roomname) + string(obj_player.character) + deth, "none") && "b" != ini_read_string("Ranks", string_letters(roomname) + string(obj_player.character) + deth, "none"))
            ini_write_string("Ranks", string_letters(roomname) + string(obj_player.character) + deth, global.rank);
        
        if (global.rank == "d" && "s" != ini_read_string("Ranks", string_letters(roomname) + string(obj_player.character) + deth, "none") && "a" != ini_read_string("Ranks", string_letters(roomname) + string(obj_player.character) + deth, "none") && "b" != ini_read_string("Ranks", string_letters(roomname) + string(obj_player.character) + deth, "none") && "c" != ini_read_string("Ranks", string_letters(roomname) + string(obj_player.character) + deth, "none"))
            ini_write_string("Ranks", string_letters(roomname) + string(obj_player.character) + deth, global.rank);
        
        ini_close();
        
        if (!instance_exists(obj_endlevelfade))
            instance_create(x, y, obj_endlevelfade);
        
        obj_player1.state = states.door;
        obj_player1.sprite_index = obj_player1.spr_lookdoor;
        obj_endlevelfade.alarm[0] = 235;
        
        if (global.snickchallenge == 1)
            obj_endlevelfade.showtimer = 1;
        
        image_index = 0;
        global.panic = 0;
        global.draintime = 0;
        global.deathmode = 0;
        global.snickchallenge = 0;
        audio_stop_sound(obj_music.pausedmusic);
        
        if (audio_is_playing(mu_snickchallengeend))
            audio_stop_sound(mu_snickchallengeend);
    }
}
