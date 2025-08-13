if (x != obj_player1.x)
    image_xscale = sign(x - obj_player1.x);

if (place_meeting(x, y, obj_player))
{
    with (obj_player)
    {
        if (key_up2)
        {
            other.dialogue += 1;
            
            if (other.dialogue == 6)
            {
                with (instance_create(x, y, obj_bossdefeatflash))
                {
                    blamesomoneveryspecific = 1;
                    fadeout = 0.001;
                    scr_soundeffect(sfx_flashbang);
                }
            }
            
            if (other.dialogue <= 5)
                scr_soundeffect(other.talkingsound);
        }
    }
    
    with (obj_tv)
    {
        if (other.dialogue == 0)
            message = "";
        
        if (other.dialogue == 1)
            message = "HI";
        
        if (other.dialogue == 2)
            message = "IM MARIA'S SELF INSERT";
        
        if (other.dialogue == 3)
            message = "DO YOU SEE HER VISION?";
        
        if (other.dialogue == 4)
            message = "IF NOT";
        
        if (other.dialogue == 5)
            message = "BLAME KIWUMA";
        
        if (other.dialogue == 6)
            message = "";
        
        showtext = 1;
        alarm[0] = 2;
    }
}
else
{
    dialogue = 0;
}
