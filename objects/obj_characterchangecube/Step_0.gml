ini_open("SGOUTDATA new.ini");

if (place_meeting(x, y + 1, obj_player) && activated == 0)
{
    audio_stop_sound(sfx_mach3);
    audio_stop_sound(sfx_mach4);
    audio_stop_sound(sfx_noisemach3);
    audio_stop_sound(sfx_noisemach4);
    
    with (obj_player1)
    {
        if (other.activated == 0)
        {
            if (character == "S")
                y += 16;
            
            switch (character)
            {
                case "P":
                    character = "N";
                    other.image_index = 0;
                    break;
                
                case "N":
                    character = "P";
                    other.image_index = 2;
                    break;
                
                case "V":
                    character = "S";
                    other.image_index = 1;
                    break;
                
                case "S":
                    character = "R";
                    other.image_index = 3;
                    break;
                
                case "R":
                    character = "P";
                    other.image_index = 2;
                    break;
            }
            
            scr_characterspr();
            paletteselect = ini_read_real("palette", string(obj_player1.character) + "pal", 0);
            other.activated = 1;
            other.shake = 15;
            vsp = 1;
            other.alarm[0] = 50;
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
            state = states.Sjumpland;
            machhitAnim = 0;
        }
        
        if (character == "S")
            y -= 14;
    }
}

x = xstart + random_range(shake, -shake);

if (shake > 0)
    shake -= 1;

ini_close();
