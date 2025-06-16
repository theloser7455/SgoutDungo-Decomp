if (global.seconds == 0 && global.minutes == 0 && obj_player.character != "TERRENCE")
{
    instance_create(x, y, obj_bossdefeatflash);
    
    if (instance_exists(obj_baddie))
        instance_destroy(obj_baddie);
    
    scr_gameover_setup();
    scr_soundeffect(sfx_killenemy);
}

if (global.collect > 0)
    instance_create(obj_player.x, obj_player.y, obj_pizzaloss);

if (global.collect > 0)
    global.collect -= 5;

if (global.snickchallenge == 1 && global.collect == 0)
{
    with (obj_player)
    {
        state = 54;
        sprite_index = spr_deathstart;
        image_index = 0;
        audio_stop_all();
        scr_soundeffect(mu_timesup);
    }
    
    alarm[2] = -1;
}
