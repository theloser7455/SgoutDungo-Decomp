vspeed += 1;

if (place_meeting(x, y + vspeed, obj_solid) || place_meeting(x, y, obj_baddie))
{
    with (instance_create(x, y, obj_debris))
    {
        image_angle = 0;
        sprite_index = other.sprite_index;
        image_index = other.image_index + 1;
        image_speed = 0;
        vsp = -10;
    }
    
    with (instance_place(x, y, obj_baddie))
        instance_destroy();
    
    scr_soundeffect(jellyhit);
    instance_destroy();
}
