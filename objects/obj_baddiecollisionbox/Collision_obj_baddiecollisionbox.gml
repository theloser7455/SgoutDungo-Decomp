if (object_index != obj_pizzaball)
{
    with (other.id)
    {
        if (instance_exists(baddieID) && baddieID != other.id)
        {
            if (baddieID.state == 104 && baddieID.thrown == 1)
            {
                other.baddieID.hp -= 1;
                
                with (instance_create(other.baddieID.x, other.baddieID.y, obj_bangeffect))
                    sprite_index = spr_parryeffect;
                
                with (instance_create(other.baddieID.x, other.baddieID.y, obj_bangeffect))
                    sprite_index = spr_kungfueffect;
                
                if (other.baddieID.hp <= 0)
                {
                    instance_destroy(other.baddieID);
                    instance_destroy(other.id);
                }
            }
        }
    }
}
