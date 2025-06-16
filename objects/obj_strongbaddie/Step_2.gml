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

if (state != 107 && state != 999)
    scr_collide();

if (flash == 1 && alarm[0] <= 0)
    alarm[0] = 0.15 * room_speed;

var a = 0;

with (obj_player)
{
    var b = 0;
    
    with (other)
        b = distance_to_object(obj_playernoisebombboss);
    
    if ((other.hurtandhitable && (state == 21 || instakillmove == 1 || state == 46 || state == 444)) || (b <= 16 && other.hurtandhitable))
        a = 1;
}

if ((state == 30 || a) && immunityframes <= 0 && vulnerable)
{
    with (obj_player)
    {
        if (place_meeting(x, y, other) && (state == 21 || instakillmove == 1 || state == 46 || state == 444))
        {
            other.vsp = -5;
            other.xscale = xscale;
            other.state = 18;
            other.stunned = -1;
            
            with (instance_create(other.x, other.y, obj_bangeffect))
                sprite_index = spr_parryeffect;
            
            with (instance_create(other.x, other.y, obj_bangeffect))
                sprite_index = spr_kungfueffect;
            
            repeat (4)
                instance_create(x, y, obj_slapstar);
            
            scr_soundeffect(sfx_whip);
            sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch);
            image_index = 0;
            state = 56;
            movespeed = 3;
            vsp = -3;
            
            if (instance_exists(obj_peppermanmarbleblockboss))
                instance_destroy(obj_peppermanmarbleblockboss);
        }
    }
    
    with (obj_playernoisebombboss)
    {
        if (place_meeting(x, y, other))
        {
            other.vsp = -5;
            other.xscale = image_xscale;
            other.state = 18;
            other.stunned = -1;
            
            if (instance_exists(obj_peppermanmarbleblockboss))
                instance_destroy(obj_peppermanmarbleblockboss);
            
            instance_destroy();
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
