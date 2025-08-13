repeat (8)
{
    with (instance_create(x + random_range(100, -100), y + random_range(100, -100), obj_bangeffect))
    {
        sprite_index = choose(spr_glitch1, spr_glitch2, spr_glitch3);
        image_speed = 0.35;
        depth = obj_player.depth - 1;
    }
}

alarm[0] = 5;
