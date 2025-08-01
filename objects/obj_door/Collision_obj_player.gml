with (other.id)
{
    if (key_up && (state == 0 || state == 68 || state == 69 || state == 89 || state == 64) && y == (other.y + 50) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != 77 && state != 60)
    {
        lastroom_x = other.x;
        lastroom_y = other.y;
        lastroom = room;
        scr_soundeffect(sfx_door);
        obj_camera.chargecamera = 0;
        ds_list_add(global.saveroom, id);
        obj_player1.sprite_index = obj_player1.spr_lookdoor;
        obj_player1.targetDoor = other.targetDoor;
        obj_player1.targetRoom = other.targetRoom;
        obj_player1.image_index = 0;
        obj_player1.state = 77;
        obj_player1.mach2 = 0;
        
        if (room == PP_room14)
            obj_player1.enemiesswallowed = 0;
        
        if (instance_exists(obj_player2))
        {
            if (object_index == obj_player2)
            {
                obj_player1.x = obj_player2.x;
                obj_player1.y = obj_player2.y;
            }
            
            if (object_index == obj_player1)
            {
                obj_player2.x = obj_player1.x;
                obj_player2.y = obj_player1.y;
            }
            
            obj_player2.sprite_index = obj_player2.spr_lookdoor;
            obj_player2.targetDoor = other.targetDoor;
            obj_player2.targetRoom = other.targetRoom;
            obj_player2.image_index = 0;
            obj_player2.state = 77;
            obj_player2.mach2 = 0;
        }
        
        other.visited = 1;
        instance_create(x, y, obj_fadeout);
    }
}
