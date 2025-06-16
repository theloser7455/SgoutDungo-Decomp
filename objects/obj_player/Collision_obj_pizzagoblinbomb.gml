if (cutscene == 0 && state != 26 && (state == 21 || character == "S"))
{
    bombpeptimer = 100;
    state = 26;
    image_index = 0;
    sprite_index = spr_bombpepintro;
    instance_destroy(other.id);
}

if (cutscene == 0 && state == 307)
{
    with (other)
    {
        hsp = other.xscale * 12;
        vsp = -10;
        countdown = 100;
        deflected = 1;
    }
    
    sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4);
    image_index = 0;
    state = 56;
    movespeed = 3;
    vsp = -3;
    scr_soundeffect(ballhit);
    instance_create(x + (32 * xscale), y, obj_bangeffect);
}
