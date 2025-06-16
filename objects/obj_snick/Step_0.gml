if (obj_player.character == "S")
    instance_destroy();

if (x != obj_player1.x)
    image_xscale = -sign(x - obj_player1.x);

if (place_meeting(x, y, obj_player))
{
    with (obj_player)
    {
        if (key_up2)
            other.dialogue += 1;
    }
    
    with (obj_tv)
    {
        if (other.dialogue == 0)
            message = "";
        
        if (other.dialogue == 1)
            message = "KILL ME";
        
        if (other.dialogue == 2)
            message = "MY LIFE IS MISERABLE";
        
        if (other.dialogue == 3)
            message = "I DONT WANNA LIVE ANYMORE";
        
        if (other.dialogue == 4)
            message = "IM HATE MY LIFE AND I WANNA DIE";
        
        if (other.dialogue == 5)
            message = "IVE BEEN STUCK HERE FOR YEARS";
        
        if (other.dialogue == 6)
            message = "PLEASE";
        
        if (other.dialogue == 7)
            message = "MASSACARE ME";
        
        if (other.dialogue == 8)
            message = "";
        
        showtext = 1;
        alarm[0] = 2;
    }
}
else
{
    dialogue = 0;
}
