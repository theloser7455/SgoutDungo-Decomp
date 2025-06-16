if (room == ruin_10 && obj_player.state == 26)
    shart = 100;

var sk = 1;

if (obj_player1.character == "R")
    sk = 2;

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
        x += lengthdir_x(10 / sk, point_direction(x, y, obj_player1.x, obj_player1.y));
        y += lengthdir_y(10 / sk, point_direction(x, y, obj_player1.x, obj_player1.y));
    }
    
    if (global.pizzafacechasestyle == 2)
    {
        x = Approach(x, obj_player.x, 6 / sk);
        y = Approach(y, obj_player.y, 6 / sk);
    }
}
else if (!move)
{
    hspeed = 0;
    vspeed = 0;
}

if (!stun)
{
    if (image_alpha < 0)
        move = 0;
    else
        move = 1;
    
    sprite_index = spr_pizzaface;
}
else if (stun)
{
    sprite_index = spr_pizzaface_hurt;
    move = 0;
    
    if (grounded)
        hsp = Approach(hsp, 0, 0.125);
    
    with (instance_place(x, y, obj_player))
    {
        if (((instakillmove || state == 46 || state == 21) && other.immunityframes <= 0) || character == "TERRENCE")
        {
            other.vsp = -5;
            
            if (state == 21 || state == 46)
            {
                sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch);
                image_index = 0;
                state = 56;
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
            
            repeat (20)
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
            
            repeat (20)
                instance_create(random_range(x - 20, x + 20), random_range(y - 20, y + 20), obj_slapstar);
        }
        
        instance_destroy();
    }
    
    if (place_meeting(x, y + 2, obj_boilingsauce))
    {
        vsp = -25;
        scr_soundeffect(sfx_scream3);
        y -= 2;
    }
    
    scr_collide();
}

if (place_meeting(x, y, obj_player) && move == 1 && obj_player.state != 50 && obj_player.character != "TERRENCE" && image_alpha >= 1)
{
    instance_create(x, y, obj_bossdefeatflash);
    
    if (instance_exists(obj_baddie))
        instance_destroy(obj_baddie);
    
    scr_gameover_setup();
    scr_soundeffect(sfx_killenemy);
    
    with (instance_create(x, y, obj_sausageman_dead))
        sprite_index = spr_pizzaface_hurt;
}
else if (place_meeting(x, y, obj_player) && move == 1 && (obj_player.state == 50 || obj_player.character == "TERRENCE") && image_alpha >= 1)
{
    move = 0;
    image_alpha = 0.5;
    
    with (obj_player)
    {
        state = 1670;
        sprite_index = choose(spr_parry1, spr_parry2, spr_parry3);
        image_index = 0;
        scr_soundeffect(sfx_parry2);
        
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
    
    repeat (20)
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

if (obj_player.state == 60 || obj_player.state == 63 || obj_player.state == 55 || obj_player.state == 77 || (obj_player.state == 26 && (obj_player.sprite_index == obj_player.spr_bombpepintro || obj_player.sprite_index == obj_player.spr_bombpepend)) || instance_exists(obj_treasure))
{
    e = 0.75;
    hspeed = 0;
    vspeed = 0;
}

image_alpha = Approach(image_alpha, e, 0.01);
immunityframes--;

if (image_blend == c_red && alarm[1] <= 0)
    alarm[1] = 0.15 * room_speed;
