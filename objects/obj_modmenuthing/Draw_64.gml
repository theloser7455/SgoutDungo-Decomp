draw_rectangle_color(0, 0, 960, 540, c_black, c_black, c_black, c_black, 0);
draw_set_alpha(0.5);
draw_sprite_tiled(spr_stupidahhfuckingbg, -1, obj_pause.x1, obj_pause.y1);
draw_set_alpha(1);

if (instance_exists(obj_afterimageeditor))
{
}

font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:", 1, 0);
draw_set_font(font);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text_colour(480, yyyy - 75, "PRESS ESC OR " + scr_keyname(global.key_slap) + " TO EXIT", c_white, c_white, c_white, c_white, 1);
var a = "";

if (global.attackstyleP == -1)
    a = "NONE";

if (global.attackstyleP == 0)
    a = "SHOULDER BASH";

if (global.attackstyleP == 1)
    a = "BREAKDANCE";

if (global.attackstyleP == 2)
    a = "KARATE";

var a2 = "";

if (global.attackstyleN == -1)
    a2 = "NONE";

if (global.attackstyleN == 0)
    a2 = "FORK";

if (global.attackstyleN == 1)
    a2 = "JETPACK";

if (global.attackstyleN == 2)
    a2 = "CAPE";

var b = "";

if (global.coolsnick == 1)
    b = "BOSS LIKE";

if (global.coolsnick == 0)
    b = "STANDARD";

var b2 = "";

if (global.pizdec == 1)
    b2 = "TRUE";

if (global.pizdec == 0)
    b2 = "FALSE";

var b3 = "";

if (global.pizzafacechasestyle == 0)
    b3 = "SLINGSHOT";

if (global.pizzafacechasestyle == 1)
    b3 = "VANILLA";

if (global.pizzafacechasestyle == 2)
    b3 = "8 DIRECTIONS";

var b4 = "";

if (global.peakcancel)
    b4 = "YAN'S MASTERPIECE";
else
    b4 = "NORMAL";

var b5 = "";

if (global.supertaunt == 0)
    b5 = "INVISIBLE";

if (global.supertaunt == 1)
    b5 = "SAGE";

if (global.supertaunt == 2)
    b5 = "ELECTRIC";

if (global.supertaunt == 3)
    b5 = "EXPLODE";

var b6 = "";

if (global.gremlinpersonality == 0)
    b6 = "NOISE";

if (global.gremlinpersonality == 1)
    b6 = "PRETTY FELLOW";

if (global.gremlinpersonality == 2)
    b6 = "LOBOTOZELLE 2";

var b6b = "";

if (global.karatesounds == 0)
    b6b = "OFF";
else
    b6b = "ON";

if (global.panicbg)
    b7b = "ON";
else
    b7b = "OFF";

if (selected == 0)
    draw_text_colour(480, 100 + yyyy, "PEPPINO ALT ATTACK: " + a, c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(480, 100 + yyyy, "PEPPINO ALT ATTACK: " + a, c_white, c_white, c_white, c_white, 0.5);

if (selected == 1)
    draw_text_colour(480, 150 + yyyy, "NOISE ALT ATTACK: " + a2, c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(480, 150 + yyyy, "NOISE ALT ATTACK: " + a2, c_white, c_white, c_white, c_white, 0.5);

if (selected == 2)
    draw_text_colour(480, 200 + yyyy, "SNICK EXE MOVEMENT: " + b, c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(480, 200 + yyyy, "SNICK EXE MOVEMENT: " + b, c_white, c_white, c_white, c_white, 0.25);

if (selected == 3)
    draw_text_colour(480, 250 + yyyy, "FUCKED UP CAMERA: " + b2, c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(480, 250 + yyyy, "FUCKED UP CAMERA: " + b2, c_white, c_white, c_white, c_white, 0.5);

if (selected == 4)
    draw_text_colour(480, 300 + yyyy, "PIZZAFACE CHASING: " + b3, c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(480, 300 + yyyy, "PIZZAFACE CHASING: " + b3, c_white, c_white, c_white, c_white, 0.25);

if (selected == 5)
    draw_text_colour(480, 350 + yyyy, "PEP SJUMP CANCEL SPR: " + b4, c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(480, 350 + yyyy, "PEP SJUMP CANCEL SPR: " + b4, c_white, c_white, c_white, c_white, 0.5);

if (selected == 6)
    draw_text_colour(480, 400 + yyyy, "SUPERTAUNT EFFECT: " + b5, c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(480, 400 + yyyy, "SUPERTAUNT EFFECT: " + b5, c_white, c_white, c_white, c_white, 0.5);

if (selected == 7)
    draw_text_colour(480, 450 + yyyy, "KARATE ATTACK SOUNDS: " + b6b, c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(480, 450 + yyyy, "KARATE ATTACK SOUNDS: " + b6b, c_white, c_white, c_white, c_white, 0.5);

if (selected == 8)
    draw_text_colour(480, 500 + yyyy, "AFTERIMAGE EDITOR", c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(480, 500 + yyyy, "AFTERIMAGE EDITOR", c_white, c_white, c_white, c_white, 0.5);

if (selected == 9)
    draw_text_colour(480, 550 + yyyy, "PANIC SHADER: " + b7b, c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(480, 550 + yyyy, "PANIC SHADER: " + b7b, c_white, c_white, c_white, c_white, 0.5);
