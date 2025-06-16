function scr_playerpepperman_groundpound()
{
	move = key_left + key_right;
	hsp = Approach(hsp, move * 4, 0.5);
	image_speed = 0.35;
	
	if (vsp > 0)
	    vsp += 2;
	
	if (grounded && !place_meeting(x, y + 1, obj_destructibles) && !place_meeting(x, y + 1, obj_metalblock) && vsp > 0)
	{
	    scr_soundeffect(sfx_groundpound);
	    freefallsmash = 0;
	    sprite_index = spr_Pslamland;
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
	
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_Pslamstart)
	    sprite_index = spr_Pslam;
	
	with (instance_place(x, y + vsp, obj_metalblock))
	    instance_destroy();
	
	if (vsp > 50)
	{
	    with (instance_place(x, y + vsp, obj_heavyblock))
	        instance_destroy();
	}
}
