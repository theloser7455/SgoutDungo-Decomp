hsp = image_xscale * 12;

if (place_meeting(x, y, obj_baddie))
    instance_destroy();

if (place_meeting(x + hsp, y, obj_destructibles))
    instance_destroy();

if (place_meeting(x + hsp, y, obj_bombblock))
    instance_destroy();

if (scr_solid(x + hsp, y) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_bombblock))
    image_xscale *= -1;

scr_collide();
image_blend = make_color_rgb(225, countdown, countdown);
countdown -= 1;

if (countdown <= 0)
    instance_destroy();
