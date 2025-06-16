draw_sprite_tiled(bg_titlesky, 0, 0, 0);
draw_sprite_tiled(bg_sagetitle, 0, 0, 48);
draw_rectangle_color(0, 0, 960, 270, c_black, c_black, c_black, c_black, 0);
var font = font_add_sprite_ext(spr_smallerfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.:?1234567890", 1, 0);
draw_set_font(font);
draw_set_halign(fa_right);
draw_set_color(c_white);
draw_text_colour(960, 75, "PRESS ESC OR " + scr_keyname(global.key_slap) + " TO EXIT \n" + scr_keyname(global.key_taunt) + " TO CHANGE AFTERIMAGE \n" + scr_keyname(global.key_left) + " AND " + scr_keyname(global.key_right) + " TO CHOOSE WHAT RGB VALUE TO CHANGE \n" + scr_keyname(global.key_up) + " AND " + scr_keyname(global.key_down) + " TO CHANGE RGB VALUES \n " + scr_keyname(global.key_punch) + " TO RESET TO DEFAULT \n a", c_white, c_white, c_white, c_white, 1);
var q = 0.5;
var q1 = 0.5;
var q2 = 0.5;
var q3 = 0.5;

if (afterimage == "mach1")
    q = 1;

if (afterimage == "mach2")
    q1 = 2;

if (afterimage == "pepattack")
    q2 = 1;

if (afterimage == "Nattack")
    q3 = 1;

ini_open("SGOUTDATA.ini");
font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:", 1, 0);
draw_set_font(font);
draw_set_halign(fa_center);
draw_sprite_ext(spr_player_mach4, 0, 280, 450, image_xscale, image_yscale, image_angle, make_color_rgb(ini_read_real("afterimages", "mach1 R", 1), ini_read_real("afterimages", "mach1 G", 1), ini_read_real("afterimages", "mach1 B", 1)), q);
draw_sprite_ext(spr_player_mach4, 0, 400, 450, image_xscale, image_yscale, image_angle, make_color_rgb(ini_read_real("afterimages", "mach2 R", 1), ini_read_real("afterimages", "mach2 G", 1), ini_read_real("afterimages", "mach2 B", 1)), q1);
draw_sprite_ext(spr_player_attackdash, 2, 520, 450, image_xscale, image_yscale, image_angle, make_color_rgb(ini_read_real("afterimages", "pepattack R", 1), ini_read_real("afterimages", "pepattack G", 1), ini_read_real("afterimages", "pepattack B", 1)), q2);
draw_sprite_ext(spr_playerN_wallbounce, 0, 640, 450, image_xscale, image_yscale, image_angle, make_color_rgb(ini_read_real("afterimages", "Nattack R", 1), ini_read_real("afterimages", "Nattack G", 1), ini_read_real("afterimages", "Nattack B", 1)), q3);
var a = 0.5;
var b = 0.5;
var c = 0.5;

if (selected == " R")
    a = 1;

if (selected == " G")
    b = 1;

if (selected == " B")
    c = 1;

draw_text_colour(410, 270, "R", c_white, c_white, c_white, c_white, a);
draw_text_colour(410, 300, ini_read_real("afterimages", afterimage + " R", 1), c_white, c_white, c_white, c_white, a);
draw_text_colour(480, 270, "G", c_white, c_white, c_white, c_white, b);
draw_text_colour(480, 300, ini_read_real("afterimages", afterimage + " G", 1), c_white, c_white, c_white, c_white, b);
draw_text_colour(550, 270, "B", c_white, c_white, c_white, c_white, c);
draw_text_colour(550, 300, ini_read_real("afterimages", afterimage + " B", 1), c_white, c_white, c_white, c_white, c);
ini_close();
