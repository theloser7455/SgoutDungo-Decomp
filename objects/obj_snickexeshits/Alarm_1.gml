with (instance_create(x, y, obj_afterimog))
{
    sprite_index = other.sprite_index;
    image_alpha = 0.75;
}

alarm[1] = 2;

if (obj_player.state == 60 || obj_player.state == 63 || obj_player.state == 55 || obj_player.state == 77)
    instance_destroy();
