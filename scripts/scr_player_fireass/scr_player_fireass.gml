function scr_player_fireass()
{
	image_speed = 0.35;
	
	if (place_meeting(x + hsp, y, obj_solid))
	    image_xscale *= -1;
	
	if (sprite_index == spr_fireass)
	{
	    if (floor(image_index) == (image_number - 1))
	    {
	        with (instance_create(x, y + 25, obj_balloonpop))
	            sprite_index = spr_shotgunimpact;
	    }
	    
	    move = key_left + key_right;
	    
	    if (move != 0)
	        xscale = move;
	    
	    hsp = Approach(hsp, move * 8, 0.5);
	    movespeed = 4;
	    
	    if (place_meeting(x, y + 1, obj_haystack))
	    {
	        vsp = -20;
	    }
	    else if (grounded && vsp > 0)
	    {
	        movespeed = 6;
	        sprite_index = spr_fireassground;
	        image_index = 0;
	        
	        with (instance_create(x, y, obj_jumpdust))
	        {
	            image_xscale = other.xscale;
	            var chance = round(random_range(100, 0));
	            
	            if (chance == 100)
	            {
	                image_blend = c_lime;
	                scr_soundeffect(fartie);
	            }
	        }
	    }
	}
	
	if (sprite_index == spr_fireassground)
	{
	    hsp = xscale * movespeed;
	    
	    if (movespeed > 0)
	        movespeed -= 0.25;
	    
	    if (floor(image_index) == (image_number - 1) || place_meeting(x + xscale, y, obj_solid))
	    {
	        scr_soundeffect(sfx_fireassend);
	        movespeed = 0;
	        landAnim = 0;
	        alarm[5] = 2;
	        alarm[7] = 60;
	        hurted = 1;
	        state = 0;
	        sprite_index = spr_idle;
	        image_index = 0;
	    }
	}
	
	if (sprite_index == spr_fireassend)
	{
	    movespeed = 0;
	    landAnim = 0;
	    alarm[5] = 2;
	    alarm[7] = 60;
	    hurted = 1;
	    state = 0;
	    sprite_index = spr_idle;
	    image_index = 0;
	}
}
