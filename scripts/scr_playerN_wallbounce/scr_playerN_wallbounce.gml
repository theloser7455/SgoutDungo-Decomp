function scr_playerN_wallbounce()
{
	move = key_left + key_right;
	hsp = Approach(hsp, move * movespeed, 1);
	
	if (move == -xscale)
	    movespeed = 12;
	
	if (movespeed < 12)
	    movespeed = 12;
	
	image_speed = 0.5;
	
	if (move != 0)
	    dir = move;
	
	if (key_down)
	{
	    vsp = 20;
	    
	    if (sprite_index != spr_playerN_divebomb && sprite_index != spr_playerN_divebombland && sprite_index != spr_playerN_divebombfall)
	        sprite_index = spr_playerN_divebomb;
	    
	    if (sprite_index != spr_playerN_divebombfall && !grounded)
	        sprite_index = spr_playerN_divebombfall;
	    
	    if (sprite_index == spr_playerN_divebombfall && grounded)
	    {
	        image_index = 0;
	        sprite_index = spr_playerN_divebombland;
	    }
	    
	    if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerN_divebombland)
	        sprite_index = spr_playerN_divebomb;
	    
	    var xx = hsp;
	    
	    if (xx == 0)
	        xx = xscale;
	    
	    if (grounded && vsp > 0 && place_meeting(x + xx, y, obj_solid) && !place_meeting(x + xx, y, obj_destructibles))
	    {
	        mask_index = spr_crouchmask;
	        
	        if (!place_meeting(x + xx, y, obj_solid) || place_meeting(x + xx, y, obj_destructibles))
	        {
	            flash = 0;
	            state = 36;
	            movespeed = 12;
	            vsp = 10;
	            xscale = dir;
	        }
	    }
	    
	    blur--;
	    
	    if (blur <= 0)
	    {
	        if (grounded && vsp > 0)
	        {
	            with (instance_create(x, bbox_bottom, obj_baddiegibs))
	            {
	                vsp = -2;
	                hsp = random_range(5, -5);
	                sprite_index = spr_noisedrilldebris;
	            }
	            
	            blur = 4;
	        }
	    }
	}
	
	if (!key_down && grounded && (sprite_index == spr_playerN_divebomb || sprite_index == spr_playerN_divebombland || sprite_index == spr_playerN_divebombfall))
	{
	    vsp = -8;
	    sprite_index = spr_playerN_wallbounce;
	    
	    with (instance_create(x, y, obj_bangeffect))
	        sprite_index = spr_noisewalljumpeffect;
	    
	    scr_soundeffect(sfx_wallbouncebounce);
	}
	
	if (key_slap2 && !key_up)
	{
	    state = 69;
	    sprite_index = spr_playerN_sidewayspin;
	    scr_soundeffect(sfx_airspinstart);
	    image_index = 0;
	    jumpstop = 1;
	    
	    if (vsp > -8)
	        vsp = -8;
	    
	    key_slap2 = 0;
	    audio_stop_sound(sfx_airspinloop);
	    xscale = dir;
	    
	    with (instance_create(x, y, obj_crazyrunothereffect))
	        image_xscale = other.xscale;
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
	
	if (grounded && vsp >= 0 && sprite_index != spr_playerN_divebomb && sprite_index != spr_playerN_divebombland && sprite_index != spr_playerN_divebombfall)
	{
	    state = 0;
	    movespeed = abs(movespeed);
	    xscale = dir;
	    
	    if (move != 0)
	        xscale = move;
	    
	    if (key_attack && movespeed > 6)
	    {
	        state = 69;
	        
	        if (movespeed >= 12)
	        {
	            state = 89;
	            sprite_index = spr_mach4;
	        }
	    }
	    
	    scr_soundeffect(sfx_noisewallbounceland);
	}
}
