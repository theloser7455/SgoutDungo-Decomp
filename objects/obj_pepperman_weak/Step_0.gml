var thing = phase * 4;

switch (state)
{
    case states.normal:
        image_speed = 0.35;
        
        if (hp > 8)
            turns = 0;
        
        if (hp <= 8)
            turns = 1;
        
        if (grounded)
            hsp = Approach(hsp, 0, 0.5);
        
        sprite_index = spr_pepperman_idle;
        attackin--;
        
        if (attackin <= 0)
        {
            if (attack == "S")
            {
                if (x != obj_player.x)
                    xscale = -sign(x - obj_player.x);
                
                state = states.secondjump;
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
                scr_soundeffect(sfx_pepperman_jump);
                
                if (x != obj_player.x)
                    xscale = -sign(x - obj_player.x);
                
                state = states.chainsawbump;
                sprite_index = spr_pepperman_jump;
                image_speed = 0.35;
                image_index = 0;
                var spd2 = distance_to_point(obj_player.x, obj_player.y);
                var dir2 = point_direction(x, y, obj_player.x, obj_player.y);
                hsp = lengthdir_x(spd2, dir2) / 20;
                
                if (hsp > 35)
                    hsp = 35;
                
                if (hsp < -35)
                    hsp = -35;
                
                vsp = -15;
            }
        }
        
        break;
    
    case states.stunned:
        scr_boss_stun();
        break;
    
    case states.bossStun:
        scr_boss_stun();
        break;
    
    case states.portal:
        scr_boss_thrown();
        break;
    
    case states.secondjump:
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
            
            if (phase < 3)
                stunned -= (25 * phase);
            else
                stunned -= 50;
            
            state = states.stunned;
            hsp = -5 * xscale;
            vsp = -8;
            sprite_index = spr_pepperman_shoulderhurtstart;
            image_index = 0;
            scr_soundeffect(sfx_groundpound);
        }
        
        if (-sign(x - obj_player.x) == -xscale && turns > 0)
        {
            state = states.freefallprep;
            turns--;
            sprite_index = spr_pepperman_shoulderturn;
            image_index = 0;
            scr_soundeffect(sfx_machslide);
        }
        
        break;
    
    case states.freefallprep:
        hsp = Approach(hsp, 0, 0.5);
        image_speed = 0.35;
        
        if (floor(image_index) == (image_number - 1))
        {
            state = states.secondjump;
            xscale *= -1;
            movespeed = 18 + thing;
            sprite_index = spr_pepperman_shoulderloop;
            
            with (instance_create(x, y, obj_crazyrunothereffect))
                image_xscale = other.xscale;
        }
        
        break;
    
    case states.chainsawbump:
        hsp = Approach(hsp, 0, 0.5);
        
        if (vsp > 0)
            vsp = 0;
        
        if (floor(image_index) == (image_number - 1))
            image_speed = 0;
        
        if (hsp == 0 && floor(vsp) == 0)
        {
            state = states.handstandjump;
            scr_soundeffect(sfx_pepperman_jump);
            sprite_index = spr_pepperman_groundpoundstart;
            image_index = 0;
            vsp = -10;
        }
        
        break;
    
    case states.handstandjump:
        image_speed = 0.35;
        
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_pepperman_groundpoundstart)
            sprite_index = spr_pepperman_groundpound;
        
        if (vsp > 0)
            vsp += 1;
        
        if (grounded)
        {
            scr_soundeffect(sfx_groundpound);
            state = states.stunned;
            stunned = 200;
            stunned += (25 * phase);
            sprite_index = spr_pepperman_groundpoundland;
            var a = 0;
            var b = 152;
            
            if (room == pw_3)
                b = 32;
            
            with (instance_create(x, y + b, obj_peppermanshockwave))
            {
                dir = 1;
                times = (3 + other.phase) - a;
            }
            
            with (instance_create(x, y + b, obj_peppermanshockwave))
            {
                dir = -1;
                times = (3 + other.phase) - a;
                visible = false;
            }
        }
        
        break;
    
    case states.gottreasure:
        hsp = xscale * 10;
        
        if (place_meeting(x + xscale, y, obj_solid))
        {
            xscale *= -1;
            vsp = -7;
        }
        
        if (grounded && vsp > 0)
            state = states.normal;
        
        break;
    
    case states.bossphase2transition:
        scr_boss_phase2transition();
        break;
}

if (instance_exists(obj_peppermanmarbleblockboss) && state != states.bossphase2transition && state != states.portal)
{
    if (obj_peppermanmarbleblockboss.hp <= 0)
    {
        if (distance_to_object(obj_peppermanmarbleblockboss) <= 64)
        {
            if (state != states.stunned)
            {
                flash = 1;
                scr_soundeffect(sfx_pepperman_goofysound);
            }
            
            state = states.stunned;
            sprite_index = spr_pepperman_contemplate;
            stunned = 100;
            hsp = 0;
        }
    }
}

if (state == states.secondjump && !audio_is_playing(sfx_machroll))
    scr_soundeffect(sfx_machroll);

if (state != states.secondjump && audio_is_playing(sfx_machroll))
    audio_stop_sound(sfx_machroll);

if ((state == states.secondjump || state == states.freefallprep) && hurting == 0)
    hurting = 1;

if (state != states.secondjump && state != states.freefallprep && hurting == 1)
    hurting = 0;

if (state == states.gottreasure && hurtandhitable == 0)
    hurtandhitable = 1;

if (state != states.gottreasure && hurtandhitable == 1)
    hurtandhitable = 0;
