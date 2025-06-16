if (dashamounts > 0)
{
    alarm[1] = 37;
}
else
{
    alarm[1] = -1;
    
    with (instance_create(x, y, obj_explosioneffect))
        sprite_index = spr_genericpoofeffect;
    
    attacking = 0;
    speed = 0;
    previousattack = attack;
    attack = "idk";
    
    with (obj_afterimog)
    {
        if (sprite_index == spr_snick_exe)
            instance_destroy();
    }
}

direction = point_direction(x, y, obj_player.x + obj_player.hsp, obj_player.y + obj_player.vsp);
speed = random_range(15, 20);
dashamounts--;
