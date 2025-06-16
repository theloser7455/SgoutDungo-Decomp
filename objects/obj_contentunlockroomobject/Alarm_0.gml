obj_player.targetDoor = "A";
obj_player.targetRoom = hub_room1;

with (instance_create(x, y, obj_fadeout))
    targetRoom = hub_room1;

alarm[0] = -1;
