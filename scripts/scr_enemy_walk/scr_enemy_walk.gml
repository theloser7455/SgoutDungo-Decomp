function scr_enemy_walk()
{
	if (grounded && !place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
	    hsp = image_xscale * (movespeed + statusspeed);
	else if (grounded && place_meeting(x, y + 1, obj_railh))
	    hsp = (image_xscale * (movespeed + statusspeed)) - 5;
	else if (grounded && place_meeting(x, y + 1, obj_railh2))
	    hsp = (image_xscale * (movespeed + statusspeed)) + 5;
	else if (object_index != obj_ancho)
	    hsp = 0;
	
	if (object_index == obj_rubin)
	{
	    hsp = Approach(hsp, 0, 4);
	    vsp = Approach(vsp, 0, grav);
	}
	
	sprite_index = walkspr;
	image_speed = 0.35;
	
	if ((scr_solid(x + 1, y) && sign(hsp) == 1) || (scr_solid(x - 1, y) && sign(hsp) == -1) || place_meeting(x + hsp, y, obj_hallway))
	{
	    if (!place_meeting(x + sign(hsp), y, obj_slope))
	    {
	        if (object_index == obj_forknight)
	        {
	            image_xscale *= -1;
	            image_index = 0;
	            sprite_index = spr_forknight_turn;
	            state = 92;
	        }
	        else
	        {
	            image_xscale *= -1;
	        }
	    }
	}
	
	if (object_index != obj_ancho)
	{
	    if (!(scr_solid(x + (sign(hsp) * 15), y + 31) || place_meeting(x + (sign(hsp) * 15), y + 31, obj_platform)))
	    {
	        if (movespeed > 0 && grounded)
	        {
	            if (object_index == obj_ninja)
	            {
	                vsp = -11;
	                image_index = 0;
	                image_xscale = -sign(x - obj_player.x);
	                state = 94;
	            }
	            else if (object_index == obj_forknight)
	            {
	                image_xscale *= -1;
	                image_index = 0;
	                sprite_index = spr_forknight_turn;
	                state = 92;
	            }
	            else
	            {
	                image_xscale *= -1;
	            }
	        }
	    }
	}
}
