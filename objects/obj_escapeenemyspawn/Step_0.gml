if (floor(image_index) == 9 && spawned == 0)
{
    with (instance_create(x, y, content))
    {
        if (object_index == obj_baddie)
            status = other.baddiestatus;
    }
    
    with (instance_create(x, y, obj_bangeffect))
        sprite_index = spr_genericpoofeffect;
    
    scr_soundeffect(sfx_escapeenemyspawn);
    spawned = 1;
}

if (distance_to_object(obj_player) <= 400 && global.panic)
{
    visible = true;
    image_speed = 0.75;
}
