if (sprite_index == spr_pizzaface_fireass || sprite_index == spr_pizzaface_electricity)
{
    repeat (5)
    {
        with (instance_create(x + random_range(64, -64), y + random_range(64, -64), obj_bangeffect))
        {
            sprite_index = spr_genericpoofeffect;
            depth = other.depth - 1;
        }
    }
    
    if (sprite_index == spr_pizzaface_fireass || sprite_index == spr_pizzaface_electricity)
        scr_soundeffect(sfx_fireassend);
    
    if (audio_is_playing(sfx_zaplong))
        audio_stop_sound(sfx_zaplong);
}

stun = 0;
move = 1;
