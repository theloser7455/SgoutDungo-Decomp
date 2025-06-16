scr_collide();

if (hp > 0)
{
    with (instance_place(x, y, obj_player))
    {
        if (state == 21 || state == 46)
        {
            sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch);
            image_index = 0;
            state = 56;
            movespeed = 3;
            vsp = -3;
            var ding = 1;
            
            if (instance_exists(obj_pepperman_boss))
            {
                if (obj_pepperman_boss.phase == 1)
                    ding = 0.5;
            }
            
            other.hp -= ding;
            other.image_index += ding;
        }
    }
    
    with (instance_place(x, y, obj_playernoisebombboss))
    {
        var ding = 1;
        
        if (instance_exists(obj_pepperman_boss))
        {
            if (obj_pepperman_boss.phase == 1)
                ding = 0.5;
        }
        
        other.hp -= ding;
        other.image_index += ding;
        instance_destroy();
    }
}
