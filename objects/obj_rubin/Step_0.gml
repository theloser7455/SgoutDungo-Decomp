switch (state)
{
    case states.snickmachstart:
        scr_enemy_idle();
        break;
    
    case states.stupidratstoproll:
        scr_enemy_turn();
        break;
    
    case states.uppercut:
        scr_enemy_walk();
        var x2 = obj_player1.x;
        
        if (x2 < (x + 128) && x2 > (x - 128))
        {
            state = states.handstandjump;
            vsp = -5;
        }
        
        break;
    
    case states.enemyland:
        scr_enemy_land();
        break;
    
    case states.enemyhit:
        scr_enemy_hit();
        break;
    
    case states.enemystun:
        scr_enemy_stun();
        break;
    
    case states.stupidratroll:
        scr_pizzagoblin_throw();
        break;
    
    case states.enemygrabbed:
        scr_enemy_grabbed();
        break;
    
    case states.handstandjump:
        if (vsp > 0)
            vsp += 1;
        
        if (grounded)
            instance_destroy();
        
        break;
}

if (hitboxcreate == 0 && state == states.handstandjump)
{
    hitboxcreate = 1;
    
    with (instance_create(x, y, obj_forkhitbox))
        ID = other.id;
}

if (state != states.handstandjump)
    hitboxcreate = 0;

if (state == states.enemystun && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != states.enemystun)
    birdcreated = 0;

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state != states.enemygrabbed)
    depth = 0;

if (state != states.enemystun)
    thrown = 0;

if (boundbox == 0)
{
    with (instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index;
        mask_index = other.sprite_index;
        baddieID = other.id;
        other.boundbox = 1;
    }
}
