switch (state)
{
    case states.normal:
        image_speed = 0.35;
        hsp = 0;
        sprite_index = spr_idiot;
        attackin -= 1;
        
        if (attackin <= 0)
        {
            state = states.tumble;
            attackin = 200;
            idiotcooldown = 0;
        }
        
        break;
    
    case states.tumble:
        vsp = 0;
        hsp = 0;
        
        if (idiotcooldown <= 0)
        {
            idiotcooldown = 37 - (phase * 12);
            x = random_range(200, room_width - 200);
            y = random_range(200, room_height - 200);
            var otherwindow = 0;
            
            if (hp <= round(maxhp / 2))
                otherwindow = choose(1, 0);
            
            if (!otherwindow)
            {
                with (instance_create(x, y, obj_idiotwindow))
                {
                    chsp = choose(5, 2);
                    cvsp = choose(5, 2);
                    hsp = choose(chsp, -chsp);
                    vsp = choose(cvsp, -cvsp);
                    image_xscale = random_range(0.5, 1.5);
                    image_yscale = image_xscale;
                }
            }
            else
            {
                with (instance_create(x, y, obj_idiotwindow2))
                {
                    chsp = choose(16, 32, 48, 64);
                    cvsp = choose(16, 32, 48, 64);
                    hsp = choose(chsp, -chsp);
                    vsp = choose(cvsp, -cvsp);
                    image_xscale = random_range(0.5, 1.5);
                    image_yscale = image_xscale;
                }
            }
        }
        
        if (attackin <= 0)
        {
            state = states.stunned;
            stunned = 500;
            
            if (instance_exists(obj_idiotwindow))
                instance_destroy(obj_idiotwindow);
        }
        
        idiotcooldown--;
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

attackin--;
