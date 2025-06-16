draw_set_alpha(0.25);
draw_set_color(image_blend);
draw_rectangle(0, 0, __view_get(0, 0) + __view_get(2, 0), __view_get(1, 0) + __view_get(3, 0), false);
draw_set_alpha(1);
