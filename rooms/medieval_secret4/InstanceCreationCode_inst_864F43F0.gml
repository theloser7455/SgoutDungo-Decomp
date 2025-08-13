if (global.deathmode || global.snickchallenge)
{
    with (instance_create(x, y, obj_solid))
    {
        image_xscale = 2;
        image_yscale = 2;
    }
    
    x = 999999999999999;
}
