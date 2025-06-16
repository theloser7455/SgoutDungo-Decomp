if (place_meeting(x, y, obj_player) && global.deathmode && (room == medieval_1 || (room == ruin_1 && !global.snickchallenge) || (room == dungeon_1 && !global.snickchallenge)))
{
    global.minutes = 0;
    global.seconds = 20;
    global.draintime = 1;
    obj_camera.alarm[1] = 60;
}
