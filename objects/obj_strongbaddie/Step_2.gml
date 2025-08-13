if (vulnerable && (state == states.stunned || hurtandhitable))
    vulnerablespritealpha = Approach(vulnerablespritealpha, 0.75, 0.1);
else
    vulnerablespritealpha = Approach(vulnerablespritealpha, 0, 0.1);

fistframe += 0.25;

if (fistframe > 9)
    fistframe = 0;

if (hp <= 0)
{
    if ((phase + 1) <= phases)
    {
        phase += 1;
        hp = maxhp;
        scr_bossphasechange();
    }
    else
    {
        instance_destroy();
    }
}

if (state != states.enemygrabbed && state != states.unknown999)
    scr_collide();

if (flash == 1 && alarm[0] <= 0)
    alarm[0] = 0.15 * room_speed;

var a = 0;

with (obj_player)
{
    var b = 0;
    
    with (other)
        b = distance_to_object(obj_playernoisebombboss);
    
    if ((other.hurtandhitable && (state == states.handstandjump || instakillmove == 1 || state == states.punch || state == states.unknown444)) || (b <= 16 && other.hurtandhitable))
        a = 1;
}

if ((state == states.stunned || a) && immunityframes <= 0 && vulnerable)
{
    with (obj_player)
    {
        if (place_meeting(x, y, other) && (state == states.handstandjump || instakillmove == 1 || state == states.punch || state == states.unknown444))
        {
            if (other.hp > 1)
            {
                other.vsp = -5;
                other.xscale = xscale;
                other.state = states.portal;
                other.stunned = -1;
                
                with (instance_create(other.x, other.y, obj_bangeffect))
                    sprite_index = spr_parryeffect;
                
                with (instance_create(other.x, other.y, obj_bangeffect))
                    sprite_index = spr_kungfueffect;
                
                repeat (4)
                    instance_create(x, y, obj_slapstar);
                
                repeat (4)
                    instance_create(x, y, obj_baddiegibs);
                
                instance_create(x, y, obj_bangeffect);
                scr_soundeffect(sfx_killingblow);
                
                if (state == states.handstandjump)
                {
                    sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4);
                    image_index = 0;
                    state = states.tackle;
                    movespeed = 3;
                    vsp = -3;
                }
            }
            else
            {
                other.state = states.bossphase2transition;
                state = states.phase2transition;
                other.alarm[2] = 25;
                evilvar = 1;
                alarm[11] = 75;
                other.x = obj_player1.x + (obj_player1.xscale * 60);
                other.y = obj_player1.y;
                
                if (other.mask_index == spr_pepperman_mask)
                    other.y = obj_player1.y - 16;
                
                with (other)
                {
                    if (x != obj_player1.x)
                        xscale = -sign(x - obj_player1.x);
                }
                
                obj_camera.zooming = 1;
                obj_camera.zoomto = 0.5;
            }
            
            if (instance_exists(obj_peppermanmarbleblockboss) && !other.notboss)
                instance_destroy(obj_peppermanmarbleblockboss);
        }
    }
    
    with (obj_playernoisebombboss)
    {
        if (place_meeting(x, y, other))
        {
            if (other.hp > 1)
            {
                other.vsp = -5;
                other.xscale = image_xscale;
                other.state = states.portal;
                other.stunned = -1;
                
                with (instance_create(other.x, other.y, obj_bangeffect))
                    sprite_index = spr_parryeffect;
                
                with (instance_create(other.x, other.y, obj_bangeffect))
                    sprite_index = spr_kungfueffect;
                
                repeat (4)
                    instance_create(x, y, obj_slapstar);
                
                if (instance_exists(obj_peppermanmarbleblockboss) && !other.notboss)
                    instance_destroy(obj_peppermanmarbleblockboss);
                
                repeat (4)
                    instance_create(x, y, obj_baddiegibs);
                
                instance_destroy();
            }
            else
            {
                if (instance_exists(obj_peppermanmarbleblockboss))
                    instance_destroy(obj_peppermanmarbleblockboss);
                
                other.state = states.bossphase2transition;
                other.alarm[2] = 25;
                obj_player1.state = states.phase2transition;
                obj_player1.evilvar = 1;
                obj_player1.alarm[11] = 75;
                
                with (instance_create(obj_player1.x, obj_player1.y, obj_bangeffect))
                    sprite_index = spr_genericpoofeffect;
                
                obj_player1.x = other.x;
                other.x = obj_player1.x + (obj_player1.xscale * 60);
                other.y = obj_player1.y;
                
                with (instance_create(obj_player1.x, obj_player1.y, obj_bangeffect))
                    sprite_index = spr_genericpoofeffect;
                
                if (other.mask_index == spr_pepperman_mask)
                    other.y = obj_player1.y - 16;
                
                with (other)
                {
                    if (x != obj_player1.x)
                        xscale = -sign(x - obj_player1.x);
                }
                
                obj_camera.zooming = 1;
                obj_camera.zoomto = 0.5;
                instance_destroy();
            }
        }
    }
}
else
{
    with (instance_place(x, y, obj_playernoisebombboss))
    {
        splode = 0;
        
        with (instance_create(x, y, obj_sausageman_dead))
        {
            sprite_index = spr_playerN_noisebomb;
            hsp = 0;
            vsp = 0;
            spr_palette = obj_player.spr_palette;
            paletteselect = obj_player.paletteselect;
        }
        
        instance_destroy();
    }
}
