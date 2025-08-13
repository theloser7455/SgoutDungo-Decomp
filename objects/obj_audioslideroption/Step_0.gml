scr_getinput();

if (key_down2)
{
    if (selected < 3)
        selected += 1;
}

if (key_up2)
{
    if (selected > 0)
        selected -= 1;
}

switch (selected)
{
    case 0:
        if (key_jump)
            instance_destroy();
        
        break;
    
    case 1:
        if (key_right && global.audiosfxvol < 1)
        {
            global.audiosfxvol += 0.01;
            audio_stop_sound(sfx_bumpwall);
            scr_soundeffect(sfx_bumpwall);
        }
        
        if (-key_left && global.audiosfxvol > 0)
        {
            global.audiosfxvol -= 0.01;
            audio_stop_sound(sfx_bumpwall);
            scr_soundeffect(sfx_bumpwall);
        }
        
        break;
    
    case 2:
        if (key_right && global.audiomusvol < 1)
            global.audiomusvol += 0.01;
        
        if (-key_left && global.audiomusvol > 0)
            global.audiomusvol -= 0.01;
        
        break;
    
    case 3:
        if (key_right && global.audiomusbreakdancevol < 1)
        {
            global.audiomusbreakdancevol += 0.01;
            audio_stop_sound(sfx_bumpwall);
            scr_soundeffect(sfx_bumpwall);
            audio_sound_gain(sfx_bumpwall, global.audiomusbreakdancevol, 0.1);
        }
        
        if (-key_left && global.audiomusbreakdancevol > 0)
        {
            global.audiomusbreakdancevol -= 0.01;
            audio_stop_sound(sfx_bumpwall);
            scr_soundeffect(sfx_bumpwall);
            audio_sound_gain(sfx_bumpwall, global.audiomusbreakdancevol, 0.1);
        }
        
        break;
}

if (audio_is_playing(mu_pausemenu))
    audio_sound_gain(mu_pausemenu, global.audiomusvol, 10);

if (audio_is_playing(mu_title))
    audio_sound_gain(mu_title, global.audiomusvol, 10);

ini_open("SGOUTDATA new.ini");
ini_write_real("the 🎶", "sfx", global.audiosfxvol);
ini_write_real("the 🎶", "mus", global.audiomusvol);
ini_write_real("the 🎶", "musbreakdance", global.audiomusbreakdancevol);
ini_close();

if (!instance_exists(obj_option))
{
    x1++;
    y1++;
}
else
{
    x1 = obj_option.x1;
    y1 = obj_option.y1;
}
