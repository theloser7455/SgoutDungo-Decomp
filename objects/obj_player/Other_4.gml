if (targetDoor == "A")
{
    if (!instance_exists(obj_doorA))
        exit;
    
    if (hallway == 1)
        x = obj_doorA.x + (hallwaydirection * 100);
    else if (box == 1)
        x = obj_doorA.x + 32;
    else
        x = obj_doorA.x + 16;
    
    y = obj_doorA.y - 14;
    hallway = 0;
    box = 0;
}

if (targetDoor == "B")
{
    if (!instance_exists(obj_doorB))
        exit;
    
    if (hallway == 1)
        x = obj_doorB.x + (hallwaydirection * 100);
    else if (box == 1)
        x = obj_doorB.x + 32;
    else
        x = obj_doorB.x + 16;
    
    y = obj_doorB.y - 14;
    hallway = 0;
    box = 0;
}

if (targetDoor == "C")
{
    if (!instance_exists(obj_doorC))
        exit;
    
    if (hallway == 1)
        x = obj_doorC.x + (hallwaydirection * 100);
    else if (box == 1)
        x = obj_doorC.x + 32;
    else
        x = obj_doorC.x + 16;
    
    y = obj_doorC.y - 14;
    hallway = 0;
    box = 0;
}

if (targetDoor == "D")
{
    if (!instance_exists(obj_doorD))
        exit;
    
    if (hallway == 1)
        x = obj_doorD.x + (hallwaydirection * 100);
    else if (box == 1)
        x = obj_doorD.x + 32;
    else
        x = obj_doorD.x + 16;
    
    y = obj_doorD.y - 14;
    hallway = 0;
    box = 0;
}

if (targetDoor == "E")
{
    if (!instance_exists(obj_doorE))
        exit;
    
    if (hallway == 1)
        x = obj_doorE.x + (hallwaydirection * 100);
    else if (box == 1)
        x = obj_doorE.x + 32;
    else
        x = obj_doorE.x + 16;
    
    y = obj_doorE.y - 14;
    hallway = 0;
    box = 0;
}

if (place_meeting(x, y, obj_boxofpizza))
{
    with (instance_place(x, y, obj_boxofpizza))
    {
        if (image_yscale == -1)
            other.y += 32;
    }
}

if (global.hallucination > 0 && (global.panic || global.snickchallenge))
{
    with (instance_create(random_range(room_width, 0), random_range(room_height, obj_slope), obj_hallucination))
    {
        type = 2;
        sprite_index = spr_pizzaface;
        image_yscale = -1;
        thing = 100;
    }
}

if (global.shroomfollow == 1)
    instance_create(x, y, obj_pizzakinshroom);

if (global.cheesefollow == 1)
    instance_create(x, y, obj_pizzakincheese);

if (global.tomatofollow == 1)
    instance_create(x, y, obj_pizzakintomato);

if (global.sausagefollow == 1)
    instance_create(x, y, obj_pizzakinsausage);

if (global.pineapplefollow == 1)
    instance_create(x, y, obj_pizzakinpineapple);

roomstartx = x;
roomstarty = y;

if (room == Realtitlescreen)
{
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
}
