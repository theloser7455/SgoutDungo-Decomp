repeat (3)
{
    with (instance_create(random_range(x + 50, x - 50), random_range(y + 35, y - 50), obj_keyeffect))
        depth = other.depth - 1;
}

alarm[1] = 15;
