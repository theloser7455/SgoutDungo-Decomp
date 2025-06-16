var pp = 352;

if (instance_exists(pp))
{
    if (pp.state != 18)
    {
        if (((pp.hp == 2 && priority == 1) || (pp.hp == 1 && priority == -1)) && !instance_exists(obj_peppermanmarbleblockboss))
        {
            with (instance_create(x, y, obj_peppermanmarbleblockboss))
                image_xscale = other.image_xscale;
        }
    }
    
    if (pp.hp != 2 && pp.hp != 1)
    {
        if (instance_exists(obj_peppermanmarbleblockboss))
            instance_destroy(obj_peppermanmarbleblockboss);
    }
}
