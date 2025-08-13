function scr_player_handstandjump()
{
	landAnim = 0;
	hsp = xscale * movespeed;
	move = key_left + key_right;
	momemtum = 1;
	dir = xscale;
	
	if (movespeed < 10 && grounded)
	    movespeed += 0.5;
	
	if (character == "V" && key_slap2)
	{
	    with (instance_create(x, y, obj_shotgunbullet))
	    {
	        spd = other.xscale * 25;
	        phasing = 1;
	    }
	    
	    with (instance_create(x, y, obj_bangeffect))
	        sprite_index = spr_pistoleffect;
	    
	    if (!grounded)
	        vsp = -5;
	    
	    key_slap2 = 0;
	    image_index = 0;
	}
	
	if (character != "P")
	{
	    if (floor(image_index) == (image_number - 1) && !key_attack && vsp >= 0)
	    {
	        image_speed = 0.35;
	        state = states.normal;
	        grav = 0.5;
	    }
	    
	    if (floor(image_index) == (image_number - 1) && key_attack)
	    {
	        image_speed = 0.35;
	        state = states.mach2;
	        
	        if (character == "R")
	        {
	            state = states.stupidratroll;
	            scr_soundeffect(turnintoball);
	        }
	        
	        grav = 0.5;
	    }
	}
	
	if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
	    vsp /= 10;
	    jumpstop = 1;
	}
	
	if (move != xscale && move != 0)
	    state = states.normal;
	
	if (character == "P")
	{
	    if ((floor(image_index) == (image_number - 1) || sprite_index == spr_player_suplexgrabjump || sprite_index == spr_player_suplexgrabjumpstart) && grounded && !key_attack && vsp > 0)
	    {
	        image_speed = 0.35;
	        state = states.normal;
	        grav = 0.5;
	    }
	    
	    if ((floor(image_index) == (image_number - 1) || sprite_index == spr_player_suplexgrabjump || sprite_index == spr_player_suplexgrabjumpstart) && grounded && key_attack)
	    {
	        image_speed = 0.35;
	        state = states.mach2;
	        grav = 0.5;
	    }
	    
	    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_suplexgrabjumpstart)
	        sprite_index = spr_player_suplexgrabjump;
	    
	    if (!grounded && (sprite_index == spr_player_suplexdash || sprite_index == spr_shotgun_suplexdash))
	    {
	        image_index = 0;
	        sprite_index = spr_player_suplexgrabjumpstart;
	    }
	    
	    if (grounded && input_buffer_jump < 8)
	    {
	        image_index = 0;
	        sprite_index = spr_player_suplexgrabjumpstart;
	        scr_soundeffect(jumpsound);
	        instance_create(x, y, obj_highjumpcloud2);
	        vsp = -11;
	    }
	}
	
	if (key_down && grounded && vsp >= 0 && character != "R")
	{
	    instance_create(x, y, obj_jumpdust);
	    grav = 0.5;
	    sprite_index = spr_crouchslip;
	    
	    if (character == "P")
	        machhitAnim = 0;
	    
	    state = states.crouchslide;
	    mach2 = 0;
	    
	    if (movespeed <= 15)
	        movespeed = 15;
	}
	
	if (key_jump)
	    input_buffer_jump = 0;
	
	if (scr_solid(x + 1, y) && xscale == 1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + xscale, y, obj_destructibles))
	{
	    var a = 0;
	    
	    if (!scr_solid(x + sign(hsp), y - 32))
	    {
	        a = 1;
	        
	        if (scr_solid(x + sign(hsp), y - 33))
	            a = 0;
	    }
	    
	    if (character != "R")
	    {
	        if (grounded)
	        {
	            if (!a)
	            {
	                scr_soundeffect(sfx_bumpwall);
	                grav = 0.5;
	                movespeed = 0;
	                state = states.bump;
	                hsp = 0;
	                vsp = -5;
	                mach2 = 0;
	                image_index = 0;
	                machslideAnim = 1;
	                machhitAnim = 0;
	                sprite_index = suplexdashbump;
	                instance_create(x + 10, y + 10, obj_bumpeffect);
	            }
	            else
	            {
	                y -= 32;
	            }
	        }
	        else
	        {
	            state = states.mach2;
	        }
	    }
	    else if (!a)
	    {
	        scr_soundeffect(sfx_bumpwall);
	        grav = 0.5;
	        movespeed = 0;
	        state = states.bump;
	        hsp = 0;
	        vsp = -5;
	        mach2 = 0;
	        image_index = 0;
	        machslideAnim = 1;
	        machhitAnim = 0;
	        sprite_index = suplexdashbump;
	        instance_create(x + 10, y + 10, obj_bumpeffect);
	    }
	    else
	    {
	        y -= 32;
	    }
	}
	
	if (scr_solid(x - 1, y) && xscale == -1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + xscale, y, obj_destructibles))
	{
	    var a = 0;
	    
	    if (!scr_solid(x + sign(hsp), y - 32))
	    {
	        a = 1;
	        
	        if (scr_solid(x + sign(hsp), y - 33))
	            a = 0;
	    }
	    
	    if (character != "R")
	    {
	        if (grounded)
	        {
	            if (!a)
	            {
	                scr_soundeffect(sfx_bumpwall);
	                grav = 0.5;
	                movespeed = 0;
	                state = states.bump;
	                hsp = 0;
	                vsp = -5;
	                mach2 = 0;
	                sprite_index = suplexdashbump;
	                image_index = 0;
	                machslideAnim = 1;
	                machhitAnim = 0;
	                instance_create(x - 10, y + 10, obj_bumpeffect);
	            }
	            else
	            {
	                y -= 32;
	            }
	        }
	        else
	        {
	            state = states.mach2;
	        }
	    }
	    else if (!a)
	    {
	        scr_soundeffect(sfx_bumpwall);
	        grav = 0.5;
	        movespeed = 0;
	        state = states.bump;
	        hsp = 0;
	        vsp = -5;
	        mach2 = 0;
	        sprite_index = suplexdashbump;
	        image_index = 0;
	        machslideAnim = 1;
	        machhitAnim = 0;
	        instance_create(x - 10, y + 10, obj_bumpeffect);
	    }
	    else
	    {
	        y -= 32;
	    }
	}
	
	if (!instance_exists(obj_slidecloud) && grounded && movespeed > 5)
	{
	    with (instance_create(x, y, obj_slidecloud))
	        image_xscale = other.xscale;
	}
	
	if (key_jump2 && grounded && character != "R")
	{
	    state = states.mach2;
	    vsp = -11;
	    
	    if (movespeed < 12)
	        movespeed = 12;
	    
	    instance_create(x, y, obj_highjumpcloud2);
	    scr_soundeffect(jumpsound);
	    
	    if (audio_is_playing(jumpsound))
	        audio_stop_sound(jumpsound);
	    
	    sprite_index = spr_longjump1;
	    image_index = 0;
	}
	
	image_speed = 0.35;
}
