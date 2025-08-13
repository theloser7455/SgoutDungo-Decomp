creditY -= 1;

if ((creditY <= -2840 || obj_player.key_slap2) && !instance_exists(obj_fadeout))
{
    obj_camera.chargecamera = 0;
    obj_player1.sprite_index = obj_player1.spr_lookdoor;
    obj_player1.targetDoor = "D";
    obj_player1.image_index = 0;
    obj_player1.state = states.door;
    obj_player1.mach2 = 0;
    obj_player1.targetRoom = hub_room1;
    instance_create(x, y, obj_fadeout);
}

if (obj_player.key_jump2)
    creditY -= 2;
