alarm[0] = 500;
alarm[1] = 300;

if (obj_player.character == "P")
{
    if (!obj_endlevelfade.showtimer)
    {
        if (global.rank == "s" && !global.prank)
            sprite_index = spr_rankS;
        
        if (global.rank == "a")
            sprite_index = spr_rankA;
        
        if (global.rank == "b")
            sprite_index = spr_rankB;
        
        if (global.rank == "c")
            sprite_index = spr_rankC;
        
        if (global.rank == "d")
            sprite_index = spr_rankD;
        
        if (global.prank)
            sprite_index = spr_rankP;
    }
    else
    {
        sprite_index = spr_rankTIME;
    }
}
else if (obj_player.character == "N")
{
    if (!obj_endlevelfade.showtimer)
    {
        if (global.rank == "s" && !global.prank)
            sprite_index = spr_rankNS;
        
        if (global.rank == "a")
            sprite_index = spr_rankNA;
        
        if (global.rank == "b")
            sprite_index = spr_rankNB;
        
        if (global.rank == "c")
            sprite_index = spr_rankNC;
        
        if (global.rank == "d")
            sprite_index = spr_rankND;
        
        if (global.prank)
            sprite_index = spr_rankNP;
    }
    else
    {
        sprite_index = spr_rankNTIME;
    }
}

image_speed = 0.5;
