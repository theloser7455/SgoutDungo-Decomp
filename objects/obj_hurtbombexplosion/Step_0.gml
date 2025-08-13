if (floor(image_index) == (image_number - 1))
    instance_destroy();

if (image_index > 9)
    mask_index = spr_masknull;

with (instance_place(x, y, obj_destructibles))
    instance_destroy();

with (instance_place(x, y, obj_bombblock))
    instance_destroy();
