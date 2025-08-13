if (melt)
{
    if (distance_to_object(obj_player1) <= 200)
    {
        instance_destroy();
        
        with (instance_create(x, y, obj_sausageman_dead))
        {
            sprite_index = spr_pizzacuttersaw;
            image_angle = other.image_angle;
            image_xscale = other.image_xscale;
            image_yscale = other.image_yscale;
            hsp = 0;
            vsp = 0;
            scr_soundeffect(fartie);
        }
    }
}

if (melting)
{
    vspeed -= 0.01;
    
    if (image_xscale > 0)
        image_xscale -= 0.03125;
    
    image_yscale += 0.0625;
}

if (image_xscale <= 0)
    instance_destroy();

if (!melt)
{
    if ((obj_player.movespeed > 20 && obj_player.state == states.mach3) || obj_player.state == states.Nfork || obj_player.state == states.kungfu || obj_player.state == states.punch)
        team = 1;
    else
        team = 0;
}

if (place_meeting(x, y, obj_player) && team)
{
    with (instance_create(obj_player.x, obj_player.y, obj_sausageman_dead))
    {
        image_angle = 0;
        image_xscale = other.image_xscale;
        image_yscale = other.image_yscale;
        sprite_index = spr_pizzacutterfalling;
        hsp = obj_player.hsp * 1.25;
    }
    
    with (obj_player)
    {
        repeat (4)
            instance_create(x, y, obj_slapstar);
        
        repeat (4)
            instance_create(x, y, obj_baddiegibs);
    }
    
    scr_soundeffect(sfx_killenemy);
    scr_soundeffect(sfx_breakmetal);
    
    with (obj_camera)
    {
        shake_mag = 6;
        shake_mag_acc = 6 / room_speed;
    }
    
    instance_destroy();
}
