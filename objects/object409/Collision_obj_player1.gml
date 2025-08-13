with (instance_create(x, y, obj_bossdefeatflash))
    fadeout = 0.005;

scr_soundeffect(sfx_flashbang);

with (obj_player)
{
    y += 64;
    vsp = 20;
    hsp = 0;
    state = states.freefall;
    sprite_index = spr_bodyslamstart;
}
