if (selected == 0)
{
    if (keyboard_check_pressed(vk_f5))
    {
        instance_create(0, 0, obj_manual);
        selected = 1;
    }
    
    var a = 0;
    
    with (brickid)
    {
        if (place_meeting(x, y - 1, obj_player) && obj_player.state == states.freefallland)
            a = 1;
    }
    
    if (a)
    {
        scr_soundeffect(sfx_collecttoppin);
        obj_file1.sprite_index = spr_file1confirm;
        selected = 1;
        alarm[0] = 5;
    }
    
    var a2 = 0;
    
    with (brickid1)
    {
        if (place_meeting(x, y - 1, obj_player) && obj_player.state == states.freefallland)
            a2 = 1;
    }
    
    if (a2)
    {
        scr_soundeffect(sfx_collecttoppin);
        selected = 1;
        alarm[1] = 5;
    }
    
    var a3 = 0;
    
    with (brickid2)
    {
        if (place_meeting(x, y - 1, obj_player) && obj_player.state == states.freefallland)
            a3 = 1;
    }
    
    if (a3)
    {
        scr_soundeffect(sfx_collecttoppin);
        selected = 1;
        alarm[2] = 5;
    }
}

var lay_id = layer_get_id("Backgrounds_2");
var back_id = layer_background_get_id(lay_id);
layer_background_index(back_id, optionselected);
m = 0;
m1 = 0;
m2 = 0;
