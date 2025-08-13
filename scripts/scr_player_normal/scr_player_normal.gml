function scr_player_normal()
{
	var _spr_move = spr_move;
	var _spr_idle = spr_idle;
	
	if (character == "P" && global.climbstairss && scr_slope())
	{
	    _spr_move = spr_player_climbstairs;
	    _spr_idle = spr_player_stairs;
	}
	
	if (dir != xscale)
	{
	    dir = xscale;
	    movespeed = 2;
	    
	    if (character == "R")
	        movespeed = 4;
	    
	    facehurt = 0;
	}
	
	if (key_taunt)
	    breakdancing = Approach(breakdancing, 0.5, 0.025);
	else
	    breakdancing = Approach(breakdancing, -1.5, 0.005);
	
	mach2 = 0;
	move = key_left + key_right;
	var raildir = 0;
	
	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
	    raildir = 0;
	else if (place_meeting(x, y + 1, obj_railh))
	    raildir = -1;
	else if (place_meeting(x, y + 1, obj_railh2))
	    raildir = 1;
	
	if (breakdancing < 0)
	{
	    if (character != "S" && character != "R")
	    {
	        if (machslideAnim == 0 && landAnim == 0 && shotgunAnim == 0)
	        {
	            if (move == 0)
	            {
	                if (idle < 400)
	                    idle++;
	                
	                if (idle >= 150 && floor(image_index) == (image_number - 1))
	                {
	                    facehurt = 0;
	                    idle = 0;
	                    image_index = 0;
	                }
	                
	                if (idle >= 150 && sprite_index != spr_idle1 && sprite_index != spr_idle2 && sprite_index != spr_idle3 && sprite_index != spr_idle4 && sprite_index != spr_idle5 && sprite_index != spr_idle6)
	                {
	                    randomise();
	                    idleanim = random_range(0, 100);
	                    
	                    if (idleanim <= 16)
	                        sprite_index = spr_idle1;
	                    
	                    if (idleanim > 16 && idleanim < 32)
	                        sprite_index = spr_idle2;
	                    
	                    if (idleanim > 32 && idleanim < 48)
	                        sprite_index = spr_idle3;
	                    
	                    if (idleanim > 48 && idleanim < 64)
	                        sprite_index = spr_idle4;
	                    
	                    if (idleanim > 64 && idleanim < 80)
	                        sprite_index = spr_idle5;
	                    
	                    if (idleanim > 80)
	                        sprite_index = spr_idle6;
	                    
	                    image_index = 0;
	                }
	                
	                if (idle < 150)
	                {
	                    if (facehurt == 0)
	                    {
	                        if (windingAnim < 1800 || angry == 1 || global.playerhealth == 1)
	                        {
	                            start_running = 1;
	                            movespeed = 0;
	                            
	                            if (global.minutes == 0 && global.seconds == 0)
	                                sprite_index = spr_hurtidle;
	                            else if (global.panic == 1 || global.snickchallenge == 1)
	                                sprite_index = spr_panic;
	                            else if (angry == 1)
	                                sprite_index = spr_3hpidle;
	                            else
	                                sprite_index = _spr_idle;
	                        }
	                        else
	                        {
	                            idle = 0;
	                            windingAnim--;
	                            sprite_index = spr_winding;
	                        }
	                    }
	                    else if (facehurt == 1)
	                    {
	                        windingAnim = 0;
	                        
	                        if (sprite_index != spr_facehurtup && sprite_index != spr_facehurt)
	                            sprite_index = spr_facehurtup;
	                        
	                        if (floor(image_index) == (image_number - 1) && sprite_index == spr_facehurtup)
	                            sprite_index = spr_facehurt;
	                    }
	                }
	            }
	            
	            if (move != 0)
	            {
	                machslideAnim = 0;
	                idle = 0;
	                facehurt = 0;
	                
	                if (global.minutes == 0 && global.seconds == 0)
	                    sprite_index = spr_hurtwalk;
	                else if (angry == 1)
	                    sprite_index = spr_3hpwalk;
	                else
	                    sprite_index = _spr_move;
	            }
	            
	            if (move != 0)
	                xscale = move;
	        }
	    }
	    
	    if (character == "S" || character == "R")
	    {
	        if (machslideAnim == 0)
	        {
	            if (move == 0)
	            {
	                if (idle < 400)
	                    idle++;
	                
	                if (idle >= 100 && floor(image_index) == (image_number - 1))
	                {
	                    idle = 0;
	                    image_index = 0;
	                }
	                
	                if (idle >= 100 && sprite_index != spr_idle1)
	                    sprite_index = spr_idle1;
	                
	                if (idle < 100)
	                    sprite_index = spr_idle;
	            }
	            
	            if (move != 0)
	            {
	                machslideAnim = 0;
	                sprite_index = _spr_move;
	                xscale = move;
	            }
	        }
	    }
	}
	else
	{
	    sprite_index = spr_breakdance;
	    
	    if (character == "N" && instance_exists(obj_boombox))
	    {
	        if (paletteselect == 10)
	        {
	            staticafterimg--;
	            
	            if (staticafterimg <= 0)
	            {
	                with (instance_create(x, y, obj_afterimog))
	                {
	                    sprite_index = other.spr_taunt;
	                    image_index = random_range(0, image_number - 1);
	                    image_blend = choose(c_red, c_yellow, make_color_rgb(255, 192, 203), c_blue, c_purple, c_lime, make_color_rgb(0, 255, 255));
	                    image_alpha = 3;
	                    spr_palette = other.spr_palette;
	                    paletteselect = other.paletteselect;
	                    
	                    if (other.move == 0)
	                        hspeed = -8;
	                }
	                
	                repeat (64)
	                {
	                    if (!scr_solid_player(x + move, y))
	                        x += move;
	                }
	                
	                if (instance_exists(obj_boombox))
	                {
	                    with (obj_boombox)
	                    {
	                        repeat (64)
	                        {
	                            if (!scr_solid(x + other.move, y))
	                                x += other.move;
	                        }
	                    }
	                }
	                
	                staticafterimg = 20;
	            }
	        }
	    }
	    
	    if (move != 0)
	        xscale = move;
	    
	    if (image_speed >= 0.5 && !instance_exists(obj_boombox))
	        instance_create(x, y, obj_boombox);
	}
	
	if (landAnim == 1)
	{
	    if (shotgunAnim == 0)
	    {
	        if (move == 0)
	        {
	            movespeed = 0;
	            sprite_index = spr_land;
	            
	            if (floor(image_index) == (image_number - 1))
	                landAnim = 0;
	        }
	        
	        if (move != 0)
	        {
	            sprite_index = spr_land2;
	            
	            if (floor(image_index) == (image_number - 1))
	            {
	                landAnim = 0;
	                sprite_index = _spr_move;
	                image_index = 0;
	            }
	        }
	    }
	    
	    if (shotgunAnim == 1)
	    {
	        sprite_index = spr_shotgun_land;
	        
	        if (floor(image_index) == (image_number - 1))
	        {
	            landAnim = 0;
	            sprite_index = _spr_move;
	            image_index = 0;
	        }
	    }
	}
	
	if (machslideAnim == 1)
	{
	    sprite_index = spr_machslideend;
	    
	    if (floor(image_index) == (image_number - 1) && sprite_index == spr_machslideend)
	        machslideAnim = 0;
	}
	
	if (sprite_index == spr_player_shotgun && floor(image_index) == (image_number - 1))
	    sprite_index = spr_shotgun_idle;
	
	if (landAnim == 0)
	{
	    if (shotgunAnim == 1 && move == 0 && sprite_index != spr_player_shotgun)
	        sprite_index = spr_shotgun_idle;
	    else if (shotgunAnim == 1 && sprite_index != spr_player_shotgun)
	        sprite_index = spr_shotgun_walk;
	}
	
	if (scr_solid(x + sign(hsp), y) && xscale == 1 && move == 1 && !place_meeting(x + 1, y, obj_slope))
	    movespeed = 0;
	
	if (scr_solid(x + sign(hsp), y) && xscale == -1 && move == -1 && !place_meeting(x - 1, y, obj_slope))
	    movespeed = 0;
	
	jumpstop = 0;
	var no = 0;
	
	if (key_up && key_jump && grounded && character == "N")
	    no = 1;
	
	if (key_jump && grounded && !no)
	{
	    scr_soundeffect(jumpsound);
	    sprite_index = spr_jump;
	    
	    if (shotgunAnim == 1)
	        sprite_index = spr_shotgun_jump;
	    
	    with (instance_create(x, y, obj_highjumpcloud2))
	        image_xscale = other.xscale;
	    
	    vsp = -11;
	    
	    if (character == "R")
	        vsp = -13;
	    
	    if (squished)
	        vsp /= 1.5;
	    
	    state = states.jump;
	    image_index = 0;
	    jumpAnim = 1;
	    
	    if (room == Realtitlescreen)
	    {
	        if (character != "R")
	        {
	            if (shotgunAnim == 0)
	            {
	                image_index = 0;
	                state = states.freefallprep;
	                sprite_index = spr_bodyslamstart;
	                vsp = -6;
	                scr_soundeffect(sfx_groundpoundstart);
	            }
	            else
	            {
	                scr_soundeffect(sfx_killingblow);
	                image_index = 0;
	                state = states.freefallprep;
	                sprite_index = spr_player_shotgunjump1;
	                vsp = -10;
	                
	                with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
	                {
	                    sprite_index = sprite10391;
	                    spdh = -10;
	                    spd = 0;
	                }
	                
	                with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
	                {
	                    sprite_index = sprite10391;
	                    spdh = -10;
	                    spd = 5;
	                }
	                
	                with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
	                {
	                    sprite_index = sprite10391;
	                    spdh = -10;
	                    spd = -5;
	                }
	            }
	        }
	        else
	        {
	            image_index = 0;
	            state = states.stupidratcheeseslam;
	            sprite_index = spr_bodyslamstart;
	            scr_soundeffect(cheesefall);
	            vsp = -10;
	        }
	    }
	}
	
	if (grounded && input_buffer_jump < 8 && !key_attack && vsp > 0 && !no)
	{
	    scr_soundeffect(jumpsound);
	    sprite_index = spr_jump;
	    
	    if (shotgunAnim == 1)
	        sprite_index = spr_shotgun_jump;
	    
	    with (instance_create(x, y, obj_highjumpcloud2))
	        image_xscale = other.xscale;
	    
	    stompAnim = 0;
	    vsp = -11;
	    
	    if (squished)
	        vsp /= 1.5;
	    
	    state = states.jump;
	    jumpAnim = 1;
	    jumpstop = 0;
	    image_index = 0;
	    freefallstart = 0;
	}
	
	if (no)
	{
	    sprite_index = spr_superjumpprep;
	    state = states.Sjumpprep;
	    vsp = 10;
	    hsp = 0;
	    image_index = 0;
	}
	
	if (((key_down && grounded) || (scr_solid(x, y - 3) && grounded)) && character != "S")
	{
	    if (character != "R")
	    {
	        state = states.crouch;
	        landAnim = 0;
	        crouchAnim = 1;
	        image_index = 0;
	        idle = 0;
	    }
	    else
	    {
	        squished = 1;
	    }
	}
	
	if (!key_down && !scr_solid(x, y - 3))
	    squished = 0;
	
	var maxspd = 8;
	
	if (character == "R")
	    maxspd = 12;
	
	if (character != "R")
	{
	    if (move != 0)
	    {
	        if (movespeed < maxspd)
	            movespeed += 0.5;
	        else if (floor(movespeed) == maxspd)
	            movespeed = maxspd;
	    }
	    else
	    {
	        movespeed = 0;
	    }
	    
	    if (movespeed > maxspd)
	        movespeed -= 0.1;
	    
	    hsp = (move * movespeed) + (raildir * 5);
	    
	    if (character == "N" && paletteselect == 10 && breakdancing >= 0)
	        hsp = 0;
	}
	else
	{
	    hsp = Approach(hsp, (12 * move) + (raildir * 5), 2);
	    
	    if (character == "N" && paletteselect == 10 && breakdancing >= 0)
	        hsp = 0;
	}
	
	momemtum = 0;
	
	if (breakdancing < 0)
	{
	    if (move != 0)
	    {
	        xscale = move;
	        
	        if (movespeed < 3 && move != 0)
	            image_speed = 0.35;
	        else if (movespeed > 3 && movespeed < 6)
	            image_speed = 0.45;
	        else
	            image_speed = 0.6;
	    }
	    else
	    {
	        image_speed = 0.35;
	    }
	}
	else
	{
	    image_speed = breakdancing;
	}
	
	if (!grounded && !key_jump)
	{
	    if (shotgunAnim == 0)
	        sprite_index = spr_fall;
	    else
	        sprite_index = spr_shotgun_fall;
	    
	    jumpAnim = 0;
	    state = states.jump;
	    image_index = 0;
	}
	
	if (key_attack && character != "S")
	{
	    if (movespeed < 8)
	        movespeed = 8;
	    
	    state = states.mach2;
	    sprite_index = spr_mach;
	    image_index = 0;
	    
	    if (character == "R")
	    {
	        state = states.stupidratroll;
	        scr_soundeffect(turnintoball);
	    }
	}
	
	if (key_attack && character == "S" && grounded)
	{
	    state = states.snickmachstart;
	    image_index = 0;
	    
	    if (movespeed < 14)
	        movespeed = 14;
	}
	
	if (move != 0 && (floor(image_index) == 3 || floor(image_index) == 8) && steppy == 0)
	{
	    instance_create(x, y + 43, obj_cloudeffect);
	    scr_soundeffect(sfx_step);
	    steppy = 1;
	}
	
	if (move != 0 && floor(image_index) != 3 && floor(image_index) != 8)
	    steppy = 0;
}
