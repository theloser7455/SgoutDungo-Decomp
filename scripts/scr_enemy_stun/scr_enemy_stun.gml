function scr_enemy_stun()
{
	if (object_index == obj_ninja)
	    attack = 1;
	
	if (!thrown)
	    stunned--;
	
	sprite_index = stunfallspr;
	
	if (thrown)
	{
	    sprite_index = spr_dead;
	    hsp = throwhsp;
	    
	    if (upthrow)
	        vsp = throwvsp;
	}
	
	image_speed = 0.35;
	
	if (((grounded || (grounded && !place_meeting(x, y, obj_platform))) && vsp > 0) || (scr_solid(x + 1, y) && !place_meeting(x + 1, y, obj_destructibles) && !place_meeting(x + 1, y, obj_slope)) || (scr_solid(x - 1, y) && !(place_meeting(x - 1, y, obj_slope) && !place_meeting(x - 1, y, obj_destructibles))) || (scr_solid(x, y - 1) && upthrow && !place_meeting(x, y - 1, obj_destructibles)))
	{
	    if (thrown == 1)
	    {
	        if (!bounce)
	        {
	            with (instance_create(x, y, obj_bangeffect))
	                sprite_index = spr_parryeffect;
	            
	            with (instance_create(x, y, obj_bangeffect))
	                sprite_index = spr_kungfueffect;
	        }
	        else
	        {
	            bounce--;
	            vsp = -10;
	            
	            if (scr_solid(x - 1, y) || scr_solid(x + 1, y))
	                throwhsp *= -1;
	            
	            if (scr_solid(x, y - 1))
	                vsp = 10;
	            
	            instance_create(x, y, obj_bangeffect);
	        }
	    }
	    
	    if (!bounce)
	    {
	        thrown = 0;
	        upthrow = 0;
	    }
	    
	    if (hp <= 0)
	        instance_destroy(id);
	    
	    grav = 0.5;
	    hsp = 0;
	}
	
	if (place_meeting(x, y + 1, obj_railh))
	    hsp = -5;
	else if (place_meeting(x, y + 1, obj_railh2))
	    hsp = 5;
	
	if (place_meeting(x - image_xscale, y, obj_solid) && !place_meeting(x - image_xscale, y, obj_destructibles))
	{
	    with (instance_create(x, y, obj_bulletimpact))
	        image_xscale = -other.image_xscale;
	    
	    if (thrown == 1)
	    {
	        if (!bounce)
	        {
	            hp -= 1;
	        }
	        else
	        {
	            bounce--;
	            vsp = -10;
	            
	            if (scr_solid(x - 1, y) || scr_solid(x + 1, y))
	                throwhsp *= -1;
	            
	            if (scr_solid(x, y - 1))
	                vsp = 10;
	            
	            instance_create(x, y, obj_bangeffect);
	        }
	    }
	    
	    if (!bounce)
	        thrown = 0;
	    
	    grav = 0.5;
	    image_xscale *= -1;
	    
	    if (hp <= 0)
	        instance_destroy(id);
	}
	
	if (floor(image_index) == (image_number - 1) && stunned < 0)
	{
	    if (object_index != obj_ancho && object_index != obj_pizzaboy)
	        vsp = -4;
	    else
	        vsp = 0;
	    
	    image_index = 0;
	    sprite_index = walkspr;
	    state = states.uppercut;
	    movespeed = 2;
	}
}
