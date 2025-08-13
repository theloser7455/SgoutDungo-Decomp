function scr_player_climbwall()
{
	if (windingAnim < 200)
	    windingAnim++;
	
	move = key_left + key_right;
	suplexmove = 0;
	vsp = -wallspeed;
	
	for (var i = 0; i < vsp; i++)
	{
	    if (!scr_solid(x + xscale, y))
	    {
	        y += vsp;
	        vsp = 0;
	    }
	}
	
	if (wallspeed < 24)
	    wallspeed += 0.1;
	
	crouchslideAnim = 1;
	sprite_index = spr_machclimbwall;
	
	if (!key_attack)
	{
	    state = 0;
	    movespeed = 0;
	}
	
	if (!scr_solid(x + xscale, y))
	{
	    instance_create(x, y, obj_jumpdust);
	    vsp = 0;
	    movespeed = abs(wallspeed);
	    
	    if (movespeed >= 8)
	        state = states.mach2;
	    
	    if (movespeed >= 12)
	    {
	        state = states.mach3;
	        sprite_index = spr_mach4;
	    }
	    
	    x += xscale;
	    
	    if (!scr_solid(x + (xscale * 5), y - 5))
	    {
	        while (!scr_solid(x + xscale, y + 1))
	            y += 1;
	    }
	}
	
	if (key_jump)
	{
	    movespeed = wallspeed;
	    
	    if (movespeed > 16 && character != "S")
	        movespeed = 16;
	    
	    state = states.mach2;
	    image_index = 0;
	    sprite_index = spr_walljumpstart;
	    vsp = -11;
	    xscale *= -1;
	    jumpstop = 0;
	}
	
	if ((grounded && wallspeed <= 0) || wallspeed <= 0)
	{
	    state = states.jump;
	    sprite_index = spr_fall;
	}
	
	image_speed = 0.6;
	
	if (!instance_exists(obj_cloudeffect))
	    instance_create(x, y + 43, obj_cloudeffect);
	
	if (character == "N")
	{
	    state = states.wallbounce;
	    
	    with (instance_create(x, y, obj_bangeffect))
	        sprite_index = spr_noisewalljumpeffect;
	    
	    vsp = -15;
	    sprite_index = spr_playerN_wallbounce;
	    scr_soundeffect(sfx_wallbouncebounce);
	    movespeed = 12;
	    dir = xscale;
	}
	
	if (scr_solid(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x - sign(hsp), y, obj_slope))
	{
	    sprite_index = spr_superjumpland;
	    scr_soundeffect(sfx_groundpound);
	    image_index = 0;
	    state = states.Sjumpland;
	    machhitAnim = 0;
	}
}
