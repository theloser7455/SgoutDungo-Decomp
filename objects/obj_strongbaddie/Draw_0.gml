draw_sprite_ext(sprite_index, image_index, x, y, xscale, image_yscale, image_angle, image_blend, image_alpha);

if (flash)
{
    shader_set(shd_hit);
    draw_sprite_ext(sprite_index, image_index, x, y, xscale, image_yscale, image_angle, image_blend, image_alpha);
    shader_reset();
}

var haty = bbox_top;

if (mask_index == spr_pepperman_mask)
    haty = bbox_top + 83;

if (global.holiday == "JOLLY")
    draw_sprite_ext(spr_jollyhat, image_index, x, haty, xscale / 2, image_yscale / 2, image_angle, image_blend, image_alpha);

if (global.holiday == "SCARY")
    draw_sprite_ext(spr_scaryhat, image_index, x, y, xscale, image_yscale, image_angle, image_blend, image_alpha);

var font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:", 1, 0);
draw_set_font(font);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(x, y, hp);
