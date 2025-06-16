repeat (image_xscale)
{
    with (instance_create(random_range(x, x + (image_xscale * 32)), random_range(y, y + (image_yscale * 32)), obj_bangeffect))
        sprite_index = choose(spr_supertaunteffect1, spr_supertaunteffect2, spr_supertaunteffect3, spr_supertaunteffect4, spr_supertaunteffect5);
}
