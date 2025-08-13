if (gainvsp)
    vsp += 0.5;

y += floor(vsp);
x += hsp;

if (y > 1080)
    instance_destroy();
