if (activated)
{
    image_speed = 0;
    image_index = 0;
    hspeed = lerp(hspeed, 24, 0.0625);
    image_angle += hspeed;
    
    if (x >= (room_width * 1.25))
        instance_destroy();
}

if (distance_to_object(obj_player) <= 100 && !activated)
{
    activated = 1;
    hspeed = -12;
}
