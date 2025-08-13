scr_collide();

if (scr_solid(x, y + 1))
    vsp = -cvsp;

if (scr_solid(x, y - 1))
    vsp = cvsp;

if (scr_solid(x + 1, y))
    hsp = -cvsp;

if (scr_solid(x - 1, y))
    hsp = chsp;
