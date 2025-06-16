function scr_player_Sjump()
{
	if (character != "N" && character != "R")
	    hsp = 0;
	
	mach2 = 0;
	jumpAnim = 1;
	dashAnim = 1;
	landAnim = 0;
	moveAnim = 1;
	stopAnim = 1;
	crouchslideAnim = 1;
	crouchAnim = 0;
	machhitAnim = 0;
	move = key_left + key_right;
	
	if (character == "N" || character == "R")
	    hsp = Approach(hsp, move * 8, 4);
	
	if (sprite_index == spr_superjump)
	{
	    vsp = -15;
	    
	    if (character == "R")
	        vsp = -20;
	}
	
	if (sprite_index == spr_player_supersidejump)
	{
	    if (a < 25)
	        a++;
	    
	    hsp = xscale * a;
	    vsp = 0;
	}
	
	if (sprite_index == spr_player_Sjumpcancelstart || sprite_index == spr_SjumpcancelPEAK)
	{
	    vsp = 0;
	    hsp = 0;
	}
	
	if (scr_solid(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles))
	{
	    a = 0;
	    
	    if (sprite_index == spr_player_supersidejump)
	        sprite_index = spr_player_supersidejumpland;
	    
	    if (sprite_index == spr_superjump)
	        sprite_index = spr_superjumpland;
	    
	    with (obj_camera)
	    {
	        shake_mag = 10;
	        shake_mag_acc = 30 / room_speed;
	    }
	    
	    with (obj_baddie)
	    {
	        if (point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), __view_get(0, 0) + __view_get(2, 0), __view_get(1, 0) + __view_get(3, 0)))
	        {
	            image_index = 0;
	            
	            if (grounded)
	                vsp = -7;
	        }
	    }
	    
	    if (character != "R")
	        scr_soundeffect(sfx_groundpound);
	    else
	        scr_soundeffect(cheesestomp);
	    
	    image_index = 0;
	    state = 91;
	    machhitAnim = 0;
	}
	
	if ((key_attack2 || key_slap2) && sprite_index != spr_player_Sjumpcancelstart && sprite_index != spr_SjumpcancelPEAK)
	{
	    if (character != "P")
	    {
	        if (move != 0)
	            xscale = move;
	        
	        movespeed = 12;
	        machhitAnim = 0;
	        state = 89;
	        
	        if (character != "N")
	            flash = 1;
	        
	        sprite_index = spr_mach4;
	        instance_create(x, y, obj_jumpdust);
	        
	        if (character == "R")
	        {
	            state = 95;
	            scr_soundeffect(turnintoball);
	        }
	        
	        if (character == "N")
	        {
	            if (move != 0)
	                xscale = move;
	            
	            state = 69;
	            sprite_index = spr_playerN_sidewayspin;
	            scr_soundeffect(sfx_airspinstart);
	            image_index = 0;
	            jumpstop = 1;
	            vsp = -8;
	            key_slap2 = 0;
	            audio_stop_sound(sfx_airspinloop);
	            
	            with (instance_create(x, y, obj_crazyrunothereffect))
	                image_xscale = other.xscale;
	        }
	    }
	    else
	    {
	        scr_soundeffect(sfx_Sjumpcancel);
	        image_index = 0;
	        sprite_index = spr_player_Sjumpcancelstart;
	        
	        if (global.peakcancel)
	            sprite_index = spr_SjumpcancelPEAK;
	    }
	}
	
	if (sprite_index == spr_player_Sjumpcancelstart)
	{
	    if (move != 0)
	        xscale = move;
	    
	    if (floor(image_index) == (image_number - 1))
	    {
	        movespeed = 12;
	        machhitAnim = 0;
	        state = 89;
	        flash = 1;
	        vsp = -5;
	        jumpstop = 0;
	        sprite_index = spr_player_Sjumpcancel;
	        instance_create(x, y, obj_jumpdust);
	    }
	}
	
	if (sprite_index == spr_SjumpcancelPEAK)
	{
	    if (move != 0)
	        xscale = move;
	    
	    if (floor(image_index) == (image_number - 1))
	    {
	        movespeed = 12;
	        machhitAnim = 0;
	        state = 89;
	        flash = 1;
	        vsp = -5;
	        jumpstop = 0;
	        sprite_index = spr_SjumpcancelPEAKend;
	        instance_create(x, y, obj_jumpdust);
	    }
	}
	
	image_speed = 0.5;
	scr_collide_player();
}
