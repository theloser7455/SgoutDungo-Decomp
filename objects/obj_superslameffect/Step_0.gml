x = obj_player.x;
y = obj_player.y;

if (obj_player.state != states.freefall && obj_player.state != states.superslam)
    instance_destroy();
