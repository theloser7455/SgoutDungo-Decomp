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
	
	if (object_index == obj_ancho)
	{
	    if (y > ystart && !scr_solid(x, y - 1))
	        y--;
	    
	    if (y < ystart && !scr_solid(x, y + 1))
	        y++;
	    
	    grav = 0;
	}
	
	if (((floor(image_index) == 8 && stepped) || (floor(image_index) == 4 && !stepped)) && grounded && hsp != 0)
	{
	    instance_create(x, bbox_bottom, obj_machalleffect);
	    stepped = 1;
	    
	    if (floor(image_index) == 8)
	        stepped = 0;
	}
	
	if (object_index == obj_pepperman_lesser)
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
	            state = states.snickmachstart;
	        }
	        else
	        {
	            image_xscale *= -1;
	        }
	    }
	}
	
	if (object_index != obj_ancho && object_index != obj_pepperman_lesser)
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
	                state = states.breakdanceattack;
	            }
	            else if (object_index == obj_forknight)
	            {
	                image_xscale *= -1;
	                image_index = 0;
	                sprite_index = spr_forknight_turn;
	                state = states.snickmachstart;
	            }
	            else
	            {
	                image_xscale *= -1;
	            }
	        }
	    }
	}
	
	if (object_index == obj_skibideh)
	{
	    if (flamez <= 0)
	    {
	        with (instance_create(x, y, obj_hellfireprojectile))
	        {
	            speed = random_range(1, 5);
	            direction = random_range(720, 0);
	            dmg = 3;
	        }
	        
	        flamez = 2;
	        scr_soundeffect(sfx_enemyprojectile);
	    }
	    
	    flamez--;
	}
}
