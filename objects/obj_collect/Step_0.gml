if (global.collectsound < 10)
    global.collectsound += 1;

if (fuckass)
{
    speed = Approach(speed, 0, 1);
    
    if (speed == 0 && alarm[0] <= 0)
        alarm[0] = 50;
}

if (gotoplayer)
{
    speed += 0.25;
    direction = point_direction(x, y, obj_player.x, obj_player.y);
}

if (distance_to_object(obj_player) <= 64 && !fuckass && !gotoplayer)
{
    gotoplayer = 1;
    speed = 2.5;
}
