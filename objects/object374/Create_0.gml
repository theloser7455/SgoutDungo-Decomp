instance_create(x, y, obj_bossdefeatflash);
image_alpha = 0;

if (instance_exists(obj_baddiecollisionbox))
{
    with (obj_baddiecollisionbox)
    {
        image_blend = other.image_blend;
        
        with (instance_create(x, y, obj_stoppedbaddie))
        {
            image_speed = 0;
            sprite_index = other.baddieID.stunfallspr;
            image_blend = other.image_blend;
            baddieid = other.id;
        }
        
        baddieID.hitboxcreate = 0;
        instance_deactivate_object(baddieID);
        instance_deactivate_object(obj_forkhitbox);
        instance_deactivate_object(id);
    }
}

alarm[0] = 200;
alarm[1] = 205;
depth = -1;
