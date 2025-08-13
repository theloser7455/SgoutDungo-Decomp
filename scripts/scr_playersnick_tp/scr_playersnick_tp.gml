function scr_playersnick_tp()
{
	move = key_left + key_right;
	hsp = 0;
	vsp = 0;
	tpcd--;
	
	if (tptimes > 0 && tpcd <= 0)
	{
	    tpcd = 2;
	    tptimes--;
	    
	    if (!scr_solid(x + tph, y))
	    {
	        x += tph;
	    }
	    else if (!place_meeting(x + tph, y, obj_destructibles) && !place_meeting(x + tph, y, obj_metalblock))
	    {
	        while (!scr_solid(x + sign(tph), y))
	            x += sign(tph);
	        
	        tph = 0;
	    }
	    else
	    {
	        with (instance_place(x + tph, y, obj_metalblock))
	            instance_destroy();
	        
	        with (instance_place(x + tph, y, obj_destructibles))
	            instance_destroy();
	    }
	    
	    if (!scr_solid(x, y + tpv) || place_meeting(x, y + tpv, obj_platform))
	    {
	        y += tpv;
	    }
	    else if (!place_meeting(x, y + tpv, obj_destructibles) && !place_meeting(x, y + tpv, obj_metalblock))
	    {
	        while (!scr_solid(x, y + sign(tpv)))
	            y += sign(tpv);
	        
	        tpv = 0;
	    }
	    else
	    {
	        with (instance_place(x, y + tpv, obj_metalblock))
	            instance_destroy();
	        
	        with (instance_place(x, y + tpv, obj_destructibles))
	            instance_destroy();
	    }
	    
	    if (scr_solid(x + sign(tph), y) && tpv == 0)
	        tptimes = 0;
	    
	    if (scr_solid(x, y + sign(tpv)) && tph == 0)
	        tptimes = 0;
	    
	    repeat (8)
	    {
	        with (instance_create(x + random_range(32, -32), y + random_range(48, -16), obj_bangeffect))
	        {
	            sprite_index = choose(spr_glitch1, spr_glitch2, spr_glitch3);
	            image_speed = 0.35;
	            depth = other.depth - 1;
	        }
	    }
	}
	
	if ((key_slap2 || key_attack2) && (tauntstoredstate == states.Sjump || tauntstoredstate == states.uppercut))
	{
	    if (move != 0)
	        xscale = move;
	    
	    movespeed = 12;
	    machhitAnim = 0;
	    state = states.mach3;
	    
	    if (character != "N")
	        flash = 1;
	    
	    sprite_index = spr_mach4;
	    instance_create(x, y, obj_jumpdust);
	    scr_soundeffect(choose(sfx_snickglitchnew, sfx_snickglitchnew2, sfx_snickglitchnew3, sfx_snickglitchnew4));
	    hsp = 0;
	    vsp = 0;
	    tpcd = 0;
	    tph = 60 * xscale;
	    tpv = 0;
	    tptimes = 4;
	    tauntstoredstate = state;
	    tauntstoredsprite = sprite_index;
	    tauntstoredmovespeed = movespeed + 4;
	    sprite_index = spr_secondjump2;
	    state = states.snicktp;
	}
	
	if (tptimes <= 0 && tpcd <= 0)
	{
	    state = tauntstoredstate;
	    
	    if (state == states.backbreaker)
	        state = states.normal;
	    
	    sprite_index = tauntstoredsprite;
	    movespeed = tauntstoredmovespeed;
	    
	    if (state == states.uppercut)
	        vsp = -10;
	    
	    if ((state == states.jump || state == states.normal) && key_attack)
	    {
	        state = states.mach3;
	        sprite_index = spr_mach4;
	    }
	}
}
