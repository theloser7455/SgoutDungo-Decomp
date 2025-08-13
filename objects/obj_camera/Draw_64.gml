if (file_exists("green.zip"))
{
    draw_set_alpha(0.25);
    draw_set_color(c_lime);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

if (file_exists("red.zip"))
{
    draw_set_alpha(0.25);
    draw_set_color(c_red);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

if (file_exists("orange.zip"))
{
    draw_set_alpha(0.25);
    draw_set_color(c_orange);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

if (file_exists("blue.zip"))
{
    draw_set_alpha(0.25);
    draw_set_color(c_blue);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

if (file_exists("yellow.zip"))
{
    draw_set_alpha(0.25);
    draw_set_color(c_yellow);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

if (file_exists("purple.zip"))
{
    draw_set_alpha(0.25);
    draw_set_color(c_purple);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

if (file_exists("white.zip"))
{
    draw_set_alpha(0.25);
    draw_set_color(c_white);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

if (file_exists("black.zip"))
{
    draw_set_alpha(0.25);
    draw_set_color(c_black);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

if (file_exists("pink.zip"))
{
    draw_set_alpha(0.25);
    draw_set_color(make_color_rgb(255, 192, 203));
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

if (file_exists("glaucous.zip"))
{
    draw_set_alpha(0.25);
    draw_set_color(make_color_rgb(96, 130, 182));
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

if (file_exists("mikado.zip"))
{
    draw_set_alpha(0.25);
    draw_set_color(make_color_rgb(255, 196, 12));
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

if (file_exists("universityofpennsylvaniared.zip"))
{
    draw_set_alpha(0.25);
    draw_set_color(make_color_rgb(153, 0, 0));
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

if (file_exists("mint.zip"))
{
    draw_set_alpha(0.25);
    draw_set_color(make_color_rgb(62, 180, 137));
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

if (file_exists("internationalorange.zip"))
{
    draw_set_alpha(0.25);
    draw_set_color(make_color_rgb(255, 79, 0));
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

if (file_exists("neonpink.zip"))
{
    draw_set_alpha(0.25);
    draw_set_color(make_color_rgb(255, 16, 240));
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

if (file_exists("brown.zip"))
{
    draw_set_alpha(0.25);
    draw_set_color(make_color_rgb(139, 69, 19));
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

if (file_exists("olive.zip"))
{
    draw_set_alpha(0.25);
    draw_set_color(c_olive);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

if (file_exists("fuchsia.zip"))
{
    draw_set_alpha(0.25);
    draw_set_color(c_fuchsia);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

if (file_exists("lime.zip"))
{
    draw_set_alpha(0.25);
    draw_set_color(c_lime);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

if (file_exists("navy.zip"))
{
    draw_set_alpha(0.25);
    draw_set_color(c_navy);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

if (file_exists("gay.zip"))
{
    draw_set_alpha(0.25);
    draw_sprite_tiled(spr_gay, 0, 480, 270);
    draw_set_alpha(1);
}

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

var showsong = 0;

if (showsong)
{
    draw_text(480, 270, lerpH);
    draw_text(480, 300, zoomF);
}

var roomname = room_get_name(room);

if (room == Titlescreen || room == hub_room1 || room == hub_roomextra || room == cowboytask || room == Scootertransition || room == rm_contentunlocked || string_letters(roomname) == "PProom" || instance_exists(obj_bosscontrol) || room == creDIHts || room == rm_fakeloading || room == rm_DIHsclaimer)
    exit;

pal_swap_set(obj_player.spr_palette, obj_player.paletteselect, 0);

if (obj_player.backupweapon == 1)
    draw_sprite_ext(spr_shotgunbackup, -1, 50, 100, 1, 1, 1, c_white, alpha);

if (obj_player.state != states.gameover)
{
    if (obj_player.character != "S" && obj_player.character != "R")
    {
        if (obj_player.sprite_index == spr_knightpep_thunder)
            draw_sprite_ext(hudthunder, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (obj_player.sprite_index != spr_knightpep_start && (obj_player.state == states.knightpep || obj_player.state == states.knightpepslopes))
            draw_sprite_ext(hudknight, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (obj_player.sprite_index == obj_player.spr_bombpepend)
            draw_sprite_ext(hudbombend, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (instance_exists(obj_itspizzatime) || obj_player.sprite_index == obj_player.spr_bombpepintro || obj_player.sprite_index == obj_player.spr_bombpeprunabouttoexplode || obj_player.sprite_index == obj_player.spr_bombpeprun || obj_player.sprite_index == obj_player.spr_fireass)
            draw_sprite_ext(hudscream, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (obj_player.state == states.Sjumpland || (obj_player.state == states.freefallland && shake_mag > 0))
            draw_sprite_ext(hudstun, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (obj_player.sprite_index == spr_player_victory || obj_player.state == states.keyget || obj_player.state == states.smirk || obj_player.state == states.gottreasure || (obj_player.state == states.bossintro && obj_player.sprite_index == spr_player_levelcomplete))
            draw_sprite_ext(hudhappy, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (obj_player.sprite_index == spr_player_machroll || obj_player.sprite_index == spr_player_tumble)
            draw_sprite_ext(hudrolling, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (global.combo >= 10 && (obj_player.state == states.normal || obj_player.state == states.crouch || obj_player.state == states.crouchjump || obj_player.state == states.jump))
            draw_sprite_ext(hudmenacing, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (obj_player.state == states.mach1 || obj_player.state == states.chainsaw || obj_player.state == states.freefallprep || obj_player.state == states.freefall || obj_player.state == states.tackle || obj_player.state == states.Sjump || obj_player.state == states.slam || obj_player.state == states.Sjumpprep || obj_player.state == states.grab || obj_player.state == states.punch || obj_player.state == states.backbreaker || obj_player.state == states.backkick || obj_player.state == states.uppunch || obj_player.state == states.shoulder || (obj_player.state == states.jetpack && obj_player.sprite_index == spr_playerN_noisebombspinjump) || obj_player.state == states.wallbounce)
            draw_sprite_ext(hudmach1, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (obj_player.state == states.mach2 || obj_player.sprite_index == spr_player_dive || obj_player.sprite_index == spr_player_machslideboost || obj_player.state == states.climbwall || obj_player.state == states.handstandjump || obj_player.state == states.superslam)
            draw_sprite_ext(hudmach2, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (obj_player.state == states.mach3 && obj_player.sprite_index == obj_player.spr_crazyrun)
            draw_sprite_ext(hudmach4, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (obj_player.state == states.mach3 || obj_player.sprite_index == spr_player_machslideboost3 || (obj_player.state == states.jetpack && obj_player.sprite_index != spr_playerN_noisebombspinjump))
            draw_sprite_ext(hudmach3, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (obj_player.state == states.hurt || obj_player.sprite_index == spr_bombpep_end || obj_player.sprite_index == spr_player_fireassend || obj_player.state == states.timesup || obj_player.state == states.bombpep || (obj_player.state == states.bossintro && obj_player.sprite_index == spr_player_bossintro) || (obj_player.state == states.bossintro && obj_player.sprite_index == spr_player_idle))
            draw_sprite_ext(hudhurt, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (obj_player.angry == 1 || obj_player.state == states.punch || obj_player.state == states.kungfu || obj_player.state == states.breakdanceattack || obj_player.state == states.parryshit)
            draw_sprite_ext(hud3hp, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (obj_player.sprite_index == spr_player_hurtidle || obj_player.sprite_index == spr_player_hurtwalk)
            draw_sprite_ext(hud1hp, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (global.panic == 1 || global.snickchallenge == 1)
            draw_sprite_ext(hudpanic, -1, 125, 100, 1, 1, 1, c_white, alpha);
        else if (obj_player.sprite_index == spr_shotgun_pullout || obj_player.state == states.Nfork)
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
        if (obj_player.movespeed < 2.4 || !(obj_player.state == states.mach1 || obj_player.state == states.mach2 || obj_player.state == states.mach3 || obj_player.state == states.climbwall || obj_player.state == states.machslide || obj_player.state == states.machroll || obj_player.state == states.handstandjump))
            draw_sprite_ext(spr_speedbar, 0, 125, 140, 1, 1, 1, c_white, alpha);
        else if (obj_player.movespeed >= 2.4 && obj_player.movespeed < 4.8 && (obj_player.state == states.mach1 || obj_player.state == states.mach2 || obj_player.state == states.mach3 || obj_player.state == states.climbwall || obj_player.state == states.machslide || obj_player.state == states.machroll || obj_player.state == states.handstandjump))
            draw_sprite_ext(spr_speedbar, 1, 125, 140, 1, 1, 1, c_white, alpha);
        else if (obj_player.movespeed >= 4.8 && obj_player.movespeed < 7.2 && (obj_player.state == states.mach1 || obj_player.state == states.mach2 || obj_player.state == states.mach3 || obj_player.state == states.climbwall || obj_player.state == states.machslide || obj_player.state == states.machroll || obj_player.state == states.handstandjump))
            draw_sprite_ext(spr_speedbar, 2, 125, 140, 1, 1, 1, c_white, alpha);
        else if (obj_player.movespeed >= 7.2 && obj_player.movespeed < 9.6 && (obj_player.state == states.mach1 || obj_player.state == states.mach2 || obj_player.state == states.mach3 || obj_player.state == states.climbwall || obj_player.state == states.machslide || obj_player.state == states.machroll || obj_player.state == states.handstandjump))
            draw_sprite_ext(spr_speedbar, 3, 125, 140, 1, 1, 1, c_white, alpha);
        else if (obj_player.movespeed >= 9.6 && obj_player.movespeed < 12 && (obj_player.state == states.mach1 || obj_player.state == states.mach2 || obj_player.state == states.mach3 || obj_player.state == states.climbwall || obj_player.state == states.machslide || obj_player.state == states.machroll || obj_player.state == states.handstandjump))
            draw_sprite_ext(spr_speedbar, 4, 125, 140, 1, 1, 1, c_white, alpha);
        else if (obj_player.movespeed >= 12 && (obj_player.state == states.mach1 || obj_player.state == states.mach2 || obj_player.state == states.mach3 || obj_player.state == states.climbwall || obj_player.state == states.machslide || obj_player.state == states.machroll || obj_player.state == states.handstandjump))
            draw_sprite_ext(spr_speedbarmax, -1, 125, 140, 1, 1, 1, c_white, alpha);
    }
    
    if (obj_player.y < 200 && obj_player.x < 200)
        alpha = 0.5;
    else
        alpha = 1;
    
    var ding = 0;
    
    if (!global.deathmode)
    {
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
    }
    else
    {
        if (global.uniquecollects >= 9)
            ding = 5;
        
        if (global.uniquecollects <= 8)
            ding = 4;
        
        if (global.uniquecollects < 6)
            ding = 3;
        
        if (global.uniquecollects < 4)
            ding = 2;
        
        if (global.uniquecollects < 3)
            ding = 1;
        
        if (global.uniquecollects < 2)
            ding = 0;
    }
    
    if (ding > dingading)
        scr_soundeffect(sfx_rankup, sfx_rankup2, sfx_rankup3, sfx_rankup4, sfx_rankup5);
    
    if (ding < dingading)
        scr_soundeffect(sfx_rankdown, sfx_rankdown2, sfx_rankdown3, sfx_rankdown4, sfx_rankdown5);
    
    dingading = ding;
    
    if (!global.snickchallenge)
    {
        draw_sprite_ext(spr_ranks_hud, ding, 225, 75, 1, 1, 1, c_white, alpha);
        font = font_add_sprite_ext(spr_combofont, "X1234567890", 1, 0);
        draw_set_font(font);
        draw_set_halign(fa_center);
        draw_set_color(c_white);
        draw_sprite_ext(spr_combotimer_hud, 0, combox, 0, 1, 1, 1, c_white, alpha);
        draw_sprite_ext(spr_comboline, 0, (combox - 0) + round(global.combotime), round(wave(-2.5, 2.5, 1, 0.25)), 1, 1, 1, c_white, alpha);
        draw_sprite_ext(spr_combotimer_hud2, 0, (combox - 0) + round(global.combotime), round(wave(-2.5, 2.5, 0.75, 0.25)), 1, 1, 1, c_white, alpha);
        draw_text(combox - 50, 225, "X" + string(global.combo));
    }
    
    font = font_add_sprite_ext(global.fontspritee, global.fontcharacterss, 1, 0);
    draw_set_font(font);
    var bullshit = string(round(minut)) + ":" + string(round(secund));
    
    if (global.panic == 1 || global.snickchallenge == 1 || global.draintime)
    {
        if (global.seconds < 10)
        {
            if (global.minutes < 1)
                draw_set_color(c_red);
            else
                draw_set_color(c_white);
            
            if (global.hallucination <= 0)
                draw_text(480, 425, string_hash_to_newline(string(global.minutes) + ":0" + string(global.seconds)));
            else
                draw_text(480, 425, bullshit);
        }
        else if (global.seconds >= 10)
        {
            if (global.minutes < 1)
                draw_set_color(c_red);
            else
                draw_set_color(c_white);
            
            if (global.hallucination <= 0)
                draw_text(480, 425, string_hash_to_newline(string(global.minutes) + ":" + string(global.seconds)));
            else
                draw_text(480, 425, bullshit);
        }
    }
    
    if (string_letters(roomname) == "pw" && instance_exists(obj_pepperman_weak))
    {
        draw_text(480, 10, "KILL ALL PEPPERMEN");
        draw_text(480, 60, string(instance_number(obj_pepperman_weak)) + " LEFT");
    }
    
    if (global.key_inv == 1)
        draw_sprite_ext(spr_key, -1, 50, 200, 1, 1, 1, c_white, alpha);
    
    draw_sprite_ext(spr_inv, -1, 50, 200, 1, 1, 1, c_white, alpha);
}

shader_reset();
draw_set_blend_mode(bm_normal);
