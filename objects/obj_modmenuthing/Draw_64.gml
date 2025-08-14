var g = 0;
ini_open("SGOUTDATA new.ini");
var snicke = ini_read_string("Ranks", "snickchallenge", "null");
var hassnick = 0.25;

if (snicke == "null")
    hassnick = 0;

ini_close();
draw_set_alpha(1 - g);
draw_rectangle_color(0, 0, 960, 540, c_black, c_black, c_black, c_black, 0);
draw_set_alpha(0.5);
draw_sprite_tiled(bg_modconfig, -1, obj_pause.x1, obj_pause.y1);
draw_set_alpha(1);

if (instance_exists(obj_afterimageeditor))
{
}

font = font_add_sprite_ext(global.fontspritee, global.fontcharacterss, 1, 0);
draw_set_font(font);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text_colour(480, yyyy - 75, "PRESS ESC OR " + scr_keyname(global.key_slap) + " TO EXIT", c_white, c_white, c_white, c_white, 1);
var a = "";

if (selected2 == 0)
{
    if (global.attackstyleP == -1)
        a = "NONE";
    
    if (global.attackstyleP == 0)
        a = "SHOULDER BASH";
    
    if (global.attackstyleP == 1)
        a = "BREAKDANCE";
    
    if (global.attackstyleP == 2)
        a = "KARATE";
}
else
{
    if (global.attackstyleP2 == -1)
        a = "NONE";
    
    if (global.attackstyleP2 == 0)
        a = "SHOULDER BASH";
    
    if (global.attackstyleP2 == 1)
        a = "BREAKDANCE";
    
    if (global.attackstyleP2 == 2)
        a = "KARATE";
}

var a2 = "";

if (selected22 == 0)
{
    if (global.attackstyleN == -1)
        a2 = "NONE";
    
    if (global.attackstyleN == 0)
        a2 = "FORK";
    
    if (global.attackstyleN == 1)
        a2 = "JETPACK";
    
    if (global.attackstyleN == 2)
        a2 = "EVIL FUCKING ATTACK THAT SPELLS OUT THE WORD NOISE";
}
else
{
    if (global.attackstyleN2 == -1)
        a2 = "NONE";
    
    if (global.attackstyleN2 == 0)
        a2 = "FORK";
    
    if (global.attackstyleN2 == 1)
        a2 = "JETPACK";
    
    if (global.attackstyleN2 == 2)
        a2 = "EVIL FUCKING ATTACK THAT SPELLS OUT THE WORD NOISE";
}

var b = "";

if (global.lamepalettes == 1)
    b = "OFF";

if (global.lamepalettes == 0)
    b = "ON";

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

if (global.showmaskorhitbox)
    b6 = "SHOWN";
else
    b6 = "HIDDEN";

var b6b = "";

if (global.karatesounds == 0)
    b6b = "OFF";
else
    b6b = "ON";

var b7b = "";

if (global.panicdebriseffect)
    b7b = "ON";
else
    b7b = "OFF";

var b8b = "TRUE";

if (global.climbstairss == 0)
    b8b = "FALSE";

var b9b = "SAGE";

if (global.fontspritee == spr_creditsfont)
    b9b = "MODERN";

if (global.fontspritee == spr_fontimpact)
    b9b = "IMPACT";

if (global.fontspritee == spr_papyrusfont)
    b9b = "PAPYRUS";

if (global.fontspritee == spr_comicsansfont)
    b9b = "COMIC SANS";

if (global.fontspritee == spr_calibrifont)
    b9b = "CALIBRI";

var instantr = "FALSE";

if (global.instantR)
    instantr = "TRUE";

var c = "";
var c2 = "";

if (selected2 == 1)
    c = " 2";

if (selected22 == 1)
    c2 = " 2";

if (selected == 0)
{
    draw_text_colour(480, 100 + yyyy, "PEPPINO ALT ATTACK" + c + ": " + a, c_white, c_white, c_white, c_white, 1);
    draw_sprite_ext(spr_uparrow, -1, 60, 115 + yyyy, 1, 1, 90, c_white, 1);
    draw_sprite_ext(spr_uparrow, -1, 900, 115 + yyyy, 1, 1, -90, c_white, 1);
}
else
{
    draw_text_colour(480, 100 + yyyy, "PEPPINO ALT ATTACK" + c + ": " + a, c_white, c_white, c_white, c_white, 0.5);
    draw_sprite_ext(spr_uparrow, -1, 60, 115 + yyyy, 1, 1, 90, c_white, 0.5);
    draw_sprite_ext(spr_uparrow, -1, 900, 115 + yyyy, 1, 1, -90, c_white, 0.5);
}

if (selected == 1)
{
    draw_text_colour(480, 150 + yyyy, "NOISE ALT ATTACK" + c2 + ": " + a2, c_white, c_white, c_white, c_white, 1);
    draw_sprite_ext(spr_uparrow, -1, 80, 165 + yyyy, 1, 1, 90, c_white, 1);
    draw_sprite_ext(spr_uparrow, -1, 880, 165 + yyyy, 1, 1, -90, c_white, 1);
}
else
{
    draw_text_colour(480, 150 + yyyy, "NOISE ALT ATTACK" + c2 + ": " + a2, c_white, c_white, c_white, c_white, 0.5);
    draw_sprite_ext(spr_uparrow, -1, 80, 165 + yyyy, 1, 1, 90, c_white, 0.5);
    draw_sprite_ext(spr_uparrow, -1, 880, 165 + yyyy, 1, 1, -90, c_white, 0.5);
}

if (selected == 2)
    draw_text_colour(480, 200 + yyyy, "UNIQUE PALETTE SFX: " + b, c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(480, 200 + yyyy, "UNIQUE PALETTE SFX: " + b, c_white, c_white, c_white, c_white, 0.5);

if (selected == 3)
    draw_text_colour(480, 250 + yyyy, "FUCKED UP CAMERA: " + b2, c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(480, 250 + yyyy, "FUCKED UP CAMERA: " + b2, c_white, c_white, c_white, c_white, 0.5);

if (!global.deathmode)
{
    if (selected == 4)
        draw_text_colour(480, 300 + yyyy, "PIZZAFACE CHASING: " + b3, c_white, c_white, c_white, c_white, 1);
    else
        draw_text_colour(480, 300 + yyyy, "PIZZAFACE CHASING: " + b3, c_white, c_white, c_white, c_white, 0.25 + hassnick);
}
else
{
    draw_text_colour(480, 300 + yyyy, "WHAT DO YOU THINK YOU'RE DOING?", c_white, c_white, c_white, c_white, 0.25);
}

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
    draw_text_colour(480, 550 + yyyy, "PANIC DEBRIS: " + b7b, c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(480, 550 + yyyy, "PANIC DEBRIS: " + b7b, c_white, c_white, c_white, c_white, 0.5);

if (selected == 10)
    draw_text_colour(480, 600 + yyyy, "HITBOXES N MASKS: " + b6, c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(480, 600 + yyyy, "HITBOXES N MASKS: " + b6, c_white, c_white, c_white, c_white, 0.5);

if (selected == 11)
{
    draw_text_colour(480, 650 + yyyy, "ZOOM: " + string(global.globalzoom), c_white, c_white, c_white, c_white, 1);
    draw_sprite_ext(spr_uparrow, -1, 280, 670 + yyyy, 1, 1, 90, c_white, 1);
    draw_sprite_ext(spr_uparrow, -1, 680, 670 + yyyy, 1, 1, -90, c_white, 1);
}
else
{
    draw_text_colour(480, 650 + yyyy, "ZOOM: " + string(global.globalzoom), c_white, c_white, c_white, c_white, 0.5);
    draw_sprite_ext(spr_uparrow, -1, 280, 670 + yyyy, 1, 1, 90, c_white, 1);
    draw_sprite_ext(spr_uparrow, -1, 680, 670 + yyyy, 1, 1, -90, c_white, 1);
}

if (selected == 12)
    draw_text_colour(480, 700 + yyyy, "CLIMB STAIRS SPRITE ON SLOPES: " + b8b, c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(480, 700 + yyyy, "CLIMB STAIRS SPRITE ON SLOPES: " + b8b, c_white, c_white, c_white, c_white, 0.5);

if (selected == 13)
    draw_text_colour(480, 750 + yyyy, "FONT: " + b9b, c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(480, 750 + yyyy, "FONT: " + b9b, c_white, c_white, c_white, c_white, 0.5);

var c9b = "PT SOUNDS";

if (global.butchermus == 1)
    c9b = "SOUNDFONT";

if (selected == 14)
    draw_text_colour(480, 800 + yyyy, "BUTCHER VANITY MUS: " + c9b, c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(480, 800 + yyyy, "BUTCHER VANITY MUS: " + c9b, c_white, c_white, c_white, c_white, 0.5);

if (selected == 15)
    draw_text_colour(480, 850 + yyyy, "INSTANT RESPAWN: " + instantr, c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(480, 850 + yyyy, "INSTANT RESPAWN: " + instantr, c_white, c_white, c_white, c_white, 0.5);

if (selected == 16)
    draw_text_colour(480, 900 + yyyy, "STRECH MULTIPLIER: " + string(global.strechmulti), c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(480, 900 + yyyy, "STRECH MULTIPLIER: " + string(global.strechmulti), c_white, c_white, c_white, c_white, 0.5);
