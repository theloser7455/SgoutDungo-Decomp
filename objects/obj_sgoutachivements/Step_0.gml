if (picy == 640)
{
    if (overkill == 0 && global.SAGEoverkill == 1)
    {
        up = 1;
        sprite = bg_SAGEoverkill;
        overkill = 1;
        alarm[0] = 250;
        scr_soundeffect(sfx_achievementwav);
    }
    else if (z12uniques == 0 && global.SAGE12uniques == 1)
    {
        up = 1;
        sprite = bg_sgout12collects;
        z12uniques = 1;
        alarm[0] = 250;
        scr_soundeffect(sfx_achievementwav);
    }
    else if (pizzaparry == 0 && global.SAGEpizzaparry == 1)
    {
        up = 1;
        sprite = bg_sgoutbully;
        pizzaparry = 1;
        alarm[0] = 250;
        scr_soundeffect(sfx_achievementwav);
    }
}

if (picy == 300)
    up = 0;

if (up == 1)
    picy -= 10;
