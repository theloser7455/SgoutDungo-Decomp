creditY -= 1;

if ((creditY <= -1700 && !instance_exists(obj_fadeout)) || obj_player.key_slap2)
{
    obj_camera.chargecamera = 0;
    obj_player1.sprite_index = obj_player1.spr_lookdoor;
    obj_player1.targetDoor = "E";
    obj_player1.image_index = 0;
    obj_player1.state = 77;
    obj_player1.mach2 = 0;
    obj_player1.targetRoom = hub_room1;
    instance_create(x, y, obj_fadeout);
}

if (obj_player.key_jump2)
    creditY -= 1;
