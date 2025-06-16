scr_getinput();

if (instance_exists(obj_afterimageeditor))
{
}

yyyy = Approach(yyyy, yyy, 10);

if (key_slap2 || key_start)
{
    scr_soundeffect(sfx_enemyprojectile);
    key_slap2 = 0;
    instance_destroy();
}

if (key_down2 && selected < 9)
{
    selected += 1;
    
    if (selected == 2 || selected == 4)
    {
        selected += 1;
        yyy -= 50;
    }
    
    scr_soundeffect(sfx_step);
    yyy -= 50;
}

if (key_up2 && selected > 0)
{
    selected -= 1;
    
    if (selected == 2 || selected == 4)
    {
        selected -= 1;
        yyy += 50;
    }
    
    scr_soundeffect(sfx_step);
    yyy += 50;
}

if (selected == 0)
{
    if (key_jump)
    {
        global.attackstyleP += 1;
        
        if (global.attackstyleP > 2)
            global.attackstyleP = -1;
    }
}

if (selected == 1)
{
    if (key_jump)
    {
        global.attackstyleN += 1;
        
        if (global.attackstyleN > 1)
            global.attackstyleN = -1;
    }
}

if (selected == 2)
{
    if (key_jump)
    {
        global.coolsnick += 1;
        
        if (global.coolsnick > 1)
            global.coolsnick = 0;
    }
}

if (selected == 3)
{
    if (key_jump)
    {
        global.pizdec += 1;
        
        if (global.pizdec > 1)
            global.pizdec = 0;
    }
}

if (selected == 4)
{
    if (key_jump)
    {
        global.pizzafacechasestyle += 1;
        
        if (global.pizzafacechasestyle > 2)
            global.pizzafacechasestyle = 0;
    }
}

if (selected == 5)
{
    if (key_jump)
    {
        global.peakcancel += 1;
        
        if (global.peakcancel > 1)
            global.peakcancel = 0;
    }
}

if (selected == 6)
{
    if (key_jump)
    {
        global.supertaunt += 1;
        
        if (global.supertaunt > 3)
            global.supertaunt = 0;
    }
}

if (selected == 7)
{
    if (key_jump)
    {
        global.karatesounds += 1;
        
        if (global.karatesounds > 1)
            global.karatesounds = 0;
    }
}

if (selected == 8)
{
    if (key_jump)
    {
        with (instance_create(x, y, obj_afterimageeditor))
            depth = other.depth - 1;
    }
}

if (selected == 9)
{
    if (key_jump)
    {
        global.panicbg += 1;
        
        if (global.panicbg > 1)
            global.panicbg = 0;
    }
}

if (selected == 10)
{
    if (key_jump)
    {
        global.gremlinpersonality += 1;
        
        if (global.gremlinpersonality > 2)
            global.gremlinpersonality = 0;
    }
}
