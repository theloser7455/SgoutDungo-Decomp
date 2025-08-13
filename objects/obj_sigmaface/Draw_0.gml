draw_sprite_ext(sprite_index, image_index, x + round(wave(6, -6, 1, 0.5)), y + round(wave(6, -6, 1, 0.25)), 1.4 * image_xscale, 1.4 * image_xscale, image_angle, c_red, image_alpha - 0.75);
draw_sprite_ext(sprite_index, image_index, x + round(wave(-6, 6, 1, 0.5)), y + round(wave(-6, 6, 1, 0.25)), 1.4 * image_xscale, 1.4 * image_xscale, image_angle, c_red, image_alpha - 0.75);
draw_sprite_ext(sprite_index, image_index, x + round(wave(-6, 6, 1, 0.5)), y + round(wave(-6, 6, 1, 0.25)), 1.2 * image_xscale, 1.2 * image_xscale, image_angle, c_red, image_alpha - 0.25);
draw_sprite_ext(sprite_index, image_index, x + round(wave(6, -6, 1, 0.5)), y + round(wave(6, -6, 1, 0.25)), 1.2 * image_xscale, 1.2 * image_xscale, image_angle, c_red, image_alpha - 0.25);
draw_self();
var fa = 0;

with (obj_player)
{
    fa = -distance_to_object(other) / 1440;
    draw_sprite_ext(spr_pizzaface_pointer, image_index, obj_player.x, obj_player.y, 1, 1, point_direction(x, y, other.x, other.y), c_white, 1 + fa);
}

var mask = global.showmaskorhitbox;

if (mask)
    draw_sprite_ext(mask_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.5);
