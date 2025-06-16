if (room == rank_room || room == timesuproom)
    visible = false;
else
    visible = true;

if (sprite_index == spr_toppinshroom_intro && floor(image_index) == (image_number - 1))
    sprite_index = spr_pizzakinshroom;

if (global.devilkin == 1 && sprite_index != spr_toppinshroom_intro)
{
    image_alpha = obj_player.image_alpha;
    
    if (obj_player.hsp != 0)
        sprite_index = spr_thedevilkin_run;
    else
        sprite_index = spr_thedevilkin;
    
    depth = -7;
    ds_queue_enqueue(followQueue, obj_player.x + (image_xscale * 64));
    ds_queue_enqueue(followQueue, obj_player.y);
    LAG_STEPS = 10;
    
    if (ds_queue_size(followQueue) > (LAG_STEPS * 2))
    {
        x = ds_queue_dequeue(followQueue) - (image_xscale * 4);
        y = ds_queue_dequeue(followQueue) + 2;
    }
    
    image_xscale = obj_player.xscale;
}

with (instance_place(x, y, obj_destructibles))
    instance_destroy();

with (instance_place(x, y, obj_metalblock))
    instance_destroy();

with (instance_place(x, y, obj_baddie))
    instance_destroy();
