if (state != 107)
{
    scr_collide();
    visible = true;
    var windx = 0;
    var windy = 0;
    
    with (instance_place(x, y, obj_wind))
    {
        windx = xforce;
        windy = yforce;
    }
    
    if (!scr_solid(x + windx, y))
        x += windx;
    
    if (!scr_solid(x, y + windy))
        y += windy;
}
else if (obj_player.character == "R")
{
    visible = false;
}

if (scaredbuffer > -1)
    scaredbuffer--;
