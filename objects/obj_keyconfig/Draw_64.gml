draw_rectangle_color(0, 0, 960, 540, c_black, c_black, c_black, c_black, 0);
draw_set_alpha(0.5);
draw_sprite_tiled(spr_stupidahhfuckingbg, -1, obj_option.x1, obj_option.y1);
draw_set_alpha(1);

if (key_select == -1)
    draw_text_colour(280, 50, "BACK", c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(280, 50, "BACK", c_white, c_white, c_white, c_white, 0.5);

if (key_select == 0)
    draw_text_colour(420, 50, "UP", c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(420, 50, "UP", c_white, c_white, c_white, c_white, 0.5);

draw_text(580, 50, scr_keyname(global.key_up));

if (key_select == 1)
    draw_text_colour(420, 100, "DOWN", c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(420, 100, "DOWN", c_white, c_white, c_white, c_white, 0.5);

draw_text(580, 100, scr_keyname(global.key_down));

if (key_select == 2)
    draw_text_colour(420, 150, "RIGHT", c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(420, 150, "RIGHT", c_white, c_white, c_white, c_white, 0.5);

draw_text(580, 150, scr_keyname(global.key_right));

if (key_select == 3)
    draw_text_colour(420, 200, "LEFT", c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(420, 200, "LEFT", c_white, c_white, c_white, c_white, 0.5);

draw_text(580, 200, scr_keyname(global.key_left));

if (key_select == 4)
    draw_text_colour(420, 250, "JUMP", c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(420, 250, "JUMP", c_white, c_white, c_white, c_white, 0.5);

draw_text(580, 250, scr_keyname(global.key_jump));

if (key_select == 5)
    draw_text_colour(420, 300, "GRAB", c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(420, 300, "GRAB", c_white, c_white, c_white, c_white, 0.5);

draw_text(580, 300, scr_keyname(global.key_slap));

if (key_select == 6)
    draw_text_colour(420, 350, "DASH", c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(420, 350, "DASH", c_white, c_white, c_white, c_white, 0.5);

draw_text(580, 350, scr_keyname(global.key_attack));

if (key_select == 7)
    draw_text_colour(420, 400, "TAUNT", c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(420, 400, "TAUNT", c_white, c_white, c_white, c_white, 0.5);

draw_text(580, 400, scr_keyname(global.key_taunt));

if (key_select == 8)
    draw_text_colour(420, 450, "PAUSE", c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(420, 450, "PAUSE", c_white, c_white, c_white, c_white, 0.5);

draw_text(580, 450, scr_keyname(global.key_start));

if (key_select == 9)
    draw_text_colour(420, 500, "ALT ATTACK", c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(420, 500, "ALT ATTACK", c_white, c_white, c_white, c_white, 0.5);

draw_text(580, 500, scr_keyname(global.key_punch));
