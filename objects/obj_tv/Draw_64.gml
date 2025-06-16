draw_set_alpha(1);
font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:", 1, 0);
draw_set_font(font);
draw_set_halign(fa_center);
draw_set_color(c_white);

if (instance_exists(obj_pizzaball))
    draw_text(832, 300, string_hash_to_newline(string(global.golfhit) + " " + "GOLF HIT"));

draw_text(xi, yi, string_hash_to_newline(message));
var roomname = room_get_name(room);

if (room == Titlescreen || room == hub_room1 || room == cowboytask || room == Scootertransition || instance_exists(obj_strongbaddie) || room == rm_contentunlocked || string_letters(roomname) == "PProom" || string_letters(roomname) == "PProom" || room == creDIHts)
    exit;

if (!global.snickchallenge)
    draw_sprite_ext(tvsprite, -1, 832, 74, 1, 1, 1, c_white, alpha);

if (tvsprite == spr_tvdefault)
{
    chose = 0;
    
    if (room != boss_room1 && !global.snickchallenge && room != rank_room)
        draw_text(832, 60, string_hash_to_newline(global.collect));
}

draw_set_alpha(1);
