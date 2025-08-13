with (instance_create(x, y, obj_afterimog))
{
    sprite_index = other.sprite_index;
    drain = 0.03125;
    image_index = other.image_index;
    image_xscale = other.image_xscale;
    image_yscale = other.image_yscale;
    
    if (other.stater == "dash")
        image_blend = c_red;
    else
        image_blend = make_color_rgb(152, 80, 152);
}

alarm[3] = 5;
