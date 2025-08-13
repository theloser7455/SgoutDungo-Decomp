function scr_player_kungfu()
{
	image_speed = 0.35;
	move = key_left + key_right;
	hsp = xscale * movespeed;
	xscaleplus = lerp(xscaleplus, 0, 0.0625);
	
	if (key_down && vsp < 30)
	{
	    vsp += 10;
	    yscaleplus = lerp(yscaleplus, 2, 0.0625);
	    
	    if (grounded)
	        yscaleplus = 0;
	    
	    if (!instance_exists(obj_crazyrunothereffect) && !grounded)
	    {
	        with (instance_create(x, y, obj_crazyrunothereffect))
	            image_angle = 90;
	    }
	}
	
	if (!key_down)
	    yscaleplus = lerp(yscaleplus, 0, 0.0625);
	
	if (move == -xscale && movespeed > -12)
	    movespeed -= 1;
	
	if (move == xscale && movespeed < 12)
	    movespeed += 1;
	
	switch (sprite_index)
	{
	    case spr_player_kungfu1:
	    case spr_player_kungfu2:
	    case spr_player_kungfu3:
	        if (floor(image_index) == (image_number - 1))
	        {
	            movespeed = abs(movespeed);
	            state = states.normal;
	            
	            if (key_attack && movespeed > 6)
	                state = states.mach2;
	            
	            if (move != 0)
	                xscale = move;
	        }
	        
	        if (!grounded)
	            sprite_index = choose(spr_player_kungfuair1transition, spr_player_kungfuair2transition, spr_player_kungfuair3transition);
	        
	        break;
	    
	    default:
	        if (floor(image_index) == (image_number - 1))
	        {
	            switch (sprite_index)
	            {
	                case spr_player_kungfuair1transition:
	                    sprite_index = spr_player_kungfuair1;
	                    break;
	                
	                case spr_player_kungfuair2transition:
	                    sprite_index = spr_player_kungfuair2;
	                    break;
	                
	                case spr_player_kungfuair3transition:
	                    sprite_index = spr_player_kungfuair3;
	                    break;
	            }
	        }
	        
	        if (grounded && vsp > 0 && !place_meeting(x, y + 1, obj_metalblock))
	        {
	            movespeed = abs(movespeed);
	            state = states.normal;
	            
	            if (key_attack && movespeed > 6)
	                state = states.mach2;
	            
	            if (move != 0)
	                xscale = move;
	        }
	        
	        break;
	}
	
	var a = 0;
	
	if (!scr_solid(x + sign(hsp), y - 32) && grounded)
	{
	    a = 1;
	    
	    if (scr_solid(x + sign(hsp), y - 33))
	        a = 0;
	}
	
	if (!instance_exists(obj_slidecloud) && grounded && movespeed > 5)
	{
	    with (instance_create(x, y, obj_slidecloud))
	        image_xscale = other.xscale;
	}
	
	if (!instance_exists(obj_slidecloud) && grounded && movespeed < -5)
	{
	    with (instance_create(x, y, obj_slidecloud))
	        image_xscale = -other.xscale;
	}
	
	if (scr_solid(x + xscale, y) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_slope) && sprite_index != spr_player_kungfujump)
	{
	    if (!a)
	    {
	        if (movespeed < 48)
	            movespeed *= 1.1;
	        else
	            movespeed = 48;
	        
	        sprite_index = spr_player_kungfujump;
	        vsp = -3;
	        xscaleplus = 1;
	        instance_create(x + (32 * xscale), y, obj_bangeffect);
	        scr_soundeffect(sfx_bumpwall);
	        
	        if (paletteselect == 15 && !global.lamepalettes)
	            scr_soundeffect(choose(sfx_veg1, sfx_veg2, sfx_veg3, sfx_veg4));
	        
	        repeat (4)
	        {
	            with (instance_create(x, y, obj_slapstar))
	                hsp = other.hsp * random_range(0.5, 1.5);
	        }
	        
	        if (-movespeed > -12)
	            movespeed = -12;
	        else
	            movespeed *= -1;
	    }
	    else
	    {
	        y -= 32;
	    }
	}
}
