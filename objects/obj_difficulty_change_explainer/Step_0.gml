if (x != obj_player1.x)
    image_xscale = -sign(x - obj_player1.x);

if (global.difficulty == 0)
{
    if (visible)
        instance_create(x, y, obj_bombexplosion);
    
    visible = false;
}
else
{
    if (!visible)
        instance_create(x, y, obj_bombexplosion);
    
    visible = true;
}

if (visible)
{
    if (place_meeting(x, y, obj_player))
    {
        with (obj_player)
        {
            if (key_up2)
            {
                other.dialogue += 1;
                
                if (other.dialogue <= 6)
                    scr_soundeffect(other.talkingsound);
            }
        }
        
        with (obj_tv)
        {
            if (other.dialogue == 0)
                message = "";
            
            if (other.dialogue == 1)
                message = "TO GET A HIGH RANK ON ELITE MODE";
            
            if (other.dialogue == 2)
                message = "COLLECT UNIQUE COLLECTS, LIKE";
            
            if (other.dialogue == 3)
                message = "SECRETS, TOPPINS AND THE TREASURE";
            
            if (other.dialogue == 4)
                message = "YOU NEED 9 OF THEM FOR A P RANK";
            
            if (other.dialogue == 5)
                message = "AVOID PIZZAFACE AS MUCH AS YOU CAN";
            
            if (other.dialogue == 6)
                message = "YOU CAN PARRY HIM WHICH HELPS A LOT";
            
            if (other.dialogue == 7)
                message = "";
            
            showtext = 1;
            alarm[0] = 2;
        }
    }
    else
    {
        dialogue = 0;
    }
}
else
{
    dialogue = 0;
}
