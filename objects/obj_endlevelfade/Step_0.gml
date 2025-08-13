with (obj_player)
{
    if (room == rank_room)
    {
        obj_player.x = lerp(obj_player.x, 480, 0.25);
        obj_player.y = lerp(obj_player.y, 270, 0.25);
    }
}

obj_camera.visible = false;

if (fadealpha > 1)
{
    fadein = 1;
    
    if (room != rank_room)
        room = rank_room;
}

if (fadein == 0)
    fadealpha += 0.1;
else if (fadein == 1)
    fadealpha -= 0.1;
