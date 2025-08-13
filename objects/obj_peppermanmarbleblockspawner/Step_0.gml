var pp = 352;

if (instance_exists(obj_greaterman))
    pp = 402;

if (instance_exists(pp) && pp == 352)
{
    if (pp.state != states.portal && pp.state != states.bossphase2transition)
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

if (instance_exists(pp) && pp == 402)
{
    if (pp.state != states.portal && pp.state != states.bossphase2transition)
    {
        if ((((pp.hp == 2 || pp.hp == 4) && priority == 1) || ((pp.hp == 1 || pp.hp == 3 || pp.hp == 5) && priority == -1)) && !instance_exists(obj_peppermanmarbleblockboss))
        {
            with (instance_create(x, y, obj_peppermanmarbleblockboss))
                image_xscale = other.image_xscale;
        }
    }
    
    if (pp.hp != 2 && pp.hp != 1 && pp.hp != 4 && pp.hp != 3 && pp.hp != 5)
    {
        if (instance_exists(obj_peppermanmarbleblockboss))
            instance_destroy(obj_peppermanmarbleblockboss);
    }
}
