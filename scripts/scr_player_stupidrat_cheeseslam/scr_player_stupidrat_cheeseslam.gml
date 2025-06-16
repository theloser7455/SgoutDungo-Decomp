function scr_player_stupidrat_cheeseslam()
{
	move = key_left + key_right;
	hsp = Approach(hsp, move * 8, 0.25);
	vsp += (grav * 2);
	
	if (sprite_index == spr_mach2jump)
	    sprite_index = spr_bodyslamstart;
	
	image_speed = 0.5;
	
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_bodyslamstart)
	    sprite_index = spr_bodyslamfall;
	
	if (grounded && !(input_buffer_jump < 8) && vsp >= 0 && !place_meeting(x, y + 1, obj_destructibles))
	{
	    scr_soundeffect(cheesestomp);
	    instance_create(x, y, obj_ratdust);
	    
	    with (instance_create(x, y, obj_ratdust))
	        image_xscale *= -1;
	    
	    with (instance_create(x, y + 32, obj_machalleffect))
	    {
	        speed = 12;
	        direction = 90;
	    }
	    
	    with (instance_create(x, y + 32, obj_machalleffect))
	    {
	        speed = 12;
	        direction = 22.5;
	    }
	    
	    with (instance_create(x, y + 32, obj_machalleffect))
	    {
	        speed = 12;
	        direction = 45;
	    }
	    
	    with (instance_create(x, y + 32, obj_machalleffect))
	    {
	        speed = 12;
	        direction = 67.5;
	    }
	    
	    with (instance_create(x, y + 32, obj_machalleffect))
	    {
	        speed = -12;
	        direction = -22.5;
	    }
	    
	    with (instance_create(x, y + 32, obj_machalleffect))
	    {
	        speed = -12;
	        direction = -45;
	    }
	    
	    with (instance_create(x, y + 32, obj_machalleffect))
	    {
	        speed = -12;
	        direction = -67.5;
	    }
	    
	    freefallsmash = 0;
	    
	    if (shotgunAnim == 0)
	        sprite_index = spr_bodyslamland;
	    else
	        sprite_index = spr_player_shotgunjump2;
	    
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
	    freefallstart = 0;
	}
}
