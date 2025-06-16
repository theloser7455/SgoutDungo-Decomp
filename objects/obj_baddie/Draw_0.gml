draw_self();

if (flash)
{
    shader_set(shd_hit);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    shader_reset();
}

if (global.holiday == "JOLLY")
    draw_sprite_ext(spr_jollyhat, image_index, x, bbox_top, image_xscale / 2, image_yscale / 2, image_angle, image_blend, image_alpha);

if (global.holiday == "SCARY")
    draw_sprite_ext(spr_scaryhat, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
