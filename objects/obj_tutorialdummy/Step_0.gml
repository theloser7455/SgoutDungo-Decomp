if (x != obj_player1.x)
    image_xscale = -sign(x - obj_player1.x);

if (visible)
{
    if (place_meeting(x, y, obj_player))
    {
        with (obj_player)
        {
            if (key_up2)
            {
                other.dialogue += 1;
                
                if (other.dialogue <= 10)
                    scr_soundeffect(other.talkingsound);
            }
        }
        
        with (obj_tv)
        {
            if (other.dialogue == 0)
                message = "";
            
            if (other.dialogue == 1)
                message = "THIS MOD HAS A BIT OF TECH";
            
            if (other.dialogue == 2)
                message = "HERE IS SOME TECH I'D LIKE TO TELL U ABT";
            
            if (other.dialogue == 3)
                message = "IF YOU GRAB WHILE MACH RUNNING";
            
            if (other.dialogue == 4)
                message = "AND THEN GO THE OPPOSITE DIRECTION";
            
            if (other.dialogue == 5)
                message = "WITHOUT LETTING GO OF THE MACH KEY";
            
            if (other.dialogue == 6)
                message = "YOU CAN INSTATURN!";
            
            if (other.dialogue == 7)
                message = "ALSO U CAN CANCEL OUT OF AN UPPERCUT";
            
            if (other.dialogue == 8)
                message = "WITH ANY MOVE WITH A FEW EXCEPTIONS";
            
            if (other.dialogue == 9)
                message = "BTW YOU CANNOT PARRY RED FLASHES";
            
            if (other.dialogue == 10)
                message = "GOODBYE";
            
            if (other.dialogue == 11)
                message = "";
            
            showtext = 1;
            alarm[0] = 2;
        }
    }
}
else
{
    dialogue = 0;
}
