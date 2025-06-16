if (place_meeting(x, y + 1, obj_player) && activated == 0)
{
    audio_stop_sound(sfx_mach3);
    audio_stop_sound(sfx_mach4);
    audio_stop_sound(sfx_noisemach3);
    audio_stop_sound(sfx_noisemach4);
    
    with (obj_player1)
    {
        if (character == "P" && other.activated == 0)
        {
            other.image_index += 2;
            character = "N";
            other.activated = 1;
            other.shake = 15;
            vsp = 1;
            other.alarm[0] = 50;
            scr_characterspr();
            a = 0;
            sprite_index = spr_superjumpland;
            
            with (obj_camera)
            {
                shake_mag = 10;
                shake_mag_acc = 30 / room_speed;
            }
            
            with (obj_baddie)
            {
                if (point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), __view_get(0, 0) + __view_get(2, 0), __view_get(1, 0) + __view_get(3, 0)))
                {
                    image_index = 0;
                    
                    if (grounded)
                        vsp = -7;
                }
            }
            
            if (character != "R")
                scr_soundeffect(sfx_groundpound);
            else
                scr_soundeffect(cheesestomp);
            
            image_index = 0;
            state = 91;
            machhitAnim = 0;
        }
        
        if (character == "S" && other.activated == 0)
        {
            other.image_index += 1;
            character = "N";
            other.activated = 1;
            other.shake = 15;
            vsp = 1;
            other.alarm[0] = 50;
            scr_characterspr();
            sprite_index = spr_superjumpland;
            
            with (obj_camera)
            {
                shake_mag = 10;
                shake_mag_acc = 30 / room_speed;
            }
            
            with (obj_baddie)
            {
                if (point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), __view_get(0, 0) + __view_get(2, 0), __view_get(1, 0) + __view_get(3, 0)))
                {
                    image_index = 0;
                    
                    if (grounded)
                        vsp = -7;
                }
            }
            
            if (character != "R")
                scr_soundeffect(sfx_groundpound);
            else
                scr_soundeffect(cheesestomp);
            
            image_index = 0;
            state = 91;
            machhitAnim = 0;
        }
        
        if (character == "N" && other.activated == 0)
        {
            other.image_index += 1;
            character = "P";
            other.activated = 1;
            other.shake = 15;
            vsp = 1;
            other.alarm[0] = 50;
            scr_characterspr();
            sprite_index = spr_superjumpland;
            
            with (obj_camera)
            {
                shake_mag = 10;
                shake_mag_acc = 30 / room_speed;
            }
            
            with (obj_baddie)
            {
                if (point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), __view_get(0, 0) + __view_get(2, 0), __view_get(1, 0) + __view_get(3, 0)))
                {
                    image_index = 0;
                    
                    if (grounded)
                        vsp = -7;
                }
            }
            
            if (character != "R")
                scr_soundeffect(sfx_groundpound);
            else
                scr_soundeffect(cheesestomp);
            
            image_index = 0;
            state = 91;
            machhitAnim = 0;
        }
        
        if (character == "R" && other.activated == 0)
        {
            other.image_index += 1;
            character = "P";
            other.activated = 1;
            other.shake = 15;
            vsp = 1;
            other.alarm[0] = 50;
            scr_characterspr();
            sprite_index = spr_superjumpland;
            
            with (obj_camera)
            {
                shake_mag = 10;
                shake_mag_acc = 30 / room_speed;
            }
            
            with (obj_baddie)
            {
                if (point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), __view_get(0, 0) + __view_get(2, 0), __view_get(1, 0) + __view_get(3, 0)))
                {
                    image_index = 0;
                    
                    if (grounded)
                        vsp = -7;
                }
            }
            
            if (character != "R")
                scr_soundeffect(sfx_groundpound);
            else
                scr_soundeffect(cheesestomp);
            
            image_index = 0;
            state = 91;
            machhitAnim = 0;
        }
    }
}

if (image_index == 1)
    image_index += 1;

x = xstart + random_range(shake, -shake);

if (shake > 0)
    shake -= 1;
