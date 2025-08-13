global.collect += 50;

with (instance_create(x, y, obj_smallnumber))
    number = "50";

if (audio_is_playing(sfx_collecttopping))
    audio_stop_sound(sfx_collecttopping);

scr_soundeffect(sfx_collecttopping);
instance_destroy();

if ((global.combotime + 25) > 100)
    global.combotime = 100;
else
    global.combotime += 25;

if (instance_exists(obj_tv))
{
    with (obj_tv)
    {
        shakething += 5;
        
        if (shakething >= 20)
            shakething = 20;
    }
}
