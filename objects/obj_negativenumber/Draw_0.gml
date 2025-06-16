var smallnumber = font_add_sprite_ext(spr_stickmoney_font, "0123456789$-", 1, 0);
draw_set_font(smallnumber);
draw_set_halign(fa_center);
draw_set_color(c_red);
draw_set_alpha(image_alpha);
draw_text(x, y, string(number));
draw_set_alpha(1);
