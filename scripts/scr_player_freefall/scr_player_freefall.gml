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
	    vsp += 1;
	
	move = key_left + key_right;
	
	if (!grounded)
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
	    
	    if (move != 0)
	        xscale = move;
	}
	
	if (vsp > 0)
	    freefallsmash += 0.5;
	
	if (freefallsmash > 10 && !instance_exists(obj_superslameffect))
	    instance_create(x, y, obj_superslameffect);
	
	if (grounded && !place_meeting(x, y + 1, obj_destructibles) && vsp > 0)
	{
	    if (!scr_slope())
	    {
	        scr_soundeffect(sfx_groundpound);
	        freefallsmash = 0;
	        
	        if (sprite_index != spr_poundcancel1)
	        {
	            if (shotgunAnim == 0)
	                sprite_index = spr_bodyslamland;
	            else
	                sprite_index = spr_player_shotgunjump2;
	        }
	        
	        if (sprite_index == spr_poundcancel1)
	            sprite_index = spr_poundcancel2;
	        
	        image_index = 0;
	        state = 76;
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
	        
	        with (instance_create(x, y, obj_landcloud))
	            sprite_index = spr_groundpoundeffect;
	        
	        freefallstart = 0;
	    }
	    else
	    {
	        with (instance_place(x, y + 1, obj_slope))
	            other.xscale = -sign(image_xscale);
	        
	        with (instance_create(x, y, obj_dashcloud))
	            image_xscale = other.xscale;
	        
	        sprite_index = spr_crouchslip;
	        
	        if (character == "P")
	            machhitAnim = 0;
	        
	        state = 67;
	        mach2 = 35;
	        var _speed = 0;
	        _speed = vsp / 1.5;
	        
	        if (_speed < 12)
	            _speed = 12;
	        
	        if (_speed > 24)
	            _speed = 24;
	        
	        movespeed = _speed;
	    }
	}
	
	image_speed = 0.35;
}
