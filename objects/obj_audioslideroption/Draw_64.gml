draw_rectangle_color(0, 0, 960, 540, c_black, c_black, c_black, c_black, 0);
draw_set_alpha(0.5);
draw_sprite_tiled(spr_stupidahhfuckingbg, -1, x1, y1);
draw_set_alpha(1);
var font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:", 1, 0);
draw_set_font(font);
draw_set_halign(fa_center);
draw_set_color(c_white);

if (selected == 0)
    draw_text_colour(480, 100, "BACK", c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(480, 100, "BACK", c_white, c_white, c_white, c_white, 0.5);

if (selected == 1)
    draw_text_colour(480, 150, "SFX: " + string(global.audiosfxvol), c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(480, 150, "SFX: " + string(global.audiosfxvol), c_white, c_white, c_white, c_white, 0.5);

if (selected == 2)
    draw_text_colour(480, 200, "MUSIC: " + string(global.audiomusvol), c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(480, 200, "MUSIC: " + string(global.audiomusvol), c_white, c_white, c_white, c_white, 0.5);
