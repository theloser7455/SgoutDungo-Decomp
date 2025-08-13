if (room == rank_room || room == timesuproom)
    visible = false;

if (obj_player.state == 52)
    visible = false;

if (sprite_index == spr_toppinshroom_intro && floor(image_index) == (image_number - 1))
    sprite_index = spr_toppinshroom;

if (global.shroomfollow == 1 && sprite_index != spr_toppinshroom_intro && !taunt)
{
    image_alpha = obj_player.image_alpha;
    
    if (obj_player.hsp != 0)
        sprite_index = spr_toppinshroom_run;
    else
        sprite_index = spr_toppinshroom;
    
    depth = -6;
    ds_queue_enqueue(followQueue, obj_player.x - thing);
    ds_queue_enqueue(followQueue, obj_player.y);
    LAG_STEPS = 10;
    
    if (ds_queue_size(followQueue) > (LAG_STEPS * 2))
    {
        var a = 1;
        x = lerp(x, ds_queue_dequeue(followQueue) - (image_xscale * 4), a);
        y = lerp(y, ds_queue_dequeue(followQueue), a);
    }
    
    image_xscale = obj_player.xscale;
}

if (taunt)
    image_speed = 0;
else
    image_speed = 0.35;

if ((((global.playerhealth == 1 && global.shroomfollow == 1) || global.panic || global.deathmode || global.snickchallenge) && sprite_index != spr_toppinshroom_run) && !taunt)
    sprite_index = spr_toppinshroom_panic;

thing = lerp(thing, image_xscale * 32, 0.25);

if (obj_player.state != states.backbreaker && taunt)
    taunt = 0;
