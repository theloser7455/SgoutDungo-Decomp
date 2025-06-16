var thing = phase * 4;

switch (state)
{
    case 0:
        image_speed = 0.35;
        
        if (hp > 8)
            turns = 0;
        
        if (hp <= 8)
            turns = 1;
        
        if (grounded)
            hsp = Approach(hsp, 0, 0.5);
        
        sprite_index = spr_pepperman_idle;
        attackin--;
        attack = "S";
        
        if (hp <= 6 && hp >= 3)
            attack = "GP";
        
        if (hp <= 4)
            ball = 1;
        else
            ball = 0;
        
        if (attackin <= 0)
        {
            if (attack == "S")
            {
                if (x != obj_player.x)
                    xscale = -sign(x - obj_player.x);
                
                state = 19;
                attackin = 50;
                flash = 1;
                sprite_index = spr_pepperman_shoulderstart;
                image_index = 0;
                scr_soundeffect(sfx_comboend);
                movespeed = 12 + thing;
            }
            
            if (attack == "GP")
            {
                attackin = 50;
                
                if (x != obj_player.x)
                    xscale = -sign(x - obj_player.x);
                
                state = 20;
                sprite_index = spr_pepperman_jump;
                image_speed = 0.35;
                image_index = 0;
                var spd2 = distance_to_point(obj_player.x, obj_player.y);
                var dir2 = point_direction(x, y, obj_player.x, obj_player.y);
                hsp = lengthdir_x(spd2, dir2) / 20;
                vsp = -15;
            }
        }
        
        break;
    
    case 30:
        scr_boss_stun();
        break;
    
    case 693:
        scr_boss_stun();
        break;
    
    case 18:
        scr_boss_thrown();
        break;
    
    case 19:
        image_speed = 0.35;
        
        if (sprite_index != spr_pepperman_shoulderstart)
        {
            hsp = movespeed * xscale;
        }
        else
        {
            hsp = -5 * xscale;
            
            if (floor(image_index) == (image_number - 1))
                sprite_index = spr_pepperman_shoulderloop;
        }
        
        if (scr_solid(x + xscale, y))
        {
            stunned = 100;
            stunned -= (25 * phase);
            state = 30;
            
            if (hp < 3)
            {
                state = 693;
                stunned = 50;
            }
            
            hsp = -5 * xscale;
            vsp = -8;
            sprite_index = spr_pepperman_shoulderhurtstart;
            image_index = 0;
            scr_soundeffect(sfx_groundpound);
        }
        
        if (-sign(x - obj_player.x) == -xscale && turns > 0)
        {
            state = 90;
            turns--;
            sprite_index = spr_pepperman_shoulderturn;
            image_index = 0;
            scr_soundeffect(sfx_machslide);
        }
        
        break;
    
    case 90:
        hsp = Approach(hsp, 0, 0.5);
        image_speed = 0.35;
        
        if (floor(image_index) == (image_number - 1))
        {
            state = 19;
            xscale *= -1;
            movespeed = 18 + thing;
            sprite_index = spr_pepperman_shoulderloop;
            
            with (instance_create(x, y, obj_crazyrunothereffect))
                image_xscale = other.xscale;
        }
        
        break;
    
    case 20:
        hsp = Approach(hsp, 0, 0.5);
        
        if (vsp > 0)
            vsp = 0;
        
        if (floor(image_index) == (image_number - 1))
            image_speed = 0;
        
        if (hsp == 0 && floor(vsp) == 0)
        {
            state = 21;
            sprite_index = spr_pepperman_groundpoundstart;
            image_index = 0;
            vsp = -10;
        }
        
        break;
    
    case 21:
        image_speed = 0.35;
        
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_pepperman_groundpoundstart)
            sprite_index = spr_pepperman_groundpound;
        
        if (vsp > 0)
            vsp += 1;
        
        if (grounded)
        {
            scr_soundeffect(sfx_groundpound);
            state = 30;
            stunned = 200;
            stunned += (25 * phase);
            sprite_index = spr_pepperman_groundpoundland;
            
            with (instance_create(x, y + 152, obj_peppermanshockwave))
            {
                dir = 1;
                times = 3 + other.phase;
            }
            
            with (instance_create(x, y + 152, obj_peppermanshockwave))
            {
                dir = -1;
                times = 3 + other.phase;
                visible = false;
            }
        }
        
        break;
    
    case 22:
        hsp = xscale * 10;
        
        if (place_meeting(x + xscale, y, obj_solid))
        {
            xscale *= -1;
            vsp = -7;
        }
        
        if (grounded && vsp > 0)
            state = 0;
        
        break;
}

if (instance_exists(obj_peppermanmarbleblockboss))
{
    if (obj_peppermanmarbleblockboss.hp <= 0)
    {
        if (distance_to_object(obj_peppermanmarbleblockboss) <= 160)
        {
            state = 30;
            sprite_index = spr_pepperman_contemplate;
            stunned = 100;
        }
    }
}

if (state == 19 && !audio_is_playing(sfx_machroll))
    scr_soundeffect(sfx_machroll);

if (state != 19 && audio_is_playing(sfx_machroll))
    audio_stop_sound(sfx_machroll);

if ((state == 19 || state == 90) && hurting == 0)
    hurting = 1;

if (state != 19 && state != 90 && hurting == 1)
    hurting = 0;

if (state == 22 && hurtandhitable == 0)
    hurtandhitable = 1;

if (state != 22 && hurtandhitable == 1)
    hurtandhitable = 0;
