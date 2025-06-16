if (pause == 1)
{
    draw_rectangle_color(0, 0, 960, 540, c_black, c_black, c_black, c_black, 0);
    font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:", 1, 0);
    draw_set_alpha(0.5);
    draw_sprite_tiled(spr_stupidahhfuckingbg, -1, x1, y1);
    draw_set_alpha(1);
    draw_set_font(font);
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    
    if (selected == 0)
        draw_text_colour(480, 100, "RESUME", c_white, c_white, c_white, c_white, 1);
    else
        draw_text_colour(480, 100, "RESUME", c_white, c_white, c_white, c_white, 0.5);
    
    if (selected == 1)
        draw_text_colour(480, 150, "RESTART", c_white, c_white, c_white, c_white, 1);
    else
        draw_text_colour(480, 150, "RESTART", c_white, c_white, c_white, c_white, 0.5);
    
    if (selected == 2)
        draw_text_colour(480, 200, "OPTIONS", c_white, c_white, c_white, c_white, 1);
    else
        draw_text_colour(480, 200, "OPTIONS", c_white, c_white, c_white, c_white, 0.5);
    
    if (selected == 3)
        draw_text_colour(480, 250, "MOD CONFIG", c_white, c_white, c_white, c_white, 1);
    else
        draw_text_colour(480, 250, "MOD CONFIG", c_white, c_white, c_white, c_white, 0.5);
    
    if (selected == 4)
        draw_text_colour(480, 300, "EXIT LEVEL", c_white, c_white, c_white, c_white, 1);
    else
        draw_text_colour(480, 300, "EXIT LEVEL", c_white, c_white, c_white, c_white, 0.5);
    
    draw_set_halign(fa_left);
    font = font_add_sprite_ext(spr_smallerfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.:?1234567890", 1, 0);
    draw_set_font(font);
    var tr = "LOST";
    
    if (global.hasthetreasure)
        tr = "FOUND";
    
    if (room != Scootertransition && room != hub_room1 && room != cowboytask && room != Titlescreen && room != hub_roomextra && string_letters(room_get_name(room)) != "PProom")
    {
        draw_text_colour(10, 50, "SECRETS FOUND: " + string(global.secretfound) + "\nTREASURE STATUS: " + tr + "\nTOPPINS COLLECTED:", c_white, c_white, c_white, c_white, 1);
        draw_sprite_ext(spr_pizzakinshroom, -1, 30, 100, 1, 1, 0, c_white, global.shroomfollow + 0.25);
        draw_sprite_ext(spr_pizzakincheese, -1, 62, 100, 1, 1, 0, c_white, global.cheesefollow + 0.25);
        draw_sprite_ext(spr_pizzakintomato, -1, 94, 100, 1, 1, 0, c_white, global.tomatofollow + 0.25);
        draw_sprite_ext(spr_pizzakinsausage, -1, 126, 100, 1, 1, 0, c_white, global.sausagefollow + 0.25);
        draw_sprite_ext(spr_pizzakinpineapple, -1, 158, 100, 1, 1, 0, c_white, global.pineapplefollow + 0.25);
    }
}
