with (obj_player1)
{
    if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && (obj_player.state == states.mach3 || obj_player.state == states.playerpeppermanmach || obj_player.state == states.stupidratroll || obj_player.state == states.knightpepslopes || obj_player.state == states.kungfu || obj_player.state == states.freefall || obj_player.state == states.jetpack || (obj_player.state == states.breakdanceattack && (obj_player.sprite_index == spr_player_buttattack || obj_player.sprite_index == spr_player_buttattackstart)) || (obj_player.state == states.crouchslide && obj_player.movespeed >= 12) || (obj_player.state == states.machroll && obj_player.movespeed >= 12) || obj_player.state == states.punch || (obj_player.state == states.Nfork && movespeed >= 10)))
        instance_destroy(other.id);
}

if (place_meeting(x, y + 1, obj_player) || place_meeting(x, y - 1, obj_player) || place_meeting(x - 1, y, obj_player) || place_meeting(x + 1, y, obj_player))
{
    if (place_meeting(x, y - 1, obj_player) && obj_player.freefallsmash >= 10 && (obj_player.state == states.freefall || obj_player.state == states.playerpeppermangroundpound || obj_player.state == states.freefallland || obj_player.state == states.kungfu || obj_player.state == states.Ncrusher))
        instance_destroy();
    
    if (place_meeting(x, y - 1, obj_player) && (obj_player.state == states.knightpep || obj_player.state == states.kungfu || obj_player.state == states.hookshot || (obj_player.state == states.snickclimbdown && (obj_player.sprite_index == spr_player_buttattackstart || obj_player.sprite_index == spr_player_buttattack))))
    {
        instance_destroy();
        tile_layer_delete_at(1, x, y);
    }
}

depth = obj_player.depth + 4;
