if (room == ruin_10 && obj_player.state == states.bombpep)
    shart = 100;

if (move && image_alpha >= 1)
{
    x += lengthdir_x(spid, point_direction(x, y, obj_player1.x, obj_player1.y));
    y += lengthdir_y(spid, point_direction(x, y, obj_player1.x, obj_player1.y));
    spid = Approach(spid, 15, 0.5);
}
else if (!move)
{
    hspeed = 0;
    vspeed = 0;
    spid = 0;
}

if (!stun)
{
    if (image_alpha < 0)
        move = 0;
    else
        move = 1;
    
    if (sprite_index != spr_pizzaface_intro2)
        sprite_index = spr_pizzaface;
    
    if (sprite_index == spr_pizzaface_intro2 && floor(image_index) == (image_number - 1))
        sprite_index = spr_pizzaface;
}

if ((place_meeting(x, y, obj_player) && move == 1 && obj_player.character != "TERRENCE" && image_alpha >= 1) && !instance_exists(obj_fadeout))
{
    repeat (8)
    {
        with (instance_create(x + random_range(100, -100), y + random_range(100, -100), obj_bangeffect))
            sprite_index = spr_bombexplosion;
    }
    
    global.seconds = 99999;
    x = -999;
    y = -999;
    hspeed = 0;
    vspeed = 0;
    
    if (!global.instantR)
        instance_create(x, y, obj_bossdefeatflash);
    
    if (instance_exists(obj_baddie))
        instance_destroy(obj_baddie);
    
    scr_gameover_setup();
    scr_soundeffect(sfx_killenemy);
    scr_soundeffect(sfx_bombpepexplode);
}

var e = 1;

if (obj_player.state == states.comingoutdoor || obj_player.state == states.victory || obj_player.state == states.keyget || obj_player.state == states.door || (obj_player.state == states.bombpep && (obj_player.sprite_index == obj_player.spr_bombpepintro || obj_player.sprite_index == obj_player.spr_bombpepend)) || instance_exists(obj_treasure))
{
    e = 0.75;
    hspeed = 0;
    vspeed = 0;
}

image_alpha = Approach(image_alpha, e, 0.01);

if (image_blend == c_red && alarm[1] <= 0)
    alarm[1] = 0.15 * room_speed;
