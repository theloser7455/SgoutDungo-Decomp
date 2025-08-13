repeat (chsp)
{
    if (!scr_solid(x + sign(hsp), y))
        x += sign(hsp);
}

repeat (cvsp)
{
    if (!scr_solid(x, y + sign(vsp)))
        y += sign(vsp);
}

if (scr_solid(x + sign(hsp), y))
    hsp *= -1;

if (scr_solid(x, y + sign(vsp)))
    vsp *= -1;

alarm[1] = random_range(10, 50);
scr_soundeffect(sfx_errorsound);
