if (place_meeting(x, y - 1, obj_player))
{
    with (obj_player)
    {
        if (place_meeting(x, y + 1, obj_ladder) && key_down && (state == states.crouch || state == states.wallbounce || ((character == "S" || character == "TERRENCE") && (state == 0 || state == states.mach1))) && place_meeting(x, y + 1, obj_platform))
        {
            y += 5;
            state = states.ladder;
            x = other.x + 16;
            y = floor(y);
            
            if ((y % 2) == 1)
                y -= 1;
        }
    }
}
