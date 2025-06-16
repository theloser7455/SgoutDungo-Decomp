function scr_player_punch()
{
	move = key_left + key_right;
	hsp = xscale * movespeed;
	
	if (key_down && !place_meeting(x, y, obj_dashpad))
	{
	    instance_create(x, y, obj_jumpdust);
	    flash = 0;
	    state = 36;
	    vsp = 10;
	    
	    if (character == "N" && !grounded)
	    {
	        state = 9890;
	        sprite_index = spr_playerN_divebombfall;
	        vsp = 20;
	    }
	}
	
	if (!grounded)
	{
	    if (sprite_index != spr_player_airattack && sprite_index != spr_player_airattackstart)
	    {
	        sprite_index = spr_player_airattackstart;
	        image_index = 0;
	    }
	    
	    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_airattackstart)
	        sprite_index = spr_player_airattack;
	}
	
	if (grounded && sprite_index != spr_player_attackdash && vsp > 0)
	{
	    state = 0;
	    
	    if (key_attack && movespeed > 6)
	        state = 69;
	    
	    if (move != 0)
	        xscale = move;
	}
	
	if ((floor(image_index) == (image_number - 1) && sprite_index == spr_player_attackdash) || (move == -xscale && move != 0))
	{
	    state = 0;
	    
	    if (key_attack && movespeed > 6)
	        state = 69;
	    
	    if (move != 0)
	        xscale = move;
	}
	
	image_speed = 0.5;
	
	if (grounded)
	{
	    sprite_index = spr_player_attackdash;
	    
	    if (key_jump)
	        vsp = -11;
	}
	
	if (scr_solid(x + 1, y) && xscale == 1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
	    scr_soundeffect(sfx_bumpwall);
	    hsp = 0;
	    image_speed = 0.35;
	    flash = 0;
	    combo = 0;
	    state = 71;
	    hsp = -2.5;
	    vsp = -3;
	    mach2 = 0;
	    image_index = 0;
	    instance_create(x + 10, y + 10, obj_bumpeffect);
	}
	
	if (scr_solid(x - 1, y) && xscale == -1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
	    scr_soundeffect(sfx_bumpwall);
	    hsp = 0;
	    image_speed = 0.35;
	    flash = 0;
	    combo = 0;
	    state = 71;
	    hsp = 2.5;
	    vsp = -3;
	    mach2 = 0;
	    image_index = 0;
	    instance_create(x - 10, y + 10, obj_bumpeffect);
	}
}
