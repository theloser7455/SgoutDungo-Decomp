function scr_player_mach3()
{
	if (character == "P")
	{
	    if (windingAnim < 2000)
	        windingAnim++;
	}
	
	if (movespeed < 0)
	    movespeed *= -1;
	
	if (movespeed >= 7 && !instance_exists(obj_speedlines))
	    instance_create(x, y, obj_speedlines);
	
	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
	    hsp = xscale * movespeed;
	else if (place_meeting(x, y + 1, obj_railh))
	    hsp = (xscale * movespeed) - 5;
	else if (place_meeting(x, y + 1, obj_railh2))
	    hsp = (xscale * movespeed) + 5;
	
	mach2 = 100;
	momemtum = 1;
	move = key_right + key_left;
	move2 = key_right2 + key_left2;
	
	if (movespeed < 24 && move == xscale && grounded)
	{
	    movespeed += 0.1;
	    
	    if (!instance_exists(obj_crazyruneffect))
	        instance_create(x, y, obj_crazyruneffect);
	}
	
	crouchslideAnim = 1;
	
	if (!key_jump2 && jumpstop == 0 && vsp < 0.5)
	{
	    vsp /= 10;
	    jumpstop = 1;
	}
	
	if (grounded && vsp > 0)
	    jumpstop = 0;
	
	if (input_buffer_jump < 8 && grounded && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1))
	{
	    scr_soundeffect(jumpsound);
	    image_index = 0;
	    
	    if (sprite_index != spr_SjumpcancelPEAKend)
	        sprite_index = spr_mach3jump;
	    
	    vsp = -11;
	}
	
	if (sprite_index == spr_mach3jump && floor(image_index) == (image_number - 1))
	    sprite_index = spr_mach4;
	
	if (floor(image_index) == (image_number - 1) && (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit))
	    sprite_index = spr_mach4;
	
	if ((sprite_index == spr_mach2jump || sprite_index == spr_player_Sjumpcancel) && grounded && vsp > 0)
	    sprite_index = spr_mach4;
	
	if (movespeed > 20 && sprite_index != spr_crazyrun)
	{
	    flash = 1;
	    sprite_index = spr_crazyrun;
	}
	
	if (sprite_index == spr_crazyrun && mach4flame <= 0)
	{
	    with (instance_create(x, y, obj_bangeffect))
	        sprite_index = spr_flamecloud;
	    
	    mach4flame = 10;
	}
	else if (movespeed <= 20 && sprite_index == spr_crazyrun)
	{
	    sprite_index = spr_mach4;
	}
	
	if (sprite_index == spr_player_crazyrun && !instance_exists(obj_crazyrunothereffect))
	    instance_create(x, y, obj_crazyrunothereffect);
	
	if (sprite_index == spr_mach4)
	    image_speed = 0.4;
	
	if (sprite_index == spr_crazyrun)
	    image_speed = 0.75;
	
	if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit)
	    image_speed = 0.4;
	
	if (key_jump)
	    input_buffer_jump = 0;
	
	if (key_up && grounded)
	{
	    sprite_index = spr_superjumpprep;
	    state = states.Sjumpprep;
	    hsp = 0;
	    image_index = 0;
	}
	
	if (!key_attack && grounded)
	{
	    sprite_index = spr_machslidestart;
	    scr_soundeffect(machturnsound);
	    state = states.machslide;
	    image_index = 0;
	}
	
	if ((move == -xscale && grounded) && !key_down)
	{
	    scr_soundeffect(machslidesound);
	    sprite_index = spr_machslideboost3;
	    state = states.machslide;
	    image_index = 0;
	}
	
	if ((key_down && !place_meeting(x, y, obj_dashpad) && character != "S") || (key_down && !place_meeting(x, y, obj_dashpad) && character == "S" && !grounded))
	{
	    instance_create(x, y, obj_jumpdust);
	    flash = 0;
	    state = states.machroll;
	    vsp = 10;
	    
	    if (character == "N" && !grounded)
	    {
	        state = states.wallbounce;
	        sprite_index = spr_playerN_divebombfall;
	        vsp = 20;
	    }
	}
	
	if ((!grounded || scr_slope()) && place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x + sign(hsp), y, obj_metalblock) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
	    var a = 0;
	    
	    if (!scr_solid(x + sign(hsp), y - 32))
	    {
	        a = 1;
	        
	        if (scr_solid(x + sign(hsp), y - 32))
	            a = 0;
	    }
	    
	    if (character != "N")
	    {
	        wallspeed = movespeed;
	        state = states.climbwall;
	    }
	    else if (!a)
	    {
	        wallspeed = movespeed;
	        state = states.climbwall;
	    }
	    else
	    {
	        y -= 32;
	    }
	}
	
	if (scr_solid(x + 1, y) && xscale == 1 && !scr_slope() && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_metalblock) && !place_meeting(x + sign(hsp), y, obj_destructibles) && grounded)
	{
	    var a = 0;
	    
	    if (!scr_solid(x + sign(hsp), y - 32))
	    {
	        a = 1;
	        
	        if (scr_solid(x + sign(hsp), y - 33))
	            a = 0;
	    }
	    
	    if (!a)
	    {
	        sprite_index = spr_hitwall;
	        scr_soundeffect(sfx_groundpound);
	        scr_soundeffect(sfx_bumpwall);
	        
	        if (movespeed > 26)
	        {
	            with (instance_create(x, y, obj_bangeffect))
	            {
	                image_xscale = 1 + (other.movespeed / 26);
	                image_yscale = 1 + (other.movespeed / 26);
	                sprite_index = spr_bombexplosion;
	                scr_soundeffect(sfx_bombpepexplode);
	            }
	            
	            with (obj_camera)
	            {
	                shake_mag = other.movespeed;
	                shake_mag_acc = 40 / room_speed;
	            }
	        }
	        
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
	        hsp = -2.5;
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
	
	if (scr_solid(x - 1, y) && xscale == -1 && !scr_slope() && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_metalblock) && !place_meeting(x + sign(hsp), y, obj_destructibles) && grounded)
	{
	    var a = 0;
	    
	    if (!scr_solid(x + sign(hsp), y - 32))
	    {
	        a = 1;
	        
	        if (scr_solid(x + sign(hsp), y - 33))
	            a = 0;
	    }
	    
	    if (!a)
	    {
	        if (movespeed > 26)
	        {
	            with (instance_create(x, y, obj_bangeffect))
	            {
	                image_xscale = 1 + (other.movespeed / 26);
	                image_yscale = 1 + (other.movespeed / 26);
	                sprite_index = spr_bombexplosion;
	                scr_soundeffect(sfx_bombpepexplode);
	            }
	        }
	        
	        sprite_index = spr_hitwall;
	        scr_soundeffect(sfx_groundpound);
	        scr_soundeffect(sfx_bumpwall);
	        
	        with (obj_camera)
	        {
	            shake_mag = 20;
	            shake_mag_acc = 40 / room_speed;
	        }
	        
	        hsp = 0;
	        image_speed = 0.35;
	        flash = 0;
	        state = states.bump;
	        hsp = 2.5;
	        vsp = -3;
	        mach2 = 0;
	        image_index = 0;
	        instance_create(x - 10, y + 10, obj_bumpeffect);
	    }
	    else
	    {
	        y -= 32;
	    }
	}
	
	if (!instance_exists(obj_chargeeffect))
	    instance_create(x, y, obj_chargeeffect);
	
	if (!instance_exists(obj_superdashcloud) && grounded)
	    instance_create(x, y, obj_superdashcloud);
	
	if (key_jump && key_up && !grounded)
	{
	    if (character == "N")
	    {
	        state = states.Ncrusher;
	        sprite_index = spr_playerN_noisecrusherstart;
	        image_index = 0;
	        vsp = -16;
	        scr_soundeffect(sfx_noisedoublejumper);
	        dir = xscale;
	    }
	    
	    if (character == "V")
	    {
	        state = states.wallbounce;
	        
	        with (instance_create(x, y, obj_bangeffect))
	            sprite_index = spr_noisewalljumpeffect;
	        
	        scr_soundeffect(sfx_spin);
	    }
	}
}
