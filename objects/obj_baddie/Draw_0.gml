pal_swap_set(spr_palette, paletteselect, 0);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale + (xscaleplus * image_xscale), image_yscale + (yscaleplus * image_yscale), image_angle, image_blend, image_alpha);

if (flash)
{
    shader_set(shd_hit);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale + (xscaleplus * image_xscale), image_yscale + (yscaleplus * image_yscale), image_angle, image_blend, image_alpha);
    shader_reset();
}

shader_reset();

if (global.holiday == "JOLLY")
    draw_sprite_ext(spr_jollyhat, image_index, x, bbox_top, (image_xscale / 2) + (xscaleplus * image_xscale), (image_yscale / 2) + (yscaleplus * image_yscale), image_angle, image_blend, image_alpha);

if (global.holiday == "SCARY")
    draw_sprite_ext(spr_scaryhat, image_index, x, y, image_xscale + (xscaleplus * image_xscale), image_yscale + (yscaleplus * image_yscale), image_angle, image_blend, image_alpha);

var mask = global.showmaskorhitbox;

if (mask)
    draw_sprite_ext(mask_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.5);
