if (room == ruin_10 && obj_player.state == states.bombpep)
    shart = 100;

var sk = 1;

if (global.snickchallenge)
    sk = 1.5;

if (move && image_alpha >= 1)
{
    if (global.pizzafacechasestyle == 0)
    {
        var spd2 = distance_to_point(obj_player.x, obj_player.y) / 10;
        var dir2 = point_direction(x, y, obj_player.x, obj_player.y);
        hspeed = Approach(hspeed, lengthdir_x(spd2, dir2) / sk, accuracy) / shart;
        vspeed = Approach(vspeed, lengthdir_y(spd2, dir2) / sk, accuracy) / shart;
    }
    
    if (global.pizzafacechasestyle == 1)
    {
        x += lengthdir_x(spid / sk, point_direction(x, y, obj_player1.x, obj_player1.y));
        y += lengthdir_y(spid / sk, point_direction(x, y, obj_player1.x, obj_player1.y));
        
        if (obj_player.state == states.bombpep || room == dungeon_3)
            spid = Approach(spid, 5, 0.5);
        else
            spid = Approach(spid, 10, 0.5);
    }
    
    if (global.pizzafacechasestyle == 2)
    {
        x = Approach(x, obj_player.x, spid / sk);
        y = Approach(y, obj_player.y, spid / sk);
        
        if (obj_player.state == states.bombpep)
            spid = Approach(spid, 3, 0.125);
        else
            spid = Approach(spid, 6, 0.125);
    }
}
else if (!move)
{
    hspeed = 0;
    vspeed = 0;
    spid = 0;
}

if (!stun)
{
    if (image_alpha < 0)
        move = 0;
    else
        move = 1;
    
    if (sprite_index != spr_pizzaface_intro2)
        sprite_index = spr_pizzaface;
    
    if (sprite_index == spr_pizzaface_intro2 && floor(image_index) == (image_number - 1))
        sprite_index = spr_pizzaface;
    
    if (global.snickchallenge)
        sprite_index = spr_corruptzaface;
}
else if (stun)
{
    spid = 0;
    
    if (sprite_index != spr_pizzaface_fireass && sprite_index != spr_pizzaface_el)
    {
        if (!global.snickchallenge)
        {
            if (!grounded)
                sprite_index = spr_pizzaface_hurt;
            else
                sprite_index = spr_pizzaface_stun;
        }
        else if (!grounded)
        {
            sprite_index = spr_corruptzafacestun;
        }
        else
        {
            sprite_index = spr_corruptzafacestunground;
        }
    }
    else
    {
        if (sprite_index == spr_pizzaface_fireass && grounded)
        {
            repeat (5)
            {
                with (instance_create(x + random_range(64, -64), y + random_range(64, -64), obj_bangeffect))
                {
                    sprite_index = spr_genericpoofeffect;
                    depth = other.depth - 1;
                }
            }
            
            scr_soundeffect(sfx_fireassend);
            sprite_index = spr_pizzaface_hurt;
        }
        
        if (sprite_index == spr_pizzaface_el)
        {
            if (floor(image_index) == (image_number - 1))
            {
                with (instance_create(x + random_range(64, -64), y + random_range(64, -64), obj_bangeffect))
                {
                    sprite_index = spr_genericpoofeffect;
                    depth = other.depth - 1;
                }
            }
            
            if (scr_solid(x + sign(hsp), y))
                hsp *= -1;
            
            hsp = 0;
            
            if (!place_meeting(x, y, obj_spike))
            {
                if (image_index > 12)
                    image_index = 11;
            }
        }
    }
    
    move = 0;
    
    if (grounded)
        hsp = Approach(hsp, 0, 0.125);
    
    with (instance_place(x, y, obj_player))
    {
        if (((instakillmove || state == states.punch || state == states.handstandjump) && other.immunityframes <= 0) || character == "TERRENCE")
        {
            other.vspeed = 0;
            other.hspeed = 0;
            other.vsp = -5;
            
            if (state == states.handstandjump || state == states.punch)
            {
                sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4);
                
                if (character == "P")
                    sprite_index = choose(spr_player_suplexmash1, spr_player_suplexmash2, spr_player_suplexmash3, spr_player_suplexmash4, spr_player_suplexmash5, spr_player_suplexmash6, spr_player_suplexmash7);
                
                image_index = 0;
                state = states.tackle;
                movespeed = 3;
                vsp = -3;
                hsp = xscale * 8;
                
                if (key_up)
                {
                    other.vsp = -25;
                    sprite_index = spr_finishingblowup;
                    image_index = 4;
                }
            }
            
            with (instance_create(other.x, other.y, obj_bangeffect))
            {
                sprite_index = choose(spr_pizzaface_hiteffect1, spr_pizzaface_hiteffect2, spr_pizzaface_hiteffect3, spr_pizzaface_hiteffect4);
                image_speed = 0.45;
                depth = obj_player.depth - 1;
            }
            
            with (instance_create(other.x, other.y, obj_bangeffect))
                sprite_index = spr_parryeffect;
            
            with (instance_create(other.x, other.y, obj_bangeffect))
                sprite_index = spr_kungfueffect;
            
            repeat (4)
                instance_create(x, y, obj_slapstar);
            
            other.hsp = hsp;
            other.alarm[0] = 100;
            other.immunityframes = 3;
            other.image_blend = c_red;
            scr_soundeffect(sfx_punch);
            
            repeat (4)
                instance_create(random_range(x - 20, x + 20), random_range(y - 20, y + 20), obj_slapstar);
        }
    }
    
    with (instance_place(x, y, obj_baddie))
    {
        if (thrown && other.immunityframes <= 0)
        {
            other.hsp = hsp;
            other.vsp = -5;
            other.alarm[0] = 100;
            other.immunityframes = 3;
            other.image_blend = c_red;
            scr_soundeffect(sfx_punch);
            
            repeat (4)
                instance_create(random_range(x - 20, x + 20), random_range(y - 20, y + 20), obj_slapstar);
        }
        
        instance_destroy();
    }
    
    if (place_meeting(x, y + 2, obj_boilingsauce))
    {
        vsp = -25;
        scr_soundeffect(sfx_scream3);
        scr_soundeffect(sfx_fireass);
        y -= 2;
        sprite_index = spr_pizzaface_fireass;
        alarm[0] = 100;
        
        repeat (16)
        {
            with (instance_create(x, y, obj_bangeffect))
            {
                sprite_index = spr_flamecloud;
                direction = random_range(360, 0);
                speed = 12;
                depth = other.depth - 1;
                image_xscale = 2;
                image_yscale = 2;
            }
        }
    }
    
    if (place_meeting(x, y, obj_spike) && immunityframes <= 0)
    {
        immunityframes = 12;
        
        if (sprite_index != spr_pizzaface_el)
        {
            scr_soundeffect(sfx_scream2);
            
            repeat (16)
            {
                with (instance_create(x + random_range(64, -64), y + random_range(64, -64), obj_bangeffect))
                {
                    sprite_index = choose(spr_supertaunteffect1, spr_supertaunteffect2, spr_supertaunteffect3, spr_supertaunteffect4, spr_supertaunteffect5);
                    direction = random_range(360, 0);
                    depth = other.depth - 1;
                    image_xscale = 2;
                    image_yscale = 2;
                }
            }
        }
        
        if (!audio_is_playing(sfx_zaplong))
            scr_soundeffect(sfx_zaplong);
        
        sprite_index = spr_pizzaface_el;
        
        if (image_index > 3)
            image_index = 0;
    }
    
    scr_collide();
}

if ((place_meeting(x, y, obj_player) && move == 1 && obj_player.state != states.gameover && obj_player.state != states.backbreaker && obj_player.character != "TERRENCE" && image_alpha >= 1) && !instance_exists(obj_fadeout))
{
    with (instance_create(x, y, obj_sausageman_dead))
        sprite_index = spr_pizzaface_hurt;
    
    if (global.snickchallenge)
    {
        repeat (256)
        {
            with (instance_create(x + random_range(400, -400), y + random_range(400, -400), obj_bangeffect))
            {
                sprite_index = choose(spr_glitch1, spr_glitch2, spr_glitch3);
                image_speed = 0.35;
                depth = obj_player.depth - 1;
            }
        }
        
        scr_soundeffect(sfx_snickglitchnew3);
    }
    
    x = -999;
    y = -999;
    hspeed = 0;
    vspeed = 0;
    
    if (!global.instantR)
        instance_create(x, y, obj_bossdefeatflash);
    
    if (instance_exists(obj_baddie))
        instance_destroy(obj_baddie);
    
    scr_gameover_setup();
    scr_soundeffect(sfx_killenemy);
}
else if (place_meeting(x, y, obj_player) && move == 1 && (obj_player.state == states.backbreaker || obj_player.character == "TERRENCE") && image_alpha >= 1)
{
    move = 0;
    image_alpha = 0.5;
    
    with (obj_player)
    {
        state = states.parryshit;
        sprite_index = choose(spr_parry1, spr_parry2, spr_parry3);
        image_index = 0;
        var ultr = 0;
        
        if (obj_player.paletteselect == 3 && obj_player.character == "P")
            ultr = 1;
        
        if (!ultr)
            scr_soundeffect(sfx_parry2);
        else
            scr_soundeffect(sfx_ultraparry);
        
        other.howmuchtimesdidyoukickmyass += 1;
        
        if (other.howmuchtimesdidyoukickmyass == 5)
        {
            global.SAGEpizzaparry = 1;
            ini_open("SGOUTsaveData.ini");
            ini_write_string("SAGE2025", "pizzaparry", 1);
            ini_close();
        }
        
        if (x != other.x)
            xscale = -sign(x - other.x);
        
        hsp = -12 * xscale;
        
        with (instance_create(x + (16 * xscale), y, obj_bangeffect))
            sprite_index = spr_parryeffect;
        
        with (obj_baddie)
        {
            if (distance_to_object(other) <= 96)
                instance_destroy();
        }
    }
    
    repeat (4)
        instance_create(random_range(x - 20, x + 20), random_range(y - 20, y + 20), obj_slapstar);
    
    stun = 1;
    hsp = obj_player.xscale * 8;
    vsp = -10;
    immunityframes = 3;
    alarm[0] = 100;
    image_blend = c_red;
    scr_soundeffect(sfx_scream9);
    scr_soundeffect(sfx_punch);
    x = obj_player.x;
    y = obj_player.y;
}

var e = 1;

if (obj_player.state == states.comingoutdoor || obj_player.state == states.victory || obj_player.state == states.keyget || obj_player.state == states.door || (obj_player.state == states.bombpep && (obj_player.sprite_index == obj_player.spr_bombpepintro || obj_player.sprite_index == obj_player.spr_bombpepend)) || instance_exists(obj_treasure))
{
    e = 0.75;
    hspeed = 0;
    vspeed = 0;
}

image_alpha = Approach(image_alpha, e, 0.01);
immunityframes--;

if (image_blend == c_red && alarm[1] <= 0)
    alarm[1] = 0.15 * room_speed;
