if (room == rank_room || room == timesuproom)
    visible = false;

if (obj_player.state == 52)
    visible = false;

if (sprite_index == spr_toppinsausage_intro && floor(image_index) == (image_number - 1))
    sprite_index = spr_toppinsausage;

if ((global.sausagefollow == 1 && sprite_index != spr_toppinsausage_intro) && !taunt)
{
    image_alpha = obj_player.image_alpha;
    
    if (obj_player.hsp != 0)
        sprite_index = spr_toppinsausage_run;
    else
        sprite_index = spr_toppinsausage;
    
    depth = -6;
    
    if (global.tomatofollow == 1)
    {
        ds_queue_enqueue(followQueue, obj_pizzakintomato.x - (image_xscale * 32));
        ds_queue_enqueue(followQueue, obj_pizzakintomato.y);
    }
    else if (global.cheesefollow == 1)
    {
        ds_queue_enqueue(followQueue, obj_pizzakincheese.x - (image_xscale * 32));
        ds_queue_enqueue(followQueue, obj_pizzakincheese.y);
    }
    else if (global.shroomfollow == 1)
    {
        ds_queue_enqueue(followQueue, obj_pizzakinshroom.x - (image_xscale * 32));
        ds_queue_enqueue(followQueue, obj_pizzakinshroom.y);
    }
    else
    {
        ds_queue_enqueue(followQueue, obj_player.x - (image_xscale * 32));
        ds_queue_enqueue(followQueue, obj_player.y);
    }
    
    LAG_STEPS = 10;
    
    if (ds_queue_size(followQueue) > (LAG_STEPS * 2))
    {
        var a = 1;
        x = lerp(x, ds_queue_dequeue(followQueue) - (image_xscale * 4), a);
        y = lerp(y, ds_queue_dequeue(followQueue), a);
    }
    
    image_xscale = obj_player.xscale;
}

if ((((global.playerhealth == 1 && global.sausagefollow == 1) || global.panic || global.deathmode || global.snickchallenge) && sprite_index != spr_toppinsausage_run) && !taunt)
    sprite_index = spr_toppinsausage_panic;

if (obj_player.state != states.backbreaker && taunt)
    taunt = 0;

if (taunt)
    image_speed = 0;
else
    image_speed = 0.35;
