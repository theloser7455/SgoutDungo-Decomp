var a = 0;

with (obj_player)
{
    if (state != 21 && instakillmove != 1 && state != 46 && state != 444)
        a = 1;
}

if (hurting == 1 || (hurtandhitable && a))
{
    with (other)
        scr_hurttheplayer();
}
