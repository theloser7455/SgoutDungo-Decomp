if (place_meeting(x, y - 1, obj_player) && obj_player1.state != states.gameover)
{
    obj_player.state = states.fireass;
    obj_player.image_index = 0;
    obj_player.vsp = -25;
    obj_player.sprite_index = obj_player.spr_fireass;
    
    if (audio_is_playing(obj_player.painscream))
        audio_stop_sound(obj_player.painscream);
    
    if (audio_is_playing(sfx_fireass))
        audio_stop_sound(sfx_fireass);
    
    scr_soundeffect(obj_player.painscream);
    scr_soundeffect(sfx_fireass);
}
