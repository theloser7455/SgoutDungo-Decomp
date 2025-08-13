function scr_enemy_idle()
{
	if (vsp > 1 && (grounded || (grounded && !place_meeting(x, y, obj_platform))))
	{
	    instance_create(x, y, obj_landcloud);
	    image_index = 0;
	}
	
	if (vsp >= 0 && sprite_index == scaredspr && grounded && scaredbuffer <= 0)
	    state = states.uppercut;
	
	if (object_index == obj_ancho && scr_solid(x, y - 1))
	{
	    instance_create(x, y - 16, obj_bumpeffect);
	    scr_soundeffect(sfx_bumpwall);
	    state = states.enemystun;
	    stunned = 100;
	    grav = 0.5;
	}
	
	if (object_index == obj_ancho && sprite_index == scaredspr)
	{
	    if (scaredbuffer <= 0)
	        state = states.uppercut;
	    
	    hsp = lerp(hsp, 0, 0.25);
	}
	
	if (object_index == obj_forknight && sprite_index == spr_forknight_turn && floor(image_index) == (image_number - 1))
	    state = states.uppercut;
	
	if ((grounded || (grounded && !place_meeting(x, y, obj_platform))) && vsp > 0)
	    hsp = 0;
	
	if (!(grounded || (grounded && !place_meeting(x, y, obj_platform))) && hsp < 0)
	    hsp += 0.1;
	else if (!(grounded || (grounded && !place_meeting(x, y, obj_platform))) && hsp > 0)
	    hsp -= 0.1;
	
	image_speed = 0.35;
}
