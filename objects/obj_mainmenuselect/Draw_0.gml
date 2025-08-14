font = font_add_sprite_ext(global.fontspritee, global.fontcharacterss, true, 0);
draw_set_alpha(0.5);
draw_set_alpha(1);
draw_set_font(font);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text_colour(180, 398, "START GAME", c_white, c_white, c_white, c_white, 1 - m);
draw_text_colour(480, 448, "OPTION", c_white, c_white, c_white, c_white, 1 - m1);
draw_text_colour(780, 398, "ERASE DATA", c_white, c_white, c_white, c_white, 1 - m2);
