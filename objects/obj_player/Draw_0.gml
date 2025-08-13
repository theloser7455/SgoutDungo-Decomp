pal_swap_set(spr_palette, paletteselect, 0);
var drawch = 0;

if (squished)
{
    if (global.combo >= 10 && supertaunts > 0)
    {
        switch (global.supertaunt)
        {
            case 1:
                draw_sprite_ext(sprite_index, image_index, x + round(wave(8, -8, 1, 0.25)), y + 23 + round(wave(8, -8, 1, 0.5)), xscale + (xscaleplus * xscale * global.strechmulti), (yscale * 0.5) + (yscaleplus * yscale * global.strechmulti), image_angle, make_color_rgb(255, 0, 0), image_alpha);
                draw_sprite_ext(sprite_index, image_index, x + round(wave(6, -6, 1, 0.5)), y + 23 + round(wave(6, -6, 1, 0.25)), xscale + (xscaleplus * xscale * global.strechmulti), (yscale * 0.5) + (yscaleplus * yscale * global.strechmulti), image_angle, make_color_rgb(0, 255, 0), image_alpha);
                break;
            
            case 3:
                draw_sprite_ext(sprite_index, image_index, x + random_range(3, -3), y + 23 + random_range(3, -3), xscale + (xscaleplus * xscale * global.strechmulti), (yscale * 0.5) + (yscaleplus * yscale * global.strechmulti), image_angle, make_color_rgb(255, 0, 0), image_alpha);
                break;
            
            case 2:
                drawch = 1;
                break;
        }
    }
    
    draw_sprite_ext(sprite_index, image_index, x, y + 23, xscale + (xscaleplus * xscale * global.strechmulti), (yscale * 0.5) + (yscaleplus * yscale * global.strechmulti), image_angle, image_blend, image_alpha);
    
    if (drawch)
        draw_sprite_ext(spr_supercharge, superframe, x, y + 23, xscale + (xscaleplus * xscale * global.strechmulti), (yscale * 0.5) + (yscaleplus * yscale * global.strechmulti), image_angle, c_white, image_alpha);
}
else
{
    if (global.combo >= 10 && supertaunts > 0)
    {
        switch (global.supertaunt)
        {
            case 1:
                draw_sprite_ext(sprite_index, image_index, x + round(wave(8, -8, 1, 0.25)), y + round(wave(8, -8, 1, 0.5)), xscale + (xscaleplus * xscale * global.strechmulti), yscale + (yscaleplus * yscale * global.strechmulti), image_angle, make_color_rgb(255, 0, 0), image_alpha);
                draw_sprite_ext(sprite_index, image_index, x + round(wave(6, -6, 1, 0.5)), y + round(wave(6, -6, 1, 0.25)), xscale + (xscaleplus * xscale * global.strechmulti), yscale + (yscaleplus * yscale * global.strechmulti), image_angle, make_color_rgb(0, 255, 0), image_alpha);
                break;
            
            case 3:
                draw_sprite_ext(sprite_index, image_index, x + random_range(3, -3), y + random_range(3, -3), xscale + (xscaleplus * xscale * global.strechmulti), yscale + (yscaleplus * yscale * global.strechmulti), image_angle, c_red, image_alpha);
                break;
            
            case 2:
                drawch = 1;
                break;
        }
    }
    
    draw_sprite_ext(sprite_index, image_index, x, y, xscale + (xscaleplus * xscale * global.strechmulti), yscale + (yscaleplus * yscale * global.strechmulti), image_angle, image_blend, image_alpha);
    
    if (drawch)
        draw_sprite_ext(spr_supercharge, superframe, x, y, xscale + (xscaleplus * xscale * global.strechmulti), yscale + (yscaleplus * yscale * global.strechmulti), image_angle, c_white, image_alpha);
}

shader_reset();

if (flash)
{
    shader_set(shd_hit);
    draw_sprite_ext(sprite_index, image_index, x, y, xscale + (xscaleplus * xscale * global.strechmulti), yscale + (yscaleplus * yscale * global.strechmulti), image_angle, image_blend, image_alpha);
    shader_reset();
}

var mask = global.showmaskorhitbox;

if (mask)
{
    draw_sprite_ext(mask_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.5);
    
    if (instance_exists(obj_hurtbox))
    {
        with (obj_hurtbox)
            draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.5);
    }
}
