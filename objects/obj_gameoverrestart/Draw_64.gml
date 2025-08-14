draw_set_color(c_black);
draw_set_alpha(alpha);
font = font_add_sprite_ext(global.fontspritee, global.fontcharacterss, true, 0);
draw_set_font(font);
draw_set_halign(fa_center);

if (global.instantR)
    draw_set_color(c_white);

draw_rectangle(0, 0, __view_get(0, 0) + __view_get(2, 0), __view_get(1, 0) + __view_get(3, 0), false);

if (!global.instantR)
{
    draw_text_colour(480, 75, "GAME OVER", c_white, c_white, c_white, c_white, alpha);
    draw_text_colour(480, 440, scr_keyname(global.key_slap) + " TO RESTART \n" + scr_keyname(global.key_jump) + " TO EXIT", c_white, c_white, c_white, c_white, alpha);
    draw_sprite_ext(sprite_index, image_index, 480, 270, 1, 1, image_angle, image_blend, alpha);
}

draw_set_alpha(1);
draw_set_color(c_white);
