function scr_player_freefall()
{
	landAnim = 1;
	
	if (floor(image_index) == (image_number - 1) && (sprite_index == spr_bodyslamstart || sprite_index == spr_player_shotgunjump1))
	{
	    if (shotgunAnim == 0)
	        sprite_index = spr_bodyslamfall;
	    else
	        sprite_index = spr_player_shotgunjump3;
	}
	
	if (vsp > 0)
	    vsp += 0.5;
	
	move = key_left + key_right;
	
	if (!grounded)
	{
	    if (sprite_index != spr_mach2jump)
	    {
	        if (!momemtum)
	        {
	            hsp = Approach(hsp, move * 8, 2);
	        }
	        else
	        {
	            hsp = movespeed * xscale;
	            
	            if (scr_solid(x + sign(hsp), y) || move == -xscale)
	                momemtum = 0;
	        }
	    }
	    else
	    {
	        hsp = 0;
	    }
	    
	    if (move != 0)
	        xscale = move;
	}
	
	if (vsp > 0)
	    freefallsmash += 0.5;
	
	if (freefallsmash > 10)
	{
	    if (!instance_exists(obj_superslameffect))
	        instance_create(x, y, obj_superslameffect);
	    
	    if (!instance_exists(obj_crazyrunothereffect))
	    {
	        with (instance_create(x, y, obj_crazyrunothereffect))
	            image_angle = 90;
	    }
	}
	
	if (grounded && !place_meeting(x, y + 1, obj_destructibles) && vsp > 0)
	{
	    if (!scr_slope())
	    {
	        scr_soundeffect(sfx_groundpound);
	        freefallsmash = 0;
	        
	        if (sprite_index != spr_mach2jump)
	        {
	            if (sprite_index != spr_poundcancel1)
	            {
	                if (shotgunAnim == 0)
	                    sprite_index = spr_bodyslamland;
	                else
	                    sprite_index = spr_player_shotgunjump2;
	            }
	            
	            if (sprite_index == spr_poundcancel1)
	                sprite_index = spr_poundcancel2;
	        }
	        
	        image_index = 0;
	        state = states.freefallland;
	        jumpAnim = 1;
	        jumpstop = 0;
	        
	        with (obj_baddie)
	        {
	            if (grounded && point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), __view_get(0, 0) + __view_get(2, 0), __view_get(1, 0) + __view_get(3, 0)))
	            {
	                vsp = -11;
	                hsp = 0;
	            }
	        }
	        
	        with (obj_camera)
	        {
	            shake_mag = 10;
	            shake_mag_acc = 30 / room_speed;
	        }
	        
	        combo = 0;
	        bounce = 0;
	        
	        with (instance_create(x, y + 2, obj_landcloud))
	            sprite_index = spr_groundpoundeffect;
	        
	        with (instance_place(x, y, obj_snick))
	        {
	            if (object_index == obj_snick)
	            {
	                if (image_xscale > 0)
	                    image_xscale += 0.5;
	                else
	                    image_xscale -= 0.5;
	            }
	        }
	        
	        freefallstart = 0;
	    }
	    else
	    {
	        if (sprite_index != spr_mach2jump)
	        {
	            with (instance_place(x, y + 1, obj_slope))
	                other.xscale = -sign(image_xscale);
	        }
	        
	        with (instance_create(x, y, obj_dashcloud))
	            image_xscale = other.xscale;
	        
	        if (sprite_index != spr_mach2jump)
	            sprite_index = spr_crouchslip;
	        
	        if (character == "P")
	            machhitAnim = 0;
	        
	        state = states.crouchslide;
	        mach2 = 35;
	        var _speed = 0;
	        _speed = vsp / 1.5;
	        
	        if (_speed < 12)
	            _speed = 12;
	        
	        if (_speed > 24)
	            _speed = 24;
	        
	        movespeed = _speed;
	    }
	    
	    if (character == "V" && sprite_index == spr_mach2jump)
	    {
	        instance_create(x, y, obj_jumpdust);
	        flash = 0;
	        state = states.mach2;
	        
	        if (!key_down)
	            vsp = -5;
	        
	        jumpstop = 1;
	        grounded = 0;
	        hsp = movespeed * xscale;
	        
	        with (instance_create(x, y, obj_bangeffect))
	            sprite_index = spr_bombexplosion;
	        
	        scr_soundeffect(sfx_explosion);
	    }
	}
	
	if (key_slap2 && character == "S")
	{
	    scr_soundeffect(choose(sfx_snickglitchnew, sfx_snickglitchnew2, sfx_snickglitchnew3, sfx_snickglitchnew4));
	    
	    if (movespeed < 12)
	        movespeed = 12;
	    
	    tauntstoredvsp = hsp;
	    tauntstoredhsp = vsp;
	    hsp = 0;
	    vsp = 0;
	    tpcd = 0;
	    tph = 60 * xscale;
	    tpv = 0;
	    tptimes = 4;
	    tauntstoredstate = 0;
	    tauntstoredsprite = sprite_index;
	    tauntstoredmovespeed = movespeed + 4;
	    sprite_index = spr_secondjump2;
	    
	    if (key_down)
	    {
	        tph = 0;
	        tpv = 60;
	    }
	    
	    state = states.snicktp;
	}
	
	image_speed = 0.35;
}
