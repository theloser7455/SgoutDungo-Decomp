function scr_hurttheplayer()
{
	if ((state == 23 || state == 24 || state == 17) && cutscene == 0)
	{
	}
	
	if (character == "TERRENCE")
	{
	}
	else if (instance_exists(obj_fadeout))
	{
	}
	else if (state == 26 && hurted == 0)
	{
	}
	else if (state == 14)
	{
	}
	else if (state == 1)
	{
	}
	else if (place_meeting(x, y, obj_parryhitbox))
	{
	}
	else if (state == 1670 && sprite_index != spr_playerN_noisebombkick)
	{
	}
	else if (state == 12 || state == 13)
	{
	}
	else if (state != 72 && hurted == 0 && cutscene == 0 && state != 71)
	{
	    with (other)
	    {
	        if (object_index == obj_littlenoisegremlin)
	        {
	            if (instance_exists(obj_tv))
	            {
	                obj_tv.message = name + " GAVE YOU AN ASS WHOOPING!";
	                obj_tv.showtext = 1;
	                obj_tv.alarm[0] = 150;
	            }
	        }
	    }
	    
	    if (character != "R")
	    {
	        scr_soundeffect(sfx_pephurt);
	    }
	    else
	    {
	        var hurtsound = choose(100, 101, 102, 103, 104);
	        scr_soundeffect(hurtsound);
	    }
	    
	    if (character == "N" && paletteselect == 6)
	        scr_soundeffect(sfx_bluu3);
	    
	    alarm[8] = 60;
	    alarm[7] = 120;
	    hurted = 1;
	    squished = 0;
	    
	    if (xscale == other.image_xscale)
	        sprite_index = spr_hurtjump;
	    else
	        sprite_index = spr_hurt;
	    
	    if (pepperplay)
	        sprite_index = spr_Phurt;
	    
	    movespeed = 8;
	    vsp = -5;
	    timeuntilhpback = 300;
	    instance_create(x, y, obj_spikehurteffect);
	    state = 72;
	    image_index = 0;
	    flash = 1;
	    global.hurtcounter += 1;
	    
	    if (global.collect > 50)
	        global.collect -= 50;
	    else
	        global.collect = 0;
	    
	    global.combotime -= 30;
	    
	    if (global.combotime < 0)
	        global.combotime = 0;
	    
	    with (instance_create(x + random_range(64, -64), y + random_range(64, -64), obj_negativenumber))
	        number = -50;
	}
}
