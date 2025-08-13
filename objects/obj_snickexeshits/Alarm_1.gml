with (instance_create(x, y, obj_afterimog))
{
    sprite_index = other.sprite_index;
    image_alpha = 0.75;
}

alarm[1] = 2;

if (obj_player.state == states.comingoutdoor || obj_player.state == states.victory || obj_player.state == states.keyget || obj_player.state == states.door)
    instance_destroy();
