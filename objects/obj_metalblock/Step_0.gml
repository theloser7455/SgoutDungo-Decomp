with (obj_player1)
{
    if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && (obj_player.state == 89 || obj_player.state == 602 || obj_player.state == 95 || obj_player.state == 17 || obj_player.state == 73 || obj_player.state == 308 || (obj_player.state == 9459 && movespeed >= 10)))
        instance_destroy(other.id);
}

if (place_meeting(x, y + 1, obj_player) || place_meeting(x, y - 1, obj_player) || place_meeting(x - 1, y, obj_player) || place_meeting(x + 1, y, obj_player))
{
    if (place_meeting(x, y - 1, obj_player) && obj_player.freefallsmash >= 10 && (obj_player.state == 73 || obj_player.state == 603 || obj_player.state == 76 || obj_player.state == 4719))
        instance_destroy();
    
    if (place_meeting(x, y - 1, obj_player) && (obj_player.state == 23 || obj_player.state == 8 || (obj_player.state == 93 && (obj_player.sprite_index == spr_player_buttattackstart || obj_player.sprite_index == spr_player_buttattack))))
    {
        instance_destroy();
        tile_layer_delete_at(1, x, y);
    }
}
