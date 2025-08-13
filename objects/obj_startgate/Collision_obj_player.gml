with (obj_player1)
{
    if (key_up && grounded && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.gameover) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != states.victory && state != states.highjump)
    {
        obj_music.shutup = 1;
        backtohubstartx = x;
        backtohubstarty = y;
        backtohubroom = room;
        mach2 = 0;
        obj_camera.chargecamera = 0;
        image_index = 0;
        state = states.victory;
        
        if (!other.bosslevel)
        {
            if (global.difficulty == 1)
                global.deathmode = 1;
            
            if (global.difficulty == 2)
            {
                repeat (7)
                {
                    with (instance_create(x + random_range(32, -32), y, obj_littlenoisegremlin))
                        persistent = true;
                }
                
                with (instance_create(x + random_range(32, -32), y, obj_littlenoisegremlin))
                {
                    persistent = true;
                    weapon = "gun";
                }
            }
        }
    }
}

if (floor(obj_player1.image_index) == (obj_player1.image_number - 1) && obj_player1.state == states.victory && !instance_exists(obj_choosedifficulty))
{
    with (obj_player1)
    {
        if (other.level == "snickchallenge")
        {
            global.wave = 0;
            global.playingsnickchallenge = 1;
            global.maxwave = ((global.minutes * 60) + global.seconds) * 60;
            
            if (global.panicbg)
                scr_panicbg_init();
            
            global.snickchallenge = 1;
            global.collect = 10000;
            
            with (obj_camera)
            {
                alarm[1] = 60;
                global.seconds = 59;
                global.minutes = 4;
            }
        }
        
        obj_music.fadeoff = 0;
        targetDoor = other.targetDoor;
        targetRoom = other.targetRoom;
        
        if (targetRoom == pw_1)
        {
            if (!audio_is_playing(sfx_pepperworld_entrance))
                scr_soundeffect(sfx_pepperworld_entrance);
            
            audio_sound_pitch(sfx_pepperworld_entrance, 2);
            audio_sound_gain(sfx_pepperworld_entrance, 10 * global.audiosfxvol, 0.1);
        }
        
        if (!instance_exists(obj_fadeout))
        {
            with (instance_create(x, y, obj_fadeout))
                startingsgout = 1;
        }
    }
}
