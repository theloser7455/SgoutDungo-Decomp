if (global.deathmode) {
    with (instance_create(832, 448, obj_sausageman_dead))
        sprite_index = spr_pizzaface_hurt;
    
    global.deathmode = 0;
}

if (instance_exists(obj_sigmaface))
    instance_destroy(obj_sigmaface);
