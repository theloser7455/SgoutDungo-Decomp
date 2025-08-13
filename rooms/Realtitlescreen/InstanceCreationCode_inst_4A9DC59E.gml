if (character != "R")
{
    if (shotgunAnim == 0)
    {
        image_index = 0;
        state = states.freefallprep;
        sprite_index = spr_bodyslamstart;
        vsp = -6;
    }
    else
    {
        scr_soundeffect(sfx_killingblow);
        image_index = 0;
        state = states.freefallprep;
        sprite_index = spr_player_shotgunjump1;
        vsp = -10;
        
        with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
        {
            sprite_index = sprite10391;
            spdh = -10;
            spd = 0;
        }
        
        with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
        {
            sprite_index = sprite10391;
            spdh = -10;
            spd = 5;
        }
        
        with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
        {
            sprite_index = sprite10391;
            spdh = -10;
            spd = -5;
        }
    }
}
else
{
    image_index = 0;
    state = states.stupidratcheeseslam;
    sprite_index = spr_bodyslamstart;
    scr_soundeffect(cheesefall);
    vsp = -10;
}

x = 480;
y = -160;
