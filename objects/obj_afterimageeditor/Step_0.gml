scr_getinput();

if ((key_slap2 || keyboard_check_pressed(vk_escape)) && !writing)
{
    key_slap2 = 0;
    scr_soundeffect(sfx_punch);
    instance_destroy();
}

ini_open("SGOUTDATA new.ini");

if (!writing)
{
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
    
    if (key_punchtwo2)
    {
        writing = 1;
        keyboard_string = "";
    }
    
    ini_close();
}
else
{
    if (keyboard_check_pressed(vk_escape))
    {
        writing = 0;
        scr_soundeffect(sfx_punch);
    }
    
    if (keyboard_check_pressed(vk_f9))
    {
        ini_open("SGOUTDATA new.ini");
        var m1r = ini_read_real("afterimages", "mach1 R", 255);
        var m1g = ini_read_real("afterimages", "mach1 G", 0);
        var m1b = ini_read_real("afterimages", "mach1 B", 0);
        var m2r = ini_read_real("afterimages", "mach2 R", 0);
        var m2g = ini_read_real("afterimages", "mach2 G", 255);
        var m2b = ini_read_real("afterimages", "mach2 B", 0);
        var PAr = ini_read_real("afterimages", "pepattack R", 0);
        var PAg = ini_read_real("afterimages", "pepattack G", 255);
        var PAb = ini_read_real("afterimages", "pepattack B", 255);
        var NOr = ini_read_real("afterimages", "Nattack R", 248);
        var NOg = ini_read_real("afterimages", "Nattack G", 224);
        var NOb = ini_read_real("afterimages", "Nattack B", 128);
        ini_close();
        ini_open(string(keyboard_string) + ".afterimg");
        ini_write_real("afterimages", "mach1 R", m1r);
        ini_write_real("afterimages", "mach1 G", m1g);
        ini_write_real("afterimages", "mach1 B", m1b);
        ini_write_real("afterimages", "mach2 R", m2r);
        ini_write_real("afterimages", "mach2 G", m2g);
        ini_write_real("afterimages", "mach2 B", m2b);
        ini_write_real("afterimages", "pepattack R", PAr);
        ini_write_real("afterimages", "pepattack G", PAg);
        ini_write_real("afterimages", "pepattack B", PAb);
        ini_write_real("afterimages", "Nattack R", NOr);
        ini_write_real("afterimages", "Nattack G", NOg);
        ini_write_real("afterimages", "Nattack B", NOb);
        ini_close();
        show_message("saved " + string(keyboard_string) + ".afterimg to your appdata");
        writing = 0;
    }
    
    if (keyboard_check_pressed(vk_f10))
    {
        ini_open(string(keyboard_string) + ".afterimg");
        var m1r2 = ini_read_real("afterimages", "mach1 R", 255);
        var m1g2 = ini_read_real("afterimages", "mach1 G", 0);
        var m1b2 = ini_read_real("afterimages", "mach1 B", 0);
        var m2r2 = ini_read_real("afterimages", "mach2 R", 0);
        var m2g2 = ini_read_real("afterimages", "mach2 G", 255);
        var m2b2 = ini_read_real("afterimages", "mach2 B", 0);
        var PAr2 = ini_read_real("afterimages", "pepattack R", 0);
        var PAg2 = ini_read_real("afterimages", "pepattack G", 255);
        var PAb2 = ini_read_real("afterimages", "pepattack B", 255);
        var NOr2 = ini_read_real("afterimages", "Nattack R", 248);
        var NOg2 = ini_read_real("afterimages", "Nattack G", 224);
        var NOb2 = ini_read_real("afterimages", "Nattack B", 128);
        ini_close();
        ini_open("SGOUTDATA new.ini");
        ini_write_real("afterimages", "mach1 R", m1r2);
        ini_write_real("afterimages", "mach1 G", m1g2);
        ini_write_real("afterimages", "mach1 B", m1b2);
        ini_write_real("afterimages", "mach2 R", m2r2);
        ini_write_real("afterimages", "mach2 G", m2g2);
        ini_write_real("afterimages", "mach2 B", m2b2);
        ini_write_real("afterimages", "pepattack R", PAr2);
        ini_write_real("afterimages", "pepattack G", PAg2);
        ini_write_real("afterimages", "pepattack B", PAb2);
        ini_write_real("afterimages", "Nattack R", NOr2);
        ini_write_real("afterimages", "Nattack G", NOg2);
        ini_write_real("afterimages", "Nattack B", NOb2);
        ini_close();
        
        if (file_exists(string(keyboard_string) + ".afterimg"))
            show_message("imported " + string(keyboard_string) + ".afterimg's afterimages");
        else
            show_message("couldn't find " + string(keyboard_string) + ".afterimg" + ", afterimages reset to default");
        
        writing = 0;
    }
}
