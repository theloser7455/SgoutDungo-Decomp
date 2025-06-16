scr_collide();

with (instance_place(x, y, obj_water))
{
    if (electro != 1)
    {
        electro = 1;
        flash = 1;
        scr_soundeffect(sfx_electro);
    }
}

hsp = Approach(hsp, 0, 0.25);

if (scr_solid(x + hsp, y))
    hsp *= -1;

immunityframes--;

if (immunityframes <= 0)
{
    with (instance_place(x, y, obj_player))
    {
        if (instakillmove || state == 21 || state == 46)
        {
            other.vsp = -5 + vsp;
            other.hsp = hsp;
            other.immunityframes = 5;
            instance_create(other.x, other.y, obj_bangeffect);
            scr_soundeffect(spank);
        }
    }
}
