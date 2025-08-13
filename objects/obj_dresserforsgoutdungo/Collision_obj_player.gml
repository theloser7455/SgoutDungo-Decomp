with (other)
{
    if (key_up2 && grounded)
    {
        with (instance_create(x, y, obj_sausageman_dead))
        {
            sprite_index = other.clothes;
            spr_palette = other.spr_palette;
            paletteselect = other.paletteselect;
            hsp = random_range(-10, 10);
        }
        
        paletteselect++;
        
        if (paletteselect == 14)
            paletteselect += 1;
        
        switch (character)
        {
            case "P":
                if (paletteselect > 18)
                    paletteselect = 0;
                
                break;
            
            case "N":
                if (paletteselect > 10)
                    paletteselect = 1;
                
                break;
        }
        
        scr_soundeffect(sfx_stompenemy);
    }
    
    if (key_down2 && grounded)
    {
        with (instance_create(x, y, obj_sausageman_dead))
        {
            sprite_index = other.clothes;
            spr_palette = other.spr_palette;
            paletteselect = other.paletteselect;
            hsp = random_range(-10, 10);
        }
        
        paletteselect--;
        
        if (paletteselect == 14)
            paletteselect -= 1;
        
        switch (character)
        {
            case "P":
                if (paletteselect < 0)
                    paletteselect = 18;
                
                break;
            
            case "N":
                if (paletteselect < 1)
                    paletteselect = 10;
                
                break;
        }
        
        scr_soundeffect(sfx_stompenemy);
    }
}

with (obj_tv)
{
    switch (obj_player.character)
    {
        case "P":
            message = other.pepname[obj_player.paletteselect];
            break;
        
        case "N":
            message = other.noisename[obj_player.paletteselect];
            break;
        
        default:
            message = "NO NAME YET";
            break;
    }
    
    showtext = 1;
    alarm[0] = 2;
}

ini_open("SGOUTDATA new.ini");
ini_write_real("palette", string(obj_player1.character) + "pal", obj_player.paletteselect);
ini_close();
