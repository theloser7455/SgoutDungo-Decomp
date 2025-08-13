function scr_playerN_crusher()
{
	move = key_left + key_right;
	hsp = Approach(hsp, move * 12, 1);
	
	if (move != 0)
	    dir = move;
	
	image_speed = 0.35;
	
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerN_noisecrusherstart)
	    sprite_index = spr_playerN_noisecrusherfall;
	
	if (vsp > 0)
	    vsp += 0.5;
	
	if (grounded && !place_meeting(x, y + 1, obj_destructibles) && vsp > 0 && !place_meeting(x, y + 1, obj_metalblock))
	{
	    scr_soundeffect(sfx_groundpound);
	    freefallsmash = 0;
	    sprite_index = spr_playerN_noisecrusherland;
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
	    
	    with (instance_create(x, y, obj_landcloud))
	    {
	        hspeed = 8;
	        sprite_index = spr_ratdust;
	        image_xscale = -1;
	    }
	    
	    with (instance_create(x, y, obj_landcloud))
	    {
	        hspeed = -8;
	        sprite_index = spr_ratdust;
	    }
	    
	    freefallstart = 0;
	    
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
	}
	
	if ((key_slap2 && !key_up) || key_attack2)
	{
	    state = states.mach2;
	    sprite_index = spr_playerN_sidewayspin;
	    scr_soundeffect(sfx_airspinstart);
	    image_index = 0;
	    jumpstop = 1;
	    
	    if (vsp > -8)
	        vsp = -8;
	    
	    key_slap2 = 0;
	    movespeed = 12;
	    audio_stop_sound(sfx_airspinloop);
	    xscale = dir;
	    
	    with (instance_create(x, y, obj_crazyrunothereffect))
	        image_xscale = other.xscale;
	}
	
	with (instance_place(x, y + vsp, obj_metalblock))
	    instance_destroy();
}
