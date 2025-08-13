scr_collide();
vsp += 0.75;

if ((!grounded && room == boss_devilkin) && !teleported)
    alarm[0] = 50;

if (grounded && !boing)
{
    vsp = -10 * jump;
    jump -= 1;
    boing = 1;
    scr_soundeffect(sfx_groundpound);
    
    with (instance_create(x, y, obj_bangeffect))
        sprite_index = spr_groundpoundeffect;
}

if (grounded && !gpeffect)
{
    scr_soundeffect(sfx_groundpound);
    
    with (instance_create(x, y, obj_bangeffect))
        sprite_index = spr_groundpoundeffect;
    
    gpeffect = 1;
}
