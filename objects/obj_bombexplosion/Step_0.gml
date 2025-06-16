if (image_index > 9)
    mask_index = spr_masknull;

if (player)
{
    with (instance_place(x, y, obj_baddie))
        instance_destroy();
}
