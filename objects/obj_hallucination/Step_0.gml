image_alpha = -1.25 + (distance_to_object(obj_player) / thing);

if (image_alpha <= 0)
    instance_destroy();

switch (type)
{
    case 1:
        break;
    
    case 2:
        var sk = 1;
        x += lengthdir_x(spid / sk, point_direction(x, y, obj_player1.x, obj_player1.y));
        y += lengthdir_y(spid / sk, point_direction(x, y, obj_player1.x, obj_player1.y));
        
        if (spid < 35)
            spid += 1;
        
        break;
}
