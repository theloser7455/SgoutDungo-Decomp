switch (state)
{
    case states.snickmachstart:
        scr_enemy_idle();
        break;
    
    case states.breakdanceattack:
        scr_enemy_charge();
        break;
    
    case states.stupidratstoproll:
        scr_enemy_turn();
        break;
    
    case states.uppercut:
        scr_enemy_walk();
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
}

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

scr_enemy_scarescript();

if (bombreset > 0)
    bombreset--;

if (x != obj_player.x && obj_player.state != states.knightpepslopes && obj_player.state != states.knightpep && state != states.stupidratroll && bombreset == 0 && grounded)
{
    if (obj_player.x > (x - 400) && obj_player.x < (x + 400) && y <= (obj_player.y + 20) && y >= (obj_player.y - 20))
    {
        if (state == states.uppercut)
        {
            image_index = 0;
            sprite_index = spr_pizzard_shoot;
            image_xscale = -sign(x - obj_player.x);
            state = states.stupidratroll;
        }
    }
}

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
