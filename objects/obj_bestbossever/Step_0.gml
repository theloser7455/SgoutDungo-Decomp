switch (state)
{
    case states.normal:
        image_speed = 0.35;
        hsp = 0;
        sprite_index = spr_thedevilkin;
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
                attackin = 500;
                state = states.tumble;
                vsp = -15;
            }
        }
        
        break;
    
    case states.tumble:
        image_speed = 0.35;
        sprite_index = spr_thedevilkin_run;
        attackin--;
        
        if (attackin <= 0)
        {
            state = states.stunned;
            stunned = 200;
            
            if (instance_exists(obj_hellfireprojectile))
                instance_destroy(obj_hellfireprojectile);
            
            with (instance_create(x, -464, obj_playernoisebombboss))
                vegetable = 1;
        }
        
        flame--;
        
        if (flame <= 0)
        {
            with (instance_create(x, y, obj_hellfireprojectile))
            {
                if (other.phase)
                {
                    speed = random_range(1, 2) * other.phase;
                    direction = random_range(360, 0);
                    dmg = 3;
                }
            }
            
            flame = 4;
            
            if (phase)
                flame = 2;
            
            scr_soundeffect(sfx_enemyprojectile);
        }
        
        hsp = xscale * 12;
        
        if (phase == 1 && grounded)
            vsp = random_range(-15, -5);
        
        if (scr_solid(x + xscale, y))
        {
            xscale *= -1;
            
            if (floor(vsp) >= 0)
                vsp = random_range(-15, -5);
        }
        
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
