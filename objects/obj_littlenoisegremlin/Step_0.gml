scr_collide();

if (x != obj_player1.x)
    image_xscale = -sign(x - obj_player1.x);

hsp = Approach(hsp, image_xscale * 8, 0.1);
var fly = 0;

if (obj_player.y < y)
    fly = 1;

if (obj_player.y >= y && scr_solid(x + image_xscale, y))
    fly = 1;

if (fly)
{
    vsp = Approach(vsp, -15, 1);
    sprite_index = spr_playerN_boxxedjetpack;
}

if (!grounded && !fly)
{
    if (sprite_index == spr_playerN_boxxedjetpack || sprite_index == spr_playerN_boxxedmove)
    {
        sprite_index = spr_playerN_boxxedjetpackfall;
        image_index = 0;
    }
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerN_boxxedjetpackfall)
        sprite_index = spr_playerN_boxxedfall;
    
    if (obj_player.y > y)
    {
        if (place_meeting(x, y + 1, obj_platform) && !scr_solid(x, y + 1))
            y += 1;
    }
}

if (grounded)
    sprite_index = spr_playerN_boxxedmove;

if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerN_boxxedjetpackfall)
    image_index = 1;
