if (instance_exists(baddieID) && other.team)
{
    scr_soundeffect(sfx_hitenemy);
    scr_soundeffect(sfx_machpunch);
    global.hit += 1;
    global.combotime = 100;
    instance_create(baddieID.x, baddieID.y, obj_slapstar);
    instance_create(baddieID.x, baddieID.y, obj_baddiegibs);
    baddieID.flash = 1;
    baddieID.state = 104;
    
    if (baddieID.stunned < 100)
        baddieID.stunned = 100;
    
    instance_create(baddieID.x, baddieID.y, obj_bangeffect);
    baddieID.vsp = -4;
    baddieID.hsp = obj_player1.xscale * 5;
    baddieID.hp -= 1;
    
    with (instance_create(baddieID.x, baddieID.y, obj_bangeffect))
        sprite_index = spr_parryeffect;
    
    with (instance_create(baddieID.x, baddieID.y, obj_bangeffect))
        sprite_index = spr_kungfueffect;
    
    if (baddieID.hp <= 0)
    {
        instance_destroy(baddieID);
        instance_destroy(id);
    }
}
