if (!instance_exists(baddieID))
    instance_destroy();

if (instance_exists(baddieID))
{
    x = baddieID.x;
    y = baddieID.y;
    image_xscale = baddieID.image_xscale;
}

if (instance_exists(baddieID) && place_meeting(x, y, obj_player1) && obj_player1.cutscene == 0 && obj_player1.state != 6)
{
    if (baddieID.state != 107)
    {
        with (obj_player1)
        {
            if (instakillmove == 1 || character == "TERRENCE")
            {
                if (state == 89 && sprite_index != spr_mach3hit && sprite_index != spr_SjumpcancelPEAKend)
                {
                    sprite_index = spr_mach3hit;
                    image_index = 0;
                }
                
                if (state == 69 && grounded)
                {
                    machpunchAnim = 1;
                    image_index = 0;
                }
                
                scr_soundeffect(sfx_punch);
                other.baddieID.hp -= 1;
                
                with (instance_create(other.baddieID.x, other.baddieID.y, obj_bangeffect))
                    sprite_index = spr_parryeffect;
                
                with (instance_create(other.baddieID.x, other.baddieID.y, obj_bangeffect))
                    sprite_index = spr_kungfueffect;
                
                if (other.baddieID.hp <= 0)
                {
                    instance_destroy(other.baddieID);
                    instance_destroy(other.id);
                }
                
                global.hit += 1;
                global.combotime = 100;
                
                if (!grounded && state != 73 && state != 603 && key_jump2)
                {
                    if (state == 69 || state == 89 || (state == 36 && sprite_index == spr_dive))
                    {
                        sprite_index = spr_mach2jump;
                        mach2jumpguy = 1;
                    }
                    
                    suplexmove = 0;
                    vsp = -11;
                }
                
                if (global.hitstun == 1)
                {
                    taunttimer = 5;
                    tauntstoredmovespeed = movespeed;
                    tauntstoredsprite = sprite_index;
                    tauntstoredstate = state;
                    tauntstoredvsp = vsp;
                    tauntstoredhsp = hsp;
                    state = 9360;
                }
            }
            
            if (instance_exists(other.baddieID) && y < other.baddieID.y && attacking == 0 && sprite_index != spr_player_mach2jump && (state == 57 || state == 68 || state == 45) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep)
            {
                scr_soundeffect(sfx_stompenemy);
                
                if (x != other.baddieID.x)
                    other.baddieID.image_xscale = -sign(other.baddieID.x - x);
                
                image_index = 0;
                other.baddieID.state = 104;
                
                if (x != other.baddieID.x)
                    other.baddieID.image_xscale = -sign(other.baddieID.x - x);
                
                other.baddieID.vsp = -5;
                other.baddieID.hsp = -other.baddieID.image_xscale * 2;
                
                if (other.baddieID.stunned < 100)
                    other.baddieID.stunned = 100;
                
                if (key_jump2)
                {
                    instance_create(x, y + 50, obj_stompeffect);
                    stompAnim = 1;
                    other.baddieID.image_index = 0;
                    vsp = -14;
                    
                    if (state != 45)
                        sprite_index = spr_stompprep;
                }
                else
                {
                    instance_create(x, y + 50, obj_stompeffect);
                    stompAnim = 1;
                    other.baddieID.image_index = 0;
                    vsp = -9;
                    
                    if (state != 45)
                        sprite_index = spr_stompprep;
                }
            }
            
            if (instance_exists(other.baddieID) && y < other.baddieID.y && state == 99)
            {
                state = 99;
                sprite_index = spr_stupidrat_jelly;
                vsp = -20;
                scr_soundeffect(jellywiggle);
                
                repeat (8)
                    instance_create(x, y, obj_jellyjunk);
                
                other.baddieID.hp -= 1;
                
                with (instance_create(other.baddieID.x, other.baddieID.y, obj_bangeffect))
                    sprite_index = spr_parryeffect;
                
                with (instance_create(other.baddieID.x, other.baddieID.y, obj_bangeffect))
                    sprite_index = spr_kungfueffect;
                
                if (other.baddieID.hp <= 0)
                {
                    instance_destroy(other.baddieID);
                    instance_destroy(other.id);
                }
            }
            
            if (instance_exists(other.baddieID) && y < other.baddieID.y && state == 9090 && (sprite_index == spr_player_chainsawpogobounce || sprite_index == spr_player_chainsawpogo2))
            {
                vsp = -15;
                sprite_index = spr_player_chainsawpogobounce;
                image_index = 0;
                other.baddieID.hp -= 1;
                
                with (instance_create(other.baddieID.x, other.baddieID.y, obj_bangeffect))
                    sprite_index = spr_parryeffect;
                
                with (instance_create(other.baddieID.x, other.baddieID.y, obj_bangeffect))
                    sprite_index = spr_kungfueffect;
                
                if (other.baddieID.hp <= 0)
                {
                    instance_destroy(other.baddieID);
                    instance_destroy(other.id);
                }
                
                scr_soundeffect(sfx_bam);
            }
            
            if (instance_exists(other.baddieID) && (state == 42 || state == 73))
            {
                scr_soundeffect(sfx_hitenemy);
                global.combotime = 100;
                instance_create(other.baddieID.x, other.baddieID.y, obj_baddiegibs);
                other.baddieID.flash = 1;
                other.baddieID.state = 104;
                other.baddieID.hp -= 1;
                
                with (instance_create(other.baddieID.x, other.baddieID.y, obj_bangeffect))
                    sprite_index = spr_parryeffect;
                
                with (instance_create(other.baddieID.x, other.baddieID.y, obj_bangeffect))
                    sprite_index = spr_kungfueffect;
                
                if (other.baddieID.stunned < 100)
                    other.baddieID.stunned = 100;
                
                instance_create(other.baddieID.x, other.baddieID.y, obj_bangeffect);
                
                if (other.baddieID.hp <= 0)
                {
                    other.baddieID.stunned = 200;
                    other.baddieID.state = 104;
                }
                
                vsp = -7;
                state = 0;
                other.baddieID.vsp = -4;
                other.baddieID.hsp = xscale * 5;
            }
            
            if (instance_exists(other.baddieID) && state == 21 && character != "S")
            {
                if (shotgunAnim == 0)
                {
                    image_index = 0;
                    sprite_index = spr_haulingstart;
                    state = 45;
                    other.baddieID.state = 107;
                }
                else
                {
                    state = 37;
                    
                    with (instance_create(x, y, obj_pistoleffect))
                        image_xscale = other.image_xscale;
                    
                    image_index = 0;
                    sprite_index = spr_player_shotgun;
                    instance_create(x + (image_xscale * 20), y + 20, obj_shotgunbullet);
                    
                    with (instance_create(x + (image_xscale * 20), y + 20, obj_shotgunbullet))
                        spdh = 4;
                    
                    with (instance_create(x + (image_xscale * 20), y + 20, obj_shotgunbullet))
                        spdh = -4;
                    
                    other.baddieID.hp -= 1;
                    
                    with (instance_create(other.baddieID.x, other.baddieID.y, obj_bangeffect))
                        sprite_index = spr_parryeffect;
                    
                    with (instance_create(other.baddieID.x, other.baddieID.y, obj_bangeffect))
                        sprite_index = spr_kungfueffect;
                    
                    if (other.baddieID.hp <= 0)
                    {
                        instance_destroy(other.baddieID);
                        instance_destroy(other.id);
                    }
                    
                    global.hit += 1;
                    global.combotime = 100;
                }
            }
            
            if (instance_exists(other.baddieID) && state == 46)
            {
                if (!key_attack)
                {
                    sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch);
                    image_index = 0;
                    state = 56;
                    movespeed = 3;
                    vsp = -3;
                }
                else
                {
                    state = 69;
                    sprite_index = choose(spr_machpunch1, spr_machpunch2);
                    image_index = 0;
                    
                    if (key_jump2)
                    {
                        sprite_index = spr_mach2jump;
                        mach2jumpguy = 1;
                        suplexmove = 0;
                        vsp = -11;
                    }
                }
                
                with (instance_create(x + (32 * xscale), y, obj_bangeffect))
                {
                    sprite_index = spr_kungfueffect;
                    image_xscale = 1.5;
                    image_yscale = image_xscale;
                }
                
                other.baddieID.throwhsp = (xscale * 25) + (movespeed * xscale);
                other.baddieID.throwup = 0;
                var bou = 0;
                
                if (character == "N")
                    bou = 1;
                
                if (instance_exists(other.baddieID))
                {
                    with (other.baddieID)
                    {
                        if (image_xscale == -1)
                            y -= 1;
                        
                        if (image_xscale == 1)
                            y -= 1;
                        
                        hp -= 1;
                        
                        repeat (20)
                            instance_create(x, y, obj_baddiegibs);
                        
                        with (obj_camera)
                        {
                            shake_mag = 3;
                            shake_mag_acc = 3 / room_speed;
                        }
                        
                        alarm[3] = 3;
                        global.hit += 1;
                        
                        if (other.object_index == obj_pizzaball)
                            global.golfhit += 1;
                        
                        global.combotime = 100;
                        alarm[1] = 5;
                        stunned = 1000;
                        thrown = 1;
                        upthrow = 0;
                        state = 104;
                        
                        if (bou)
                            bounce = 1;
                    }
                }
                
                other.baddieID.vsp = -6;
                
                if (key_up)
                {
                    other.baddieID.throwvsp = -25;
                    other.baddieID.throwhsp = 0;
                    other.baddieID.upthrow = 1;
                    sprite_index = spr_player_uppercutfinishingblow;
                    image_index = 6;
                }
                
                scr_soundeffect(sfx_hitsound);
            }
            
            if (instance_exists(other.baddieID) && state == 95)
            {
                state = 56;
                vsp = -3;
                hsp *= -1;
                instance_create(x, y, obj_bangeffect);
                scr_soundeffect(ballhit);
                other.baddieID.throwhsp = xscale * 25;
                
                with (instance_create(other.baddieID.x, other.baddieID.y, obj_bangeffect))
                    sprite_index = spr_parryeffect;
                
                with (instance_create(other.baddieID.x, other.baddieID.y, obj_bangeffect))
                    sprite_index = spr_kungfueffect;
                
                if (instance_exists(other.baddieID))
                {
                    with (other.baddieID)
                    {
                        if (image_xscale == -1)
                            y -= 1;
                        
                        if (image_xscale == 1)
                            y -= 1;
                        
                        hp -= 1;
                        
                        repeat (20)
                            instance_create(x, y, obj_baddiegibs);
                        
                        with (obj_camera)
                        {
                            shake_mag = 3;
                            shake_mag_acc = 3 / room_speed;
                        }
                        
                        alarm[3] = 3;
                        global.hit += 1;
                        
                        if (other.object_index == obj_pizzaball)
                            global.golfhit += 1;
                        
                        global.combotime = 100;
                        alarm[1] = 5;
                        stunned = 1000;
                        thrown = 1;
                        state = 104;
                    }
                }
                
                other.baddieID.vsp = -6;
            }
        }
    }
}
