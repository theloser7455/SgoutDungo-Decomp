scr_collide();

if (hp > 0)
{
    with (instance_place(x, y, obj_player))
    {
        if (state == states.handstandjump || state == states.punch)
        {
            sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4);
            image_index = 0;
            state = states.tackle;
            movespeed = 3;
            vsp = -3;
            var ding = 1;
            
            if (instance_exists(obj_pepperman_boss))
            {
                if (obj_pepperman_boss.phase >= 1)
                    ding = 0.5 / obj_pepperman_boss.phase;
            }
            
            other.hp -= ding;
            other.image_index += ding;
            
            repeat (round(5))
            {
                with (instance_create(random_range(other.x - 32, other.x + 32), random_range(other.y - 64, other.y + 32), obj_baddiegibs))
                    sprite_index = spr_marbledebris;
            }
            
            with (instance_create(x + (xscale * 32), y, obj_bangeffect))
                depth = other.depth - 1;
            
            scr_soundeffect(choose(sfx_breakblock1, sfx_breakblock2));
        }
    }
    
    with (instance_place(x, y, obj_playernoisebombboss))
    {
        var ding = 1;
        
        if (instance_exists(obj_pepperman_boss))
        {
            if (obj_pepperman_boss.phase >= 1)
                ding = 0.5 / obj_pepperman_boss.phase;
        }
        
        other.hp -= ding;
        other.image_index += ding;
        
        with (instance_create(x + (image_xscale * 32), y, obj_bangeffect))
            depth = other.depth - 1;
        
        repeat (round(5))
        {
            with (instance_create(random_range(other.x - 32, other.x + 32), random_range(other.y - 64, other.y + 32), obj_baddiegibs))
                sprite_index = spr_marbledebris;
        }
        
        scr_soundeffect(choose(sfx_breakblock1, sfx_breakblock2));
        instance_destroy();
    }
}

if (hp <= 0)
    image_index = image_number - 1;
