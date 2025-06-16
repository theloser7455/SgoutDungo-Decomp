if (collect > 0)
{
    with (instance_create(x, y, obj_collect))
    {
        fuckass = 1;
        speed = 10;
        direction = random_range(0, 360);
        other.collect -= 1;
    }
}
else
{
    state = "goaway";
}

alarm[0] = 5;
