if (cutscene == 0 && state != states.bombpep && (state == states.handstandjump || character == "S"))
{
    bombpeptimer = 100;
    state = states.bombpep;
    image_index = 0;
    sprite_index = spr_bombpepintro;
    instance_destroy(other.id);
}

if (cutscene == 0 && state == states.kungfu)
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
    state = states.tackle;
    movespeed = 3;
    vsp = -3;
    scr_soundeffect(ballhit);
    instance_create(x + (32 * xscale), y, obj_bangeffect);
}
