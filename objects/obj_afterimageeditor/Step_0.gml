scr_getinput();
ini_open("SGOUTDATA.ini");

if (key_right2)
{
    switch (selected)
    {
        case " R":
            selected = " G";
            break;
        
        case " G":
            selected = " B";
            break;
        
        case " B":
            selected = " R";
            break;
    }
}

if (-key_left2)
{
    switch (selected)
    {
        case " R":
            selected = " B";
            break;
        
        case " G":
            selected = " R";
            break;
        
        case " B":
            selected = " G";
            break;
    }
}

var num = ini_read_real("afterimages", afterimage + selected, 1);

if (key_down2)
{
    num++;
    
    if (num > 255)
        num = 0;
    
    ini_write_real("afterimages", afterimage + selected, num);
}

if (key_up2)
{
    num--;
    
    if (num < 0)
        num = 255;
    
    ini_write_real("afterimages", afterimage + selected, num);
}

if (key_taunt2)
{
    switch (afterimage)
    {
        case "mach1":
            afterimage = "mach2";
            break;
        
        case "mach2":
            afterimage = "pepattack";
            break;
        
        case "pepattack":
            afterimage = "Nattack";
            break;
        
        case "Nattack":
            afterimage = "mach1";
            break;
    }
}

if (key_punch2)
    scr_afterimagessave();

ini_close();

if (key_slap2 || keyboard_check_pressed(vk_escape))
{
    key_slap2 = 0;
    scr_soundeffect(sfx_punch);
    instance_destroy();
}
