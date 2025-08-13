with (instance_create(x, y, obj_smallnumber))
    number = "1000";

global.collect += 1000;
scr_soundeffect(sfx_collectgiantpizza);
instance_destroy();
global.combotime = 100;

if (instance_exists(obj_tv))
{
    with (obj_tv)
    {
        shakething += 20;
        
        if (shakething >= 20)
            shakething = 20;
    }
}
