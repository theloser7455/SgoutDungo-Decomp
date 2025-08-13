pal_swap_set(spr_palette, paletteselect, 0);

if (object_index == obj_greaterman || object_index == obj_pepperman_boss_butwith50phases)
{
    var m = 1;
    
    if (object_index == obj_pepperman_boss_butwith50phases)
        m = 2;
    
    draw_sprite_ext(sprite_index, image_index, x + round(wave(6, -6, 1, 0.5)), y + round(wave(6, -6, 1, 0.25)), 1.4 * xscale, 1.4 * xscale, image_angle, c_red, image_alpha - 0.75);
    draw_sprite_ext(sprite_index, image_index, x + round(wave(-6, 6, 1, 0.5)), y + round(wave(-6, 6, 1, 0.25)), 1.4 * xscale, 1.4 * xscale, image_angle, c_red, image_alpha - 0.75);
    draw_sprite_ext(sprite_index, image_index, x + round(wave(-6, 6, 1, 0.5)), y + round(wave(-6, 6, 1, 0.25)), 1.2 * xscale, 1.2 * xscale, image_angle, c_red, image_alpha - 0.25);
    draw_sprite_ext(sprite_index, image_index, x + round(wave(6, -6, 1, 0.5)), y + round(wave(6, -6, 1, 0.25)), 1.2 * xscale, 1.2 * xscale, image_angle, c_red, image_alpha - 0.25);
}

draw_sprite_ext(sprite_index, image_index, x, y, xscale * abs(image_xscale), image_yscale, image_angle, image_blend, image_alpha);

if (flash)
{
    shader_set(shd_hit);
    draw_sprite_ext(sprite_index, image_index, x, y, xscale * abs(image_xscale), image_yscale, image_angle, image_blend, image_alpha);
    shader_reset();
}

var haty = bbox_top;

if (mask_index == spr_pepperman_mask)
    haty = bbox_top + 83;

if (global.holiday == "JOLLY")
    draw_sprite_ext(spr_jollyhat, image_index, x, haty, (xscale * abs(image_xscale)) / 2, image_yscale / 2, image_angle, image_blend, image_alpha);

if (global.holiday == "SCARY")
    draw_sprite_ext(spr_scaryhat, image_index, x, y, xscale * abs(image_xscale), image_yscale, image_angle, image_blend, image_alpha);

var font = font_add_sprite_ext(global.fontspritee, global.fontcharacterss, 1, 0);
draw_set_font(font);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_sprite_ext(spr_boss_vulnerable_0, fistframe, x, y, abs(image_xscale), image_yscale, image_angle, image_blend, vulnerablespritealpha);
var mask = global.showmaskorhitbox;

if (mask)
    draw_sprite_ext(mask_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.5);
