if (visited == 1 && sprite_index != spr_pepperdoor)
{
    sprite_index = spr_doorvisited;
    
    if (golden)
        sprite_index = spr_goldendoorvisited;
    
    if (imold)
        sprite_index = spr_oldassdoor;
}

if (instance_exists(obj_noisesatellite))
    sprite_index = spr_doorblocked;

if (place_meeting(x, y, obj_doorA))
    targetDoor = "A";

if (place_meeting(x, y, obj_doorB))
    targetDoor = "B";

if (place_meeting(x, y, obj_doorC))
    targetDoor = "C";

if (place_meeting(x, y, obj_doorD))
    targetDoor = "D";

if (place_meeting(x, y, obj_doorE))
    targetDoor = "E";

if (secret)
    image_alpha = 1.25 + (-distance_to_object(obj_player) / 100);

image_speed = 0.35;
var m = "mcpig if you're reading this you should kill yourself";
