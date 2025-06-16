if (instance_exists(baddieID) && other.thrown == 1)
{
    instance_destroy(other.id);
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
