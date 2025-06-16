if (place_meeting(x, bbox_top, obj_player1) && floor(obj_player1.vsp) > 0 && (bbox_top + 1) == (obj_player1.bbox_top + 1))
{
    if (audio_is_playing(sfx_enemyprojectile))
        audio_stop_sound(sfx_enemyprojectile);
    
    scr_soundeffect(sfx_enemyprojectile);
}

if (place_meeting(x, bbox_top, obj_player1) && floor(obj_player1.vsp) < 0 && (bbox_top + 1) == (obj_player1.bbox_top + 1))
{
    if (audio_is_playing(sfx_tumble4))
        audio_stop_sound(sfx_tumble4);
    
    scr_soundeffect(sfx_tumble4);
}

if (electro)
{
    with (instance_place(x, y, obj_baddie))
        instance_destroy();
    
    with (instance_place(x, y, obj_strongbaddie))
        instance_destroy();
    
    with (instance_place(x, y, obj_stupidratblock))
        instance_destroy();
    
    if (alarm[1] <= 0)
        alarm[1] = 5;
}

if (flash == 1 && alarm[0] <= 0)
    alarm[0] = 1;
