if (global.gotsaw == 0)
{
    instance_destroy();
    global.gotsaw = 1;
    scr_soundeffect(sfx_chainsawstart);
}
