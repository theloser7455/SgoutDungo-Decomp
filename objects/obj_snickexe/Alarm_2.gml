if (dashamounts <= 0)
{
    alarm[2] = -1;
    shake = 0;
    evilcharge = 0;
    
    with (instance_create(x, y, obj_evilsnickbeam))
    {
        if (obj_player.y > y)
            image_yscale = -1;
        
        image_angle += (25 * image_yscale);
    }
    
    beamshot = 1;
}
