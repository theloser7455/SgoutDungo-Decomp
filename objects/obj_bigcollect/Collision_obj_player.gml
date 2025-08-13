with (instance_create(x, y, obj_smallnumber))
    number = "100";

global.collect += 100;
scr_soundeffect(sfx_collectpizza);
instance_destroy();
global.combotime = 100;

if (instance_exists(obj_tv))
{
    with (obj_tv)
    {
        shakething += 10;
        
        if (shakething >= 20)
            shakething = 20;
    }
}
