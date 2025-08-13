image_angle += (spinspeed * image_xscale);

if (!place_meeting(x, y, obj_pizzacutter2))
    spinspeed = Approach(spinspeed, 0, 0.25);
