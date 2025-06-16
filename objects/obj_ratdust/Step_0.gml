x += (spd * image_xscale);

if (spd > 0)
    spd += 0.1;

if (floor(image_index) == (image_number - 1))
{
    image_speed = 0;
    image_alpha -= 0.1;
    
    if (image_alpha <= 0)
        instance_destroy();
}

with (instance_place(x, y, obj_baddie))
    instance_destroy();

with (instance_place(x, y, obj_destructibles))
    instance_destroy();

with (instance_place(x, y, obj_metalblock))
    instance_destroy();
