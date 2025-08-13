if (obj_player.character == "N")
    pal_swap_set(obj_player.spr_palette, obj_player.paletteselect, 0);
else
    pal_swap_set(664, 1, 0);

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
shader_reset();
var mask = global.showmaskorhitbox;

if (mask)
    draw_sprite_ext(mask_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.5);
