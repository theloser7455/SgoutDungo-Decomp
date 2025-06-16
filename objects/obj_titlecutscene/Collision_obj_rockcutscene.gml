if (other.image_index == 0)
{
    scr_soundeffect(ballhit);
    
    with (instance_create(x, y, obj_bangeffect))
        hspeed = -20;
    
    sprite_index = spr_player_machfreefall;
    drop = 1;
    vsp = -10;
    hsp = -16;
    other.image_index = 1;
}

if (sprite_index == spr_player_machfreefall && vsp > 0)
{
    scr_soundeffect(sfx_scream7);
    scr_soundeffect(ballhit);
    scr_soundeffect(spank);
    
    with (instance_create(x, y, obj_bangeffect))
        hspeed = -20;
    
    sprite_index = spr_player_deathend;
    drop = 1;
    vsp = -20;
    hsp = 20;
    other.image_index = 1;
}
