playerhealthframe += 0.35;

if (playerhealthframe > sprite_get_number(obj_player.hpicon))
    playerhealthframe = 0;

audio_sound_pitch(obj_music.pausedmusic, pitch);

if (!instance_exists(bossid))
    pitch = Approach(pitch, 0, 0.015);

if (!instance_exists(bossid))
    exit;

if (bossid.object_index == obj_idiot)
{
    if (idiotrot > 360)
        idiotrot = 1;
    
    idiotrot++;
}
else
{
    idiotrot = 0;
}

bosshp = bossid.hp;
bossmaxhp = bossid.maxhp;
hpicon = bossid.hpicon;
paletteselect = bossid.paletteselect;
spr_palette = bossid.spr_palette;

if (playerhealth <= 0)
{
    with (obj_player)
    {
        if (state != states.timesup)
        {
            instance_create(x, y, obj_gameoverrestart);
            state = states.timesup;
            sprite_index = spr_Timesup;
            image_index = 0;
            audio_stop_all();
            scr_soundeffect(mu_timesup);
        }
    }
}

sprite_index = hpicon;
var hurttimes = playerhealthmax - playerhealth;
var hurttimess = hurttimes;
var need = prevhpP - playerhealth - 1;

if (prevhpP != playerhealth)
{
    for (var i = 0; i < hurttimes; i++)
    {
        var healthy = 120;
        var thingx = (playerhealthmax / 2) * 32;
        
        if ((playerhealthmax / 2) <= i)
        {
            healthy -= 25;
            thingx = (playerhealthmax / 2) * 64;
        }
        
        hurttimess--;
        
        if (hurttimess <= need)
        {
            with (instance_create(56 + (i * -32) + thingx, healthy, obj_bangeffect))
                depth = -10000;
            
            with (instance_create(56 + (i * -32) + thingx, healthy, obj_sausageman_dead))
            {
                depth = -10001;
                sprite_index = obj_player.hpicon;
                hsp = random_range(10, 5);
                vsp = random_range(-7, -5);
                paletteselect = obj_player.paletteselect;
                spr_palette = obj_player.spr_palette;
            }
        }
    }
    
    scr_soundeffect(sfx_loseknight);
}

prevhpP = playerhealth;
hurttimes = bossmaxhp - bosshp;
hurttimess = hurttimes;
need = prevhpB - bosshp - 1;

if (prevhpB != bosshp)
{
    for (var i = 0; i < hurttimes; i++)
    {
        var healthy = 120;
        var thingx = (bossmaxhp / 2) * -32;
        
        if ((bossmaxhp / 2) <= i)
        {
            healthy -= 25;
            thingx = (bossmaxhp / 2) * -64;
        }
        
        hurttimess--;
        
        if (hurttimess <= need)
        {
            with (instance_create(904 + (i * 32) + thingx, healthy, obj_bangeffect))
                depth = -10000;
            
            with (instance_create(904 + (i * 32) + thingx, healthy, obj_sausageman_dead))
            {
                depth = -10001;
                sprite_index = other.hpicon;
                hsp = random_range(-10, -5);
                vsp = random_range(-7, -5);
                paletteselect = other.paletteselect;
                spr_palette = other.spr_palette;
            }
        }
    }
    
    scr_soundeffect(sfx_killenemy);
}

prevhpB = bosshp;

if (bossid.state == states.bossphase2transition)
    pitch = Approach(pitch, 0, 0.015);
else
    pitch = Approach(pitch, 1, 0.015);
