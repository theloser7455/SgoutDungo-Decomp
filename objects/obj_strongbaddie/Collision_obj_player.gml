var a = 0;

with (obj_player)
{
    if (state != states.handstandjump && instakillmove != 1 && state != states.punch && state != states.unknown444)
        a = 1;
}

if (hurting == 1 || (hurtandhitable && a))
{
    with (other)
        scr_hurttheplayer();
}
