alarm[0] = -1;

if (times > 0)
{
    with (instance_create(x + (dir * 64), ystart, obj_peppermanshockwave))
    {
        times = other.times - 1;
        dir = other.dir;
    }
}

times--;
