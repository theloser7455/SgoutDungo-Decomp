draw_set_alpha(1);
font = font_add_sprite_ext(global.fontspritee, global.fontcharacterss, 1, 0);
draw_set_font(font);
draw_set_halign(fa_center);
draw_set_color(c_white);

if (instance_exists(obj_pizzaball))
    draw_text(832, 300, string_hash_to_newline(string(global.golfhit) + " " + "GOLF HIT"));

draw_text(xi, yi, string_hash_to_newline(message));

if (message == "RESPONSIBILITY \n👀")
    draw_sprite(spr_eyesemoji, 0, xi - 16, yi + 32 + v);

if (message == "👀👨‍🦲")
    draw_sprite(snickcrying, 0, xi, yi + 16);

var roomname = room_get_name(room);

if (room == Titlescreen || room == hub_room1 || room == rm_fakeloading || room == hub_roomextra || room == cowboytask || room == Scootertransition || room == rm_contentunlocked || string_letters(roomname) == "PProom" || instance_exists(obj_bosscontrol) || room == creDIHts || room == timesuproom || global.snickchallenge || global.difficulty == 1 || room == rm_DIHsclaimer || instance_exists(obj_gameoverrestart))
    exit;

draw_sprite_ext(tvsprite, -1, 832 + random_range(-shakething, shakething), 74 + random_range(-shakethingv, shakethingv), 1, 1, 1, c_white, alpha);

if (tvsprite == spr_tvdefault)
{
    chose = 0;
    var dih = 0;
    
    if (global.fontspritee == spr_creditsfont)
        dih = -10;
    else if (global.fontspritee == spr_fontimpact)
        dih = -16;
    
    if (room != boss_room1 && room != rank_room)
        draw_text(832 + random_range(-shakething, shakething), 60 + dih, string_hash_to_newline(global.collect));
}

draw_set_alpha(1);
