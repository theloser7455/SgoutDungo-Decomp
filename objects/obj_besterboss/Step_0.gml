switch (state)
{
    case states.normal:
        image_speed = 0.35;
        hsp = 0;
        sprite_index = spr_angelkin;
        attackin -= 1;
        
        if (attackin <= 0)
        {
            if (attack == "none")
            {
                attackin = 12;
                attack = "flame";
            }
            
            if (attack == "flame")
            {
                attackin = 700;
                state = states.tumble;
                vsp = -15;
            }
        }
        
        break;
    
    case states.tumble:
        image_speed = 0.35;
        sprite_index = spr_angelkin_run;
        attackin--;
        
        if (attackin <= 0)
        {
            state = states.stunned;
            stunned = 500;
            
            if (instance_exists(obj_heavensgemprojectile))
                instance_destroy(obj_heavensgemprojectile);
            
            if (phase < 1)
            {
                with (instance_create(room_width - x, y, obj_playernoisebombboss))
                {
                    with (instance_create(x, y, obj_bangeffect))
                        sprite_index = spr_genericpoofeffect;
                    
                    chaseboss = 1;
                    scr_soundeffect(sfx_poof);
                    mask_index = other.mask_index;
                }
            }
        }
        
        flame--;
        
        if (flame <= 0)
        {
            with (instance_create(x, -464, obj_heavensgemprojectile))
            {
                if (!other.phase)
                    next = 4;
            }
            
            flame = 40;
            
            if (!phase)
                flame = 80;
            
            scr_soundeffect(sfx_enemyprojectile);
        }
        
        hsp = xscale * 12;
        
        if (scr_solid(x + xscale, y))
            xscale *= -1;
        
        break;
    
    case states.stunned:
        scr_boss_stun();
        break;
    
    case states.bossStun:
        scr_boss_stun();
        break;
    
    case states.portal:
        scr_boss_thrown();
        break;
    
    case states.bossphase2transition:
        scr_boss_phase2transition();
        break;
}
