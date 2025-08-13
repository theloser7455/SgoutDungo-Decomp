if (state != "mine")
    scr_collide();

switch (state)
{
    case "chase":
        speed = 0;
        
        if (x != obj_player1.x)
            image_xscale = -sign(x - obj_player1.x);
        
        hsp = Approach(hsp, image_xscale * 8, 0.1);
        var fly = 0;
        
        if (obj_player.y < y)
            fly = 1;
        
        if (obj_player.y >= y && scr_solid(x + image_xscale, y) && x < (obj_player.x - 48) && x > (obj_player.x + 48))
            fly = 1;
        
        timer = 0;
        
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
        }
        
        if (grounded)
            sprite_index = spr_playerN_boxxedmove;
        
        if (obj_player.y > y)
        {
            if (place_meeting(x, y + 2, obj_platform) && !scr_solid(x, y + 2))
                y += 2;
        }
        
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerN_boxxedjetpackfall)
            image_index = 1;
        
        if (timer > 20)
        {
            if (vsp <= 0 && scr_solid(x, y - 6) && obj_player.y > y)
            {
                state = "mine";
                direction = point_direction(x, y, obj_player.x, obj_player.y);
                speed = 6;
            }
            
            if (vsp > 0 && scr_solid(x, y + 6) && obj_player.y < y)
            {
                state = "mine";
                direction = point_direction(x, y, obj_player.x, obj_player.y);
                speed = 6;
            }
            
            if (hsp <= 0 && scr_solid(x - 6, y) && obj_player.x > x && image_xscale == -sign(x - obj_player1.x))
            {
                state = "mine";
                direction = point_direction(x, y, obj_player.x, obj_player.y);
                speed = 6;
            }
            
            if (hsp >= 0 && scr_solid(x + 6, y) && obj_player.x < x && image_xscale == -sign(x - obj_player1.x))
            {
                state = "mine";
                direction = point_direction(x, y, obj_player.x, obj_player.y);
                speed = 6;
            }
        }
        
        break;
    
    case "mine":
        if (x != obj_player1.x)
            image_xscale = -sign(x - obj_player1.x);
        
        sprite_index = spr_playerN_boxxedmove;
        direction = point_direction(x, y, obj_player.x, obj_player.y);
        speed = 6;
        timer--;
        
        if (scr_solid(x, y))
            timer = 5;
        
        if (!scr_solid(x, y) && timer <= 0)
            state = "chase";
        
        break;
}
