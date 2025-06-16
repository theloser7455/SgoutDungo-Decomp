draw_set_font(font1);
var type = 0;

if (type)
    draw_text(480, 270, keyboard_string);

var showspeed = 0;

if (showspeed)
{
    draw_text(480, 440, obj_player1.momemtum);
    draw_text(480, 460, obj_player1.movespeed);
}

var roomname = room_get_name(room);

if (room == Titlescreen || room == hub_room1 || room == cowboytask || room == Scootertransition || instance_exists(obj_strongbaddie) || room == rm_contentunlocked || string_letters(roomname) == "PProom" || string_letters(roomname) == "PProom" || room == creDIHts)
    exit;

pal_swap_set(obj_player.spr_palette, obj_player.paletteselect, 0);

if (obj_player.backupweapon == 1)
    draw_sprite_ext(spr_shotgunbackup, -1, 50, 100, 1, 1, 1, c_white, alpha);

if (obj_player.state != 54)
{
    if (obj_player.character != "S" && obj_player.character != "R")
    {
        if (obj_player.sprite_index == spr_knightpep_thunder)
            draw_sprite_ext(hudthunder, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (obj_player.sprite_index != spr_knightpep_start && (obj_player.state == 23 || obj_player.state == 17))
            draw_sprite_ext(hudknight, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (obj_player.sprite_index == spr_bombpep_end)
            draw_sprite_ext(hudbombend, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (instance_exists(obj_itspizzatime) || obj_player.sprite_index == spr_bombpep_intro || obj_player.sprite_index == spr_bombpep_runabouttoexplode || obj_player.sprite_index == spr_bombpep_run || obj_player.sprite_index == spr_player_fireass)
            draw_sprite_ext(hudscream, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (obj_player.state == 91 || (obj_player.state == 76 && shake_mag > 0))
            draw_sprite_ext(hudstun, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (obj_player.sprite_index == spr_player_victory || obj_player.state == 55 || obj_player.state == 61 || obj_player.state == 22 || (obj_player.state == 53 && obj_player.sprite_index == spr_player_levelcomplete))
            draw_sprite_ext(hudhappy, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (obj_player.sprite_index == spr_player_machroll || obj_player.sprite_index == spr_player_tumble)
            draw_sprite_ext(hudrolling, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (global.combo >= 10 && (obj_player.state == 0 || obj_player.state == 65 || obj_player.state == 66 || obj_player.state == 57))
            draw_sprite_ext(hudmenacing, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (obj_player.state == 68 || obj_player.state == 32 || obj_player.state == 90 || obj_player.state == 73 || obj_player.state == 56 || obj_player.state == 62 || obj_player.state == 41 || obj_player.state == 64 || obj_player.state == 45 || obj_player.state == 46 || obj_player.state == 50 || obj_player.state == 47 || obj_player.state == 48 || obj_player.state == 49)
            draw_sprite_ext(hudmach1, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (obj_player.state == 69 || obj_player.sprite_index == spr_player_dive || obj_player.sprite_index == spr_player_machslideboost || obj_player.state == 16 || obj_player.state == 21 || obj_player.state == 42)
            draw_sprite_ext(hudmach2, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (obj_player.state == 89 && obj_player.sprite_index == spr_player_crazyrun)
            draw_sprite_ext(hudmach4, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (obj_player.state == 89 || obj_player.sprite_index == spr_player_machslideboost3)
            draw_sprite_ext(hudmach3, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (obj_player.state == 72 || obj_player.sprite_index == spr_bombpep_end || obj_player.sprite_index == spr_player_fireassend || obj_player.state == 35 || obj_player.state == 26 || (obj_player.state == 53 && obj_player.sprite_index == spr_player_bossintro) || (obj_player.state == 53 && obj_player.sprite_index == spr_player_idle))
            draw_sprite_ext(hudhurt, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (obj_player.angry == 1)
            draw_sprite_ext(hud3hp, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (obj_player.sprite_index == spr_player_hurtidle || obj_player.sprite_index == spr_player_hurtwalk)
            draw_sprite_ext(hud1hp, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (global.panic == 1 || global.snickchallenge == 1)
            draw_sprite_ext(hudpanic, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (obj_player.sprite_index == spr_shotgun_pullout)
            draw_sprite_ext(hudmenacing, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else
            draw_sprite_ext(hudidle, -1, 125, 100, 1, 1, 1, c_white, alpha);
    }
    
    if (obj_player.character == "S")
        draw_sprite_ext(spr_snickHUD, -1, 125, 60, 1, 1, 1, c_white, alpha);
    
    if (obj_player.character == "R")
    {
        draw_text(742, 300, obj_player1.enemiesswallowed);
        draw_sprite_ext(spr_ratHUD, -1, 842, 380, 2, 2, 0, c_white, alpha);
    }
    
    shader_reset();
    
    if (obj_player1.character != "R")
    {
        if (obj_player.movespeed < 2.4 || !(obj_player.state == 68 || obj_player.state == 69 || obj_player.state == 89 || obj_player.state == 16 || obj_player.state == 70 || obj_player.state == 36 || obj_player.state == 21))
            draw_sprite_ext(spr_speedbar, 0, 125, 140, 1, 1, 1, c_white, alpha);
        else if (obj_player.movespeed >= 2.4 && obj_player.movespeed < 4.8 && (obj_player.state == 68 || obj_player.state == 69 || obj_player.state == 89 || obj_player.state == 16 || obj_player.state == 70 || obj_player.state == 36 || obj_player.state == 21))
            draw_sprite_ext(spr_speedbar, 1, 125, 140, 1, 1, 1, c_white, alpha);
        else if (obj_player.movespeed >= 4.8 && obj_player.movespeed < 7.2 && (obj_player.state == 68 || obj_player.state == 69 || obj_player.state == 89 || obj_player.state == 16 || obj_player.state == 70 || obj_player.state == 36 || obj_player.state == 21))
            draw_sprite_ext(spr_speedbar, 2, 125, 140, 1, 1, 1, c_white, alpha);
        else if (obj_player.movespeed >= 7.2 && obj_player.movespeed < 9.6 && (obj_player.state == 68 || obj_player.state == 69 || obj_player.state == 89 || obj_player.state == 16 || obj_player.state == 70 || obj_player.state == 36 || obj_player.state == 21))
            draw_sprite_ext(spr_speedbar, 3, 125, 140, 1, 1, 1, c_white, alpha);
        else if (obj_player.movespeed >= 9.6 && obj_player.movespeed < 12 && (obj_player.state == 68 || obj_player.state == 69 || obj_player.state == 89 || obj_player.state == 16 || obj_player.state == 70 || obj_player.state == 36 || obj_player.state == 21))
            draw_sprite_ext(spr_speedbar, 4, 125, 140, 1, 1, 1, c_white, alpha);
        else if (obj_player.movespeed >= 12 && (obj_player.state == 68 || obj_player.state == 69 || obj_player.state == 89 || obj_player.state == 16 || obj_player.state == 70 || obj_player.state == 36 || obj_player.state == 21))
            draw_sprite_ext(spr_speedbarmax, -1, 125, 140, 1, 1, 1, c_white, alpha);
    }
    
    if (obj_player.y < 200 && obj_player.x < 200)
        alpha = 0.5;
    else
        alpha = 1;
    
    var ding = 0;
    
    if (global.collect < global.crank)
        ding = 0;
    
    if (global.collect >= global.crank)
        ding = 1;
    
    if (global.collect >= global.brank)
        ding = 2;
    
    if (global.collect >= global.arank)
        ding = 3;
    
    if (global.collect >= global.srank)
        ding = 4;
    
    if (global.secretfound >= 6 && !global.combodropped && global.hasthetreasure == 1 && global.collect >= global.srank)
        ding = 5;
    
    if (!global.snickchallenge)
    {
        draw_sprite_ext(spr_ranks_hud, ding, 225, 75, 1, 1, 1, c_white, alpha);
        font = font_add_sprite_ext(spr_combofont, "X1234567890", 1, 0);
        draw_set_font(font);
        draw_set_halign(fa_center);
        draw_set_color(c_white);
        draw_sprite_ext(spr_combotimer_hud, 0, combox, 0, 1, 1, 1, c_white, alpha);
        draw_sprite_ext(spr_combotimer_hud2, 0, (combox - 0) + round(global.combotime), round(wave(2.5, -2.5, 1, 0.25)), 1, 1, 1, c_white, alpha);
        draw_text(combox - 50, 225, "X" + string(global.combo));
    }
    
    font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:", 1, 0);
    draw_set_font(font);
    
    if (global.panic == 1 || global.snickchallenge == 1 || global.draintime)
    {
        if (global.seconds < 10)
        {
            if (global.minutes < 1)
                draw_set_color(c_red);
            else
                draw_set_color(c_white);
            
            draw_text(480, 425, string_hash_to_newline(string(global.minutes) + ":0" + string(global.seconds)));
        }
        else if (global.seconds >= 10)
        {
            if (global.minutes < 1)
                draw_set_color(c_red);
            else
                draw_set_color(c_white);
            
            draw_text(480, 425, string_hash_to_newline(string(global.minutes) + ":" + string(global.seconds)));
        }
    }
    
    if (global.key_inv == 1)
        draw_sprite_ext(spr_key, -1, 50, 200, 1, 1, 1, c_white, alpha);
    
    draw_sprite_ext(spr_inv, -1, 50, 200, 1, 1, 1, c_white, alpha);
}

draw_set_blend_mode(bm_normal);
