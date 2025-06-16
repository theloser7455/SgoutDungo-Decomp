if (baddieid != id)
{
    if (place_meeting(x, y, obj_player) && fuckingdie)
    {
        instance_activate_object(baddieid);
        instance_activate_object(baddieid.baddieID);
        instance_activate_object(obj_forkhitbox);
        instance_destroy(baddieid);
        
        if (image_blend == c_red)
        {
            with (instance_create(x, y, obj_bombexplosion))
                player = obj_solid;
        }
        
        instance_destroy();
    }
}
