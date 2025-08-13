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

scr_enemy_scarescript();

if (sprite_index == spr_pepperman_shoulderstart && floor(image_index) == (image_number - 1))
{
    if (hitboxcreate == 0 && state == states.breakdanceattack)
    {
        hitboxcreate = 1;
        
        with (instance_create(x, y, obj_forkhitbox))
            ID = other.id;
    }
    
    sprite_index = spr_pepperman_shoulderloop;
    movespeed = 10;
}

if (x != obj_player1.x && state != states.breakdanceattack)
{
    if (obj_player1.x > (x - 200) && obj_player1.x < (x + 200) && y <= (obj_player1.y + 50) && y >= (obj_player1.y - 50))
    {
        if (state == states.uppercut)
        {
            image_index = 0;
            image_xscale = -sign(x - obj_player.x);
            state = states.breakdanceattack;
            sprite_index = spr_pepperman_shoulderstart;
            turns = 2;
            movespeed = 12;
        }
    }
}

if (state == states.enemystun || state == states.uppercut)
    movespeed = 0;

if (state != states.enemystun)
    thrown = 0;

if (boundbox == 0)
{
    with (instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = spr_forknight_stun;
        mask_index = other.sprite_index;
        baddieID = other.id;
        other.boundbox = 1;
    }
}
