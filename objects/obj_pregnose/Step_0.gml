if (x != obj_player1.x && !fuckingdie)
    image_xscale = -sign(x - obj_player1.x);

if (distance_to_object(obj_player) <= 400 && !fuckingdie)
{
    scr_soundeffect(sfx_screampregnose);
    fuckingdie = 1;
}

if (distance_to_object(obj_player) <= 1200 && !audio_is_playing(sfx_presidentpregnose) && distance_to_object(obj_player) > 400)
    scr_soundeffect(sfx_presidentpregnose);

if (fuckingdie)
{
    if (audio_is_playing(sfx_presidentpregnose))
        audio_stop_sound(sfx_presidentpregnose);
    
    ds_list_add(global.baddieroom, id);
    vspeed = -10;
    image_xscale = lerp(image_xscale, 0, 0.125);
    image_yscale = lerp(image_yscale, 5, 0.125);
}
