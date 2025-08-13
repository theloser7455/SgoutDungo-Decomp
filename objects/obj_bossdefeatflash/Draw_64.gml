draw_set_color(c_white);

if (jsblack)
    draw_set_color(c_black);

draw_set_alpha(fadealpha);

if (!blamesomoneveryspecific)
    draw_rectangle(0, 0, __view_get(0, 0) + __view_get(2, 0), __view_get(1, 0) + __view_get(3, 0), false);
else
    draw_sprite_tiled(blamekiwuma, 0, 480, 0);

draw_set_alpha(1);
draw_set_color(c_white);
