function scr_playerpepperman_mach()
{
	move = key_left + key_right;
	
	if (sprite_index == spr_Proll)
	    image_speed = movespeed / 10;
	else
	    image_speed = 0.35;
	
	if (sprite_index != spr_Pmachstart)
	{
	    hsp = movespeed * xscale;
	    
	    if (movespeed < 20)
	        movespeed += 0.05;
	    
	    if (movespeed > 20)
	        sprite_index = spr_Proll;
	    
	    with (instance_place(x, y + 1, obj_slope))
	    {
	        if (other.xscale == -sign(image_xscale))
	        {
	            other.movespeed += 0.25;
	            
	            if (image_xscale > 0 && image_xscale < 2)
	                other.movespeed += 0.375;
	        }
	    }
	}
	else
	{
	    hsp = 2 * xscale;
	}
	
	if (move == -xscale && grounded)
	{
	    scr_soundeffect(machslidesound);
	    image_index = 0;
	    state = states.machslide;
	    sprite_index = spr_Pturn;
	}
	
	if (!key_attack && grounded)
	{
	    image_index = 0;
	    state = states.machslide;
	    scr_soundeffect(machturnsound);
	    sprite_index = spr_Pstop;
	}
	
	var a = 0;
	
	if (!scr_solid(x + sign(hsp), y - 32))
	{
	    a = 1;
	    
	    if (scr_solid(x + sign(hsp), y - 33))
	        a = 0;
	}
	
	if ((scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_metalblock) && movespeed <= 20) || (scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_metalblock) && !place_meeting(x + sign(hsp), y, obj_heavyblock) && movespeed > 20))
	{
	    if (!a)
	    {
	        sprite_index = spr_Pmachhitwall;
	        scr_soundeffect(sfx_groundpound);
	        scr_soundeffect(sfx_bumpwall);
	        
	        with (obj_camera)
	        {
	            shake_mag = 20;
	            shake_mag_acc = 40 / room_speed;
	        }
	        
	        hsp = 0;
	        image_speed = 0.35;
	        
	        with (obj_baddie)
	        {
	            if (point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), __view_get(0, 0) + __view_get(2, 0), __view_get(1, 0) + __view_get(3, 0)))
	            {
	                stun = 1;
	                alarm[0] = 200;
	                ministun = 0;
	                vsp = -5;
	                hsp = 0;
	            }
	        }
	        
	        flash = 0;
	        state = states.bump;
	        hsp = -2.5 * xscale;
	        vsp = -3;
	        mach2 = 0;
	        image_index = 0;
	        instance_create(x + 10, y + 10, obj_bumpeffect);
	    }
	    else
	    {
	        y -= 32;
	    }
	}
	
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_Pmachstart)
	    sprite_index = spr_Pmach;
	
	if (key_jump && grounded)
	{
	    scr_soundeffect(sfx_jump);
	    vsp = -11;
	}
	
	if (key_down && !grounded)
	{
	    state = states.playerpeppermangroundpound;
	    image_index = 0;
	    sprite_index = spr_Pslamstart;
	    vsp = -5;
	}
	
	if (movespeed > 20)
	{
	    with (instance_place(x + hsp, y, obj_heavyblock))
	        instance_destroy();
	}
}
