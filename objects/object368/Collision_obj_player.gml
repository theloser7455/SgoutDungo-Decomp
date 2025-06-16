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
        
        switch (character)
        {
            case "P":
                if (paletteselect > 9)
                    paletteselect = 0;
                
                break;
            
            case "N":
                if (paletteselect > 7)
                    paletteselect = 0;
                
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
        
        switch (character)
        {
            case "P":
                if (paletteselect < 0)
                    paletteselect = 9;
                
                break;
            
            case "N":
                if (paletteselect < 0)
                    paletteselect = 7;
                
                break;
        }
        
        scr_soundeffect(sfx_stompenemy);
    }
}
