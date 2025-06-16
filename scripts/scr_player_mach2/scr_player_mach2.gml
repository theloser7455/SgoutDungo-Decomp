function scr_player_mach2()
{
	if (character == "P")
	{
	    if (windingAnim < 2000)
	        windingAnim++;
	}
	
	hsp = xscale * movespeed;
	
	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
	    hsp = xscale * movespeed;
	else if (place_meeting(x, y + 1, obj_railh))
	    hsp = (xscale * movespeed) - 5;
	else if (place_meeting(x, y + 1, obj_railh2))
	    hsp = (xscale * movespeed) + 5;
	
	move2 = key_right2 + key_left2;
	move = key_right + key_left;
	crouchslideAnim = 1;
	
	if (!key_jump2 && jumpstop == 0 && vsp < 0.5)
	{
	    vsp /= 10;
	    jumpstop = 1;
	}
	
	if (grounded && vsp > 0)
	    jumpstop = 0;
	
	if (input_buffer_jump < 8 && grounded && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1))
	{
	    image_index = 0;
	    sprite_index = spr_secondjump1;
	    scr_soundeffect(jumpsound);
	    vsp = -11;
	}
	
	if (grounded && vsp > 0)
	{
	    if (machpunchAnim == 0 && sprite_index != spr_mach && sprite_index != spr_player_mach3 && sprite_index != spr_player_machhit)
	    {
	        if (sprite_index != spr_player_machhit && sprite_index != spr_rollgetup)
	            sprite_index = spr_mach;
	    }
	    
	    if (machpunchAnim == 1)
	    {
	        if (punch == 0)
	            sprite_index = spr_machpunch1;
	        
	        if (punch == 1)
	            sprite_index = spr_machpunch2;
	        
	        if (floor(image_index) == 4 && sprite_index == spr_machpunch1)
	        {
	            punch = 1;
	            machpunchAnim = 0;
	        }
	        
	        if (floor(image_index) == 4 && sprite_index == spr_machpunch2)
	        {
	            punch = 0;
	            machpunchAnim = 0;
	        }
	    }
	}
	
	if (!grounded)
	    machpunchAnim = 0;
	
	if (grounded)
	{
	    if (movespeed < 12)
	        movespeed += 0.1;
	    
	    if (movespeed >= 12)
	    {
	        machhitAnim = 0;
	        state = 89;
	        flash = 1;
	        
	        if (sprite_index != spr_rollgetup)
	            sprite_index = spr_mach4;
	        
	        instance_create(x, y, obj_jumpdust);
	    }
	}
	
	if (key_jump)
	    input_buffer_jump = 0;
	
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
	
	if (!instance_exists(obj_dashcloud) && grounded)
	{
	    with (instance_create(x, y, obj_dashcloud))
	        image_xscale = other.xscale;
	}
	
	if (grounded && floor(image_index) == (image_number - 1) && sprite_index == spr_rollgetup)
	    sprite_index = spr_player_mach;
	
	if (!grounded && sprite_index != spr_secondjump2 && sprite_index != spr_mach2jump && sprite_index != spr_player_mach2jump && sprite_index != spr_player_walljumpstart && sprite_index != spr_player_walljumpend && sprite_index != spr_playerN_sidewayspin && sprite_index != spr_playerN_sidewayspinend && sprite_index != spr_longjump1 && sprite_index != spr_longjump2)
	    sprite_index = spr_secondjump1;
	
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_secondjump1)
	    sprite_index = spr_secondjump2;
	
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_longjump1)
	    sprite_index = spr_longjump2;
	
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerN_sidewayspin)
	    sprite_index = spr_playerN_sidewayspinend;
	
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_walljumpstart)
	    sprite_index = spr_player_walljumpend;
	
	if (!key_attack && grounded)
	{
	    image_index = 0;
	    state = 70;
	    scr_soundeffect(machturnsound);
	    sprite_index = spr_machslidestart;
	}
	
	if (move == -xscale && grounded)
	{
	    scr_soundeffect(machslidesound);
	    image_index = 0;
	    state = 70;
	    sprite_index = spr_machslideboost;
	}
	
	if (sprite_index == spr_rollgetup)
	    image_speed = 0.4;
	else
	    image_speed = 0.65;
	
	if (key_up && key_jump && grounded && character == "N")
	{
	    sprite_index = spr_superjumpprep;
	    state = 64;
	    vsp = 10;
	    hsp = 0;
	    image_index = 0;
	}
	
	if (character == "N" && key_jump && key_up && !grounded)
	{
	    state = 4719;
	    sprite_index = spr_playerN_noisecrusherstart;
	    image_index = 0;
	    vsp = -16;
	    scr_soundeffect(sfx_noisedoublejumper);
	    dir = xscale;
	}
	
	if ((!grounded || scr_slope()) && place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
	    wallspeed = movespeed;
	    state = 16;
	}
	
	if (grounded && !scr_slope() && place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_slope))
	{
	    scr_soundeffect(sfx_bumpwall);
	    hsp = 0;
	    image_speed = 0.35;
	    flash = 0;
	    combo = 0;
	    state = 71;
	    hsp = -2.5 * xscale;
	    vsp = -3;
	    mach2 = 0;
	    image_index = 0;
	    instance_create(x + (10 * xscale), y, obj_bumpeffect);
	}
}
