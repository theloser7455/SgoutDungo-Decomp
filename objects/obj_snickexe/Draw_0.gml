if (evilcharge)
{
    repeat (8)
        draw_sprite_ext(sprite_index, image_index, random_range(x + 20, x - 20), random_range(y + 20, y - 20), image_xscale, image_yscale, image_angle, c_red, 0.5);
}

draw_self();
