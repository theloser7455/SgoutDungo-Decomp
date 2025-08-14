if (global.snickchallenge == 0)
    instance_destroy();

if (!global.coolsnick)
{
    image_angle = 0;
    image_yscale = 1;
    
    if (hitboxcreate == 0 && obj_player1.state != states.handstandjump && obj_player.state != states.punch)
    {
        hitboxcreate = 1;
        
        with (instance_create(x, y, obj_forkhitbox))
        {
            sprite_index = spr_snick_hitbox;
            ID = other.id;
        }
    }
    
    switch (stater)
    {
        case "normal":
        
            if (obj_player.state != states.comingoutdoor && obj_player.state != states.bombpep && obj_player.state != states.victory && obj_player.state != states.keyget && obj_player.state != states.door && !instance_exists(obj_treasure))
            {
                x += lengthdir_x(mivespid, point_direction(x, y, obj_player1.x, obj_player1.y));
                y += lengthdir_y(mivespid, point_direction(x, y, obj_player1.x, obj_player1.y));
                mivespid = Approach(mivespid, 8, 0.125);
            }
            else
            {
                mivespid = 0;
            }
            
            if (place_meeting(x, y, obj_player1) && (obj_player1.state == states.handstandjump || obj_player.state == states.punch))
            {
                with (instance_create(x, y, obj_bangeffect))
                    sprite_index = spr_genericpoofeffect;
                
                scr_soundeffect(sfx_poof);
                x = room_width / 2;
                y = -100;
                mivspid = 0;
            }
            
            if (x != obj_player.x)
                image_xscale = -sign(x - obj_player.x);
            
            attackcooldown--;
            
            if (room == snick_challengeend)
            {
                image_blend = c_red;
                attackcooldown = 0;
            }
            else
            {
                image_blend = c_white;
            }
            
            if (attackcooldown <= 0 && distance_to_object(obj_player) <= 600)
            {
                stater = "dashstart";
                instance_create(x, y, obj_unparryableflash);
                attackcooldown = 50;
                scr_soundeffect(sfx_snickexedashstart);
            }
            
            if (distance_to_object(obj_player) > 600)
            {
                tpcooldown--;
                
                if (tpcooldown <= 0)
                {
                    x = obj_player.x - (obj_player.xscale * 200);
                    y = obj_player.y - random_range(200, -200);
                    scr_soundeffect(sfx_poof);
                    
                    with (instance_create(x, y, obj_bangeffect))
                        sprite_index = spr_genericpoofeffect;
                    
                    mivespid = 0;
                    tpcooldown = 200;
                }
            }
            
            break;
        
        case "dashstart":
        
            var dihx = obj_player.x + (obj_player.hsp * 14);
            var dihy = obj_player.y + (obj_player.vsp * 14);
            
            if (x != obj_player.x)
                image_xscale = -sign(x - obj_player.x);
            
            direction = point_direction(x, y, dihx, dihy);
            
            if (!instance_exists(obj_snickexecrosshair))
            {
                with (instance_create(dihx, dihy, obj_snickexecrosshair))
                {
                    x = dihx;
                    y = dihy;
                }
            }
            else
            {
                with (obj_snickexecrosshair)
                {
                    x = lerp(x, dihx, 0.25);
                    y = lerp(y, dihy, 0.25);
                }
            }
            
            attackcooldown--;
            
            if (attackcooldown <= 0)
            {
                stater = "dash";
                speed = 40;
                scr_soundeffect(sfx_snickexedash);
                
                if (distance_to_object(obj_player) >= 400)
                    speed = (distance_to_object(obj_player) / 20) + 20;
            }
            
            break;
        
        case "dash":
        
            speed = lerp(speed, 0, 0.0625);
            
            if (x != obj_player.x)
                image_xscale = -sign(x - obj_player.x);
            
            if (speed <= 0.25)
            {
                stater = "normal";
                attackcooldown = 200;
                mivespid = 0;
                speed = 0;
            }
            
            break;
    }
}
else
{
    image_xscale = 1;
    
    if (obj_player.state == states.comingoutdoor || obj_player.state == states.victory || obj_player.state == states.keyget || obj_player.state == states.door)
    {
        speed = 0;
        attack = "idk";
        alarm[0] = -1;
        alarm[1] = -1;
        
        if (attack == "dash")
        {
            with (instance_create(x, y, obj_explosioneffect))
                sprite_index = spr_genericpoofeffect;
            
            scr_soundeffect(sfx_poof);
            
            with (obj_afterimog)
            {
                if (sprite_index == spr_snick_exe)
                    instance_destroy();
            }
        }
    }
    
    if (attacking)
    {
        attackcooldown = 100;
        
        if (attack != "dash" && shake <= 0)
            getbacktoworkin--;
        
        if (getbacktoworkin <= 0)
        {
            if (attack == "dash" || attack == "beam")
            {
                with (instance_create(x, y, obj_explosioneffect))
                    sprite_index = spr_genericpoofeffect;
                
                scr_soundeffect(sfx_poof);
                
                with (obj_afterimog)
                {
                    if (sprite_index == spr_snick_exe)
                        instance_destroy();
                }
            }
            
            attacking = 0;
            speed = 0;
            previousattack = attack;
            attack = "idk";
            beamshot = 0;
        }
    }
    
    if (attack != "dash" && !beamshot)
    {
        x = obj_player.x + wave(200, -200, 2.5, 0.5) + random_range(shake, -shake);
        y = obj_player.y + wave(200, -200, 2.5, 0.25) + random_range(shake, -shake);
        direction = point_direction(x, y, obj_player.x, obj_player.y);
    }
    
    if (!instance_exists(obj_evilsnickbeam))
        image_angle = point_direction(x, y, obj_player.x, obj_player.y);
    else if (instance_exists(obj_evilsnickbeam))
        image_angle = obj_evilsnickbeam.image_angle;
    
    if (x != obj_player.x)
        image_yscale = -sign(x - obj_player.x);
    
    if (global.snickchallenge)
    {
        with (instance_create(x, y, obj_afterimog))
        {
            sprite_index = other.sprite_index;
            image_yscale = other.image_yscale;
            image_angle = other.image_angle;
            image_alpha = 0.875;
        }
    }
    
    attackcooldown--;
    
    if (attackcooldown <= 0)
    {
        switch (previousattack)
        {
            case "idk":
            
                attack = choose("spikey", "dash", "beam");
                break;
            
            case "spikey":
            
                attack = "dash";
                break;
            
            case "dash":
            
                attack = "beam";
                break;
            
            case "beam":
            
                attack = "spikey";
                break;
        }
        
        attackcooldown = 150;
        getbacktowornin = 75;
        
        if (attack == "spikey")
        {
            shake = 5;
            alarm[0] = 50;
        }
        
        if (attack == "dash")
        {
            dashamounts = 4;
            alarm[1] = 2;
            direction = point_direction(x, y, obj_player.x + obj_player.hsp, obj_player.y + obj_player.vsp);
            speed = random_range(15, 20);
        }
        
        if (attack == "beam")
        {
            alarm[2] = 50;
            shake = 5;
            evilcharge = 1;
            getbacktoworkin = 126;
        }
        
        attacking = 1;
    }
    
    if (attack == "dash")
    {
        if (dashamounts > 0)
            getbacktoworkin = 100;
        else if (dashamounts <= 0)
            getbacktoworkin = 0;
    }
    
    speed = Approach(speed, 0, 0.5);
    
    if (!(obj_player.state == states.comingoutdoor || obj_player.state == states.victory || obj_player.state == states.keyget || obj_player.state == states.door || (obj_player.state == states.bombpep && (obj_player.sprite_index == obj_player.spr_bombpepintro || obj_player.sprite_index == obj_player.spr_bombpepend)) || instance_exists(obj_treasure)))
    {
        if (hitboxcreate == 0 && attack == "dash")
        {
            hitboxcreate = 1;
            
            with (instance_create(x, y, obj_forkhitbox))
            {
                sprite_index = spr_snick_hitbox;
                ID = other.id;
            }
        }
    }
    
    coilangle += 2;
}
