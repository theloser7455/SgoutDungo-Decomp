function scr_player_finishingblow()
{
	hsp = xscale * movespeed;
	
	if (movespeed > 0)
	    movespeed -= 0.5;
	
	if (floor(image_index) == (image_number - 1))
	    state = 0;
	
	if (floor(image_index) == 4 && !instance_exists(obj_swordhitbox))
	{
	    scr_soundeffect(sfx_punch);
	    scr_soundeffect(sfx_killingblow);
	    instance_create(x, y, obj_swordhitbox);
	    movespeed = -5;
	    vsp = -5;
	}
	
	if (floor(image_index) == 0 && !instance_exists(obj_swordhitbox) && sprite_index == spr_swingdingend)
	{
	    scr_soundeffect(sfx_killingblow);
	    instance_create(x, y, obj_swordhitbox);
	}
	
	image_speed = 0.35;
	landAnim = 0;
}
