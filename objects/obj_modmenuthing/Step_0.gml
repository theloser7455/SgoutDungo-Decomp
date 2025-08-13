scr_getinput();
ini_open("SGOUTDATA new.ini");
var snicke = ini_read_string("Ranks", "snickchallenge", "null");
var hassnick = 1;

if (snicke == "null")
    hassnick = 0;

ini_close();

if (instance_exists(obj_afterimageeditor))
    exit;

yyyy = Approach(yyyy, yyy, 10);

if (key_slap2 || key_start)
{
    scr_soundeffect(sfx_enemyprojectile);
    key_slap2 = 0;
    instance_destroy();
}

if (key_down2 && selected < 16)
{
    selected += 1;
    
    if (selected == 4 && hassnick == 0)
    {
        selected += 1;
        yyy -= 50;
        
        if (selected == 10)
        {
            yy += 100;
            selected -= 1;
        }
    }
    
    scr_soundeffect(sfx_step);
    yyy -= 50;
}

if (key_up2 && selected > 0)
{
    selected -= 1;
    
    if (selected == 4 && hassnick == 0)
    {
        selected -= 1;
        yyy += 50;
    }
    
    scr_soundeffect(sfx_step);
    yyy += 50;
}

if (key_right2)
{
    if (selected == 0)
    {
        selected2++;
        
        if (selected2 > 1)
            selected2 = 0;
    }
    
    if (selected == 1)
    {
        selected22++;
        
        if (selected22 > 1)
            selected22 = 0;
    }
}

if (-key_left2)
{
    if (selected == 0)
    {
        selected2--;
        
        if (selected2 < 0)
            selected2 = 1;
    }
    
    if (selected == 1)
    {
        selected22--;
        
        if (selected22 < 0)
            selected22 = 1;
    }
}

if (selected == 0)
{
    if (key_jump)
    {
        if (selected2 == 0)
        {
            global.attackstyleP += 1;
            
            if (global.attackstyleP > 2)
                global.attackstyleP = -1;
        }
        else
        {
            global.attackstyleP2 += 1;
            
            if (global.attackstyleP2 > 2)
                global.attackstyleP2 = -1;
        }
    }
}

if (selected == 1)
{
    if (key_jump)
    {
        if (selected22 == 0)
        {
            global.attackstyleN += 1;
            
            if (global.attackstyleN > 1)
                global.attackstyleN = -1;
        }
        else
        {
            global.attackstyleN2 += 1;
            
            if (global.attackstyleN2 > 1)
                global.attackstyleN2 = -1;
        }
    }
}

if (selected == 2)
{
    if (key_jump)
    {
        global.lamepalettes += 1;
        
        if (global.lamepalettes > 1)
            global.lamepalettes = 0;
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
        if (!global.deathmode)
        {
            global.pizzafacechasestyle += 1;
            
            if (global.pizzafacechasestyle > 2)
                global.pizzafacechasestyle = 0;
        }
        else
        {
            scr_soundeffect(sfx_enemyprojectile);
        }
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
        global.panicdebriseffect += 1;
        
        if (global.panicdebriseffect > 1)
            global.panicdebriseffect = 0;
    }
}

if (selected == 10)
{
    if (key_jump)
    {
        global.showmaskorhitbox += 1;
        
        if (global.showmaskorhitbox > 1)
            global.showmaskorhitbox = 0;
    }
}

if (selected == 11)
{
    if (key_right)
    {
        if (global.globalzoom < 2)
            global.globalzoom += 0.1;
    }
    
    if (-key_left)
    {
        if (global.globalzoom > 0)
            global.globalzoom -= 0.1;
    }
}

if (selected == 12)
{
    if (key_jump)
        global.climbstairss += 1;
    
    if (global.climbstairss > 1)
        global.climbstairss = 0;
}

if (selected == 13)
{
    if (key_jump)
    {
        switch (global.fontspritee)
        {
            case 859:
                global.fontspritee = 1557;
                global.fontcharacterss = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyz.:!¡0123456789?'\"ÁÄÃÀÂÉÈÊËÍÌÎÏÓÖÕÔÒÚÙÛÜáäãàâéèêëíìîïóöõôòúùûüÇç_-[]▼()&#风雨廊桥전태양*яиБжидГзвбнльœ«»+ß👀";
                break;
            
            case 1557:
                global.fontspritee = 1641;
                global.fontcharacterss = "ABCDEFGHIJKLMNOPQRSTUVWXYZ!?.,:1234567890👀";
                break;
            
            case 1641:
                global.fontspritee = 1642;
                global.fontcharacterss = "ABCDEFGHIJKLMNOPQRSTUVWXYZ!?.,:1234567890👀";
                break;
            
            case 1642:
                global.fontspritee = 1643;
                global.fontcharacterss = "ABCDEFGHIJKLMNOPQRSTUVWXYZ!?.,:1234567890👀";
                break;
            
            case 1643:
                global.fontspritee = 1644;
                global.fontcharacterss = "ABCDEFGHIJKLMNOPQRSTUVWXYZ!?.,:1234567890👀";
                break;
            
            case 1644:
                global.fontspritee = 859;
                global.fontcharacterss = "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:👀";
                break;
        }
    }
}

if (selected == 14)
{
    if (key_jump)
    {
        global.butchermus += 1;
        
        if (global.butchermus > 1)
            global.butchermus = 0;
    }
}

if (selected == 15)
{
    if (key_jump)
    {
        global.instantR += 1;
        
        if (global.instantR > 1)
            global.instantR = 0;
    }
}

if (selected == 16)
{
    if (key_right)
    {
        if (global.strechmulti < 5)
            global.strechmulti += 0.1;
    }
    
    if (-key_left)
    {
        if (global.strechmulti > 0)
            global.strechmulti -= 0.1;
    }
}

ini_open("SGOUTDATA new.ini");
ini_write_real("OPTIONEZ", "butchermus", global.butchermus);
ini_write_real("OPTIONEZ", "panicbg", global.panicdebriseffect);
ini_write_real("OPTIONEZ", "pizdec", global.pizdec);
ini_write_real("OPTIONEZ", "fontsprite", global.fontspritee);
ini_write_string("OPTIONEZ", "fontcharacters", global.fontcharacterss);
ini_write_real("OPTIONEZ", "climbstairs", global.climbstairss);
ini_write_real("OPTIONEZ", "zoom", global.globalzoom);
ini_write_real("OPTIONEZ", "karatesounds", global.karatesounds);
ini_write_real("OPTIONEZ", "gremlinperson", global.gremlinpersonality);
ini_write_real("OPTIONEZ", "Staunt", global.supertaunt);
ini_write_real("OPTIONEZ", "PFchasestyle", global.pizzafacechasestyle);
ini_write_real("OPTIONEZ", "peakcancel", global.peakcancel);
ini_write_real("OPTIONEZ", "attackstyle", global.attackstyle);
ini_write_real("OPTIONEZ", "attackstyleP", global.attackstyleP);
ini_write_real("OPTIONEZ", "attackstyleN", global.attackstyleN);
ini_write_real("OPTIONEZ", "attackstyleS", global.attackstyleS);
ini_write_real("OPTIONEZ", "attackstyleR", global.attackstyleR);
ini_write_real("OPTIONEZ", "attackstyleV", global.attackstyleV);
ini_write_real("OPTIONEZ", "attackstyle2", global.attackstyle2);
ini_write_real("OPTIONEZ", "attackstyleP2", global.attackstyleP2);
ini_write_real("OPTIONEZ", "attackstyleN2", global.attackstyleN2);
ini_write_real("OPTIONEZ", "attackstyleS2", global.attackstyleS2);
ini_write_real("OPTIONEZ", "attackstyleR2", global.attackstyleR2);
ini_write_real("OPTIONEZ", "attackstyleV2", global.attackstyleV2);
ini_write_real("OPTIONEZ", "coolsnick", global.coolsnick);
ini_write_real("OPTIONEZ", "lamepalettes", global.lamepalettes);
ini_write_real("OPTIONEZ", "hitboxes", global.showmaskorhitbox);
ini_write_real("OPTIONEZ", "instantR", global.instantR);
ini_write_real("OPTIONEZ", "strechmulti", global.strechmulti);
ini_close();
