function scr_player_grind()
{
	vsp = 0;
	machhitAnim = 0;
	crouchslideAnim = 1;
	hsp = xscale * movespeed;
	
	if (movespeed < 24)
	    movespeed += 0.0625;
	
	if (movespeed < 6)
	    movespeed = 6;
	
	if (!grounded || place_meeting(x, y + 1, obj_solid))
	    state = states.mach2;
	
	if (key_jump)
	{
	    vsp = -10;
	    state = states.mach2;
	    y -= 1;
	    sprite_index = spr_mach2jump;
	}
	
	sprite_index = spr_player_grind;
	image_speed = 0.35;
	
	if (!instance_exists(obj_grindeffect))
	    instance_create(x, y, obj_grindeffect);
}
