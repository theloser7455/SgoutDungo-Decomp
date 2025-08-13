function scr_enemy_charge()
{
	if (object_index == obj_peasanto)
	{
	    if (grounded || (grounded && !place_meeting(x, y, obj_platform)))
	        hsp = image_xscale * (movespeed + statusspeed) * 4;
	    else
	        hsp = 0;
	    
	    image_speed = 0.35;
	    
	    if (((scr_solid(x + 1, y) && image_xscale == 1) || (scr_solid(x - 1, y) && image_xscale == -1)) && !place_meeting(x + sign(hsp), y, obj_slope))
	        image_xscale *= -1;
	    
	    if (!(scr_solid(x + 15, y + 31) || scr_solid(x + 15, y + 31)) && image_xscale == 1 && movespeed > 0)
	        image_xscale *= -1;
	    
	    if (!(scr_solid(x - 15, y + 31) || scr_solid(x - 15, y + 31)) && image_xscale == -1 && movespeed > 0)
	        image_xscale *= -1;
	    
	    if (!(grounded || (grounded && !place_meeting(x, y, obj_platform))) && hsp < 0)
	        hsp += 0.1;
	    else if (!(grounded || (grounded && !place_meeting(x, y, obj_platform))) && hsp > 0)
	        hsp -= 0.1;
	    
	    sprite_index = spr_peasanto_attack;
	}
	
	if (object_index == obj_pizzice)
	{
	    hsp = image_xscale * (movespeed + statusspeed);
	    image_speed = 0.35;
	    
	    if (((scr_solid(x + 1, y) && image_xscale == 1) || (scr_solid(x - 1, y) && image_xscale == -1)) && !place_meeting(x + sign(hsp), y, obj_slope))
	        image_xscale *= -1;
	    
	    sprite_index = spr_pizzice_walk;
	}
	
	if (object_index == obj_fencer)
	{
	    if (grounded || (grounded && !place_meeting(x, y, obj_platform)))
	        hsp = image_xscale * (movespeed + statusspeed);
	    else
	        hsp = 0;
	    
	    if (((scr_solid(x + 1, y) && image_xscale == 1) || (scr_solid(x - 1, y) && image_xscale == -1)) && !place_meeting(x + sign(hsp), y, obj_slope))
	        image_xscale *= -1;
	}
	
	if (object_index == obj_ancho)
	{
	    hsp = image_xscale * (movespeed + statusspeed);
	    
	    if (sprite_index == spr_ancho_chargestart)
	        hsp = 0;
	    
	    if (place_meeting(x + hsp, y, obj_solid))
	    {
	        state = states.enemystun;
	        stunned = 100;
	    }
	}
	
	if (object_index == obj_pepperman_lesser)
	{
	    image_speed = 0.35;
	    
	    if (sprite_index != spr_pepperman_shoulderstart)
	    {
	        hsp = (movespeed * image_xscale) + statusspeed;
	    }
	    else
	    {
	        hsp = (-5 * image_xscale) + statusspeed;
	        
	        if (floor(image_index) == (image_number - 1))
	            sprite_index = spr_pepperman_shoulderloop;
	    }
	    
	    if ((-sign(x - obj_player.x) == -image_xscale && turns > 0) && sprite_index != spr_pepperman_shoulderturn)
	    {
	        turns--;
	        sprite_index = spr_pepperman_shoulderturn;
	        image_index = 0;
	        scr_soundeffect(sfx_machslide);
	    }
	    
	    if (sprite_index == spr_pepperman_shoulderturn)
	    {
	        hsp = Approach(hsp, 0, 0.5);
	        image_speed = 0.35;
	        
	        if (floor(image_index) == (image_number - 1))
	        {
	            state = states.secondjump;
	            image_xscale *= -1;
	            sprite_index = spr_pepperman_shoulderloop;
	            
	            with (instance_create(x, y, obj_crazyrunothereffect))
	                image_xscale = other.image_xscale;
	            
	            movespeed = 18;
	            hsp = (movespeed * image_xscale) + statusspeed;
	        }
	    }
	    
	    if (scr_solid(x + sign(hsp), y) && sprite_index != spr_pepperman_shoulderstart && sprite_index != spr_pepperman_shoulderturn)
	    {
	        stunned = 100;
	        hsp = -5 * image_xscale;
	        state = states.enemystun;
	        vsp = -8;
	        sprite_index = spr_pepperman_shoulderhurtstart;
	        image_index = 0;
	        scr_soundeffect(sfx_groundpound);
	    }
	}
	
	if (object_index == obj_ninja)
	{
	    hsp = image_xscale * (movespeed + statusspeed) * 2;
	    image_speed = 0.35;
	    
	    if (grounded && vsp > 0)
	        state = states.uppercut;
	    
	    if (((scr_solid(x + 1, y) && image_xscale == 1) || (scr_solid(x - 1, y) && image_xscale == -1)) && !place_meeting(x + sign(hsp), y, obj_slope))
	        image_xscale *= -1;
	    
	    if (!(grounded || (grounded && !place_meeting(x, y, obj_platform))) && hsp < 0)
	        hsp += 0.1;
	    else if (!(grounded || (grounded && !place_meeting(x, y, obj_platform))) && hsp > 0)
	        hsp -= 0.1;
	    
	    sprite_index = spr_ninja_attack;
	}
}
