smallnumber = font_add_sprite_ext(spr_smallnumber, "1234567890", 1, 0);
draw_set_font(smallnumber);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_set_alpha(image_alpha);
draw_text(x, y, number);
draw_set_alpha(1);
