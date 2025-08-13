with (obj_player)
{
    if (grounded && x > (other.x - 160) && x < (other.x + 160) && key_up && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.mach3))
    {
        targetDoor = "A";
        obj_camera.alarm[2] = -1;
        
        if (global.hurttimes <= 1)
        {
            global.rank = "s";
            
            if (global.hurttimes == 0)
                global.prank = 1;
        }
        
        if (global.hurttimes >= 2)
            global.rank = "a";
        
        if (global.hurttimes >= 3)
            global.rank = "b";
        
        if (global.hurttimes >= 5)
            global.rank = "c";
        
        if (global.hurttimes >= 6)
            global.rank = "d";
        
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
        
        audio_sound_gain(mu_ranks, global.audiomusvol, 0.1);
        audio_sound_gain(mu_ranka, global.audiomusvol, 0.1);
        audio_sound_gain(mu_rankb, global.audiomusvol, 0.1);
        audio_sound_gain(mu_rankc, global.audiomusvol, 0.1);
        audio_sound_gain(mu_rankd, global.audiomusvol, 0.1);
        audio_sound_gain(mu_prank, global.audiomusvol, 0.1);
        var roomname = room_get_name(room);
        var dif = "";
        
        if (global.difficulty != 0)
            dif = string(global.difficulty);
        
        ini_open("SGOUTDATA new.ini");
        
        if (global.prank == 1)
            ini_write_real("P Ranks", roomname + dif + string(obj_player.character), global.prank);
        
        if (((global.rank == "a" && "s" != ini_read_string("Ranks", roomname + dif, "none")) || ((global.rank == "b" && "s" != ini_read_string("Ranks", roomname + dif, "none" && "a" != ini_read_string("Ranks", roomname + dif, "none"))) || ((global.rank == "c" && "s" != ini_read_string("Ranks", roomname + dif, "none")) && "a" != ini_read_string("Ranks", roomname + dif, "none")) || (global.rank == "d" && "s" != ini_read_string("Ranks", roomname + dif, "none") && "a" != ini_read_string("Ranks", roomname + dif, "none") && "b" != ini_read_string("Ranks", roomname + dif, "none") && "c" != ini_read_string("Ranks", roomname + dif, "none")))) || global.rank == "s")
            ini_write_string("Ranks", roomname, global.rank);
        
        if (((global.rank == "a" && "s" != ini_read_string("Ranks", roomname + dif + string(obj_player.character), "none")) || ((global.rank == "b" && "s" != ini_read_string("Ranks", roomname + dif + string(obj_player.character), "none" && "a" != ini_read_string("Ranks", roomname + dif + string(obj_player.character), "none"))) || ((global.rank == "c" && "s" != ini_read_string("Ranks", roomname + dif + string(obj_player.character), "none")) && "a" != ini_read_string("Ranks", roomname + dif + string(obj_player.character), "none")) || (global.rank == "d" && "s" != ini_read_string("Ranks", roomname + dif + string(obj_player.character), "none") && "a" != ini_read_string("Ranks", roomname + dif + string(obj_player.character), "none") && "b" != ini_read_string("Ranks", roomname + dif + string(obj_player.character), "none") && "c" != ini_read_string("Ranks", roomname + dif + string(obj_player.character), "none")))) || global.rank == "s")
            ini_write_string("Ranks", roomname + dif + string(obj_player.character), global.rank);
        
        ini_close();
        
        if (!instance_exists(obj_endlevelfade))
            instance_create(x, y, obj_endlevelfade);
        
        obj_player1.state = states.door;
        obj_player1.sprite_index = obj_player1.spr_lookdoor;
        obj_endlevelfade.alarm[0] = 235;
        image_index = 0;
        audio_stop_sound(obj_music.pausedmusic);
    }
}
