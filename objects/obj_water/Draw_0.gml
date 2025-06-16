draw_set_alpha(image_alpha);

if (flash)
    shader_set(shd_hit);

for (var i = 0; i < abs(image_xscale); i++)
{
    draw_sprite(spr_water1, -1, x + (32 * i), y);
    
    if (image_yscale > 1)
    {
        for (var i2 = 0; i2 < (abs(image_yscale) - 1); i2++)
            draw_sprite(spr_water2, -1, x + (32 * i), y + (32 * (i2 + 1)));
    }
}

shader_reset();
draw_set_alpha(1);
