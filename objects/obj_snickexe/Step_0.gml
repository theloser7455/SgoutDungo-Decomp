if (global.snickchallenge == 0)
    instance_destroy();

if (!global.coolsnick)
{
    image_angle = 0;
    image_yscale = 1;
    
    if (obj_player.state != 60 && obj_player.state != 63 && obj_player.state != 55 && obj_player.state != 77 && !instance_exists(obj_treasure))
    {
        x = Approach(x, obj_player1.x, maxspeed);
        y = Approach(y, obj_player1.y, maxspeed);
    }
    
    if (hitboxcreate == 0 && obj_player1.instakillmove == 0 && obj_player1.state != 21 && obj_player.state != 46)
    {
        hitboxcreate = 1;
        
        with (instance_create(x, y, obj_forkhitbox))
        {
            sprite_index = other.sprite_index;
            ID = other.id;
        }
    }
    
    if (place_meeting(x, y, obj_player1) && (obj_player1.instakillmove == 1 || obj_player1.state == 21 || obj_player.state == 46))
    {
        repeat (6)
        {
            with (instance_create(x + random_range(-100, 100), y + random_range(-100, obj_peppermancharge), obj_balloonpop))
                sprite_index = spr_shotgunimpact;
        }
        
        x = room_width / 2;
        y = -100;
    }
    
    if (room == ruin_11 || room == ruin_3)
    {
        x = room_width / 2;
        y = -100;
    }
    
    if (x != obj_player.x)
        image_xscale = -sign(x - obj_player.x);
}
else
{
    image_xscale = 1;
    
    if (obj_player.state == 60 || obj_player.state == 63 || obj_player.state == 55 || obj_player.state == 77)
    {
        speed = 0;
        attack = "idk";
        alarm[0] = -1;
        alarm[1] = -1;
        
        if (attack == "dash")
        {
            with (instance_create(x, y, obj_explosioneffect))
                sprite_index = spr_genericpoofeffect;
            
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
    
    if (!(obj_player.state == 60 || obj_player.state == 63 || obj_player.state == 55 || obj_player.state == 77 || (obj_player.state == 26 && (obj_player.sprite_index == obj_player.spr_bombpepintro || obj_player.sprite_index == obj_player.spr_bombpepend)) || instance_exists(obj_treasure)))
    {
        if (hitboxcreate == 0 && attack == "dash")
        {
            hitboxcreate = 1;
            
            with (instance_create(x, y, obj_forkhitbox))
            {
                sprite_index = other.sprite_index;
                ID = other.id;
            }
        }
    }
    
    coilangle += 2;
}
