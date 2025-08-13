if (obj_player.character == "S")
    instance_destroy();

if (abs(image_xscale) == 1)
{
    if (x != obj_player1.x)
        image_xscale = -sign(x - obj_player1.x);
    
    if (place_meeting(x, y, obj_player))
    {
        with (obj_player)
        {
            if (key_up2)
            {
                if (other.dialogue <= 7)
                    other.dialogue += 1;
                
                if (other.dialogue <= 7)
                    scr_soundeffect(other.talkingsound);
            }
        }
        
        with (obj_tv)
        {
            if (other.dialogue == 0)
                message = "";
            
            if (other.dialogue == 1)
                message = "YOU MIGHT WANNA CHECK OUT THE TUTORIAL";
            
            if (other.dialogue == 2)
                message = "IT HAS A LIL GUY AT THE END";
            
            if (other.dialogue == 3)
                message = "HE'S GONNA TEACH U STUFF";
            
            if (other.dialogue == 4)
                message = "AFTER THAT BEAT MY 3 LEVELS";
            
            if (other.dialogue == 5)
                message = "GRR";
            
            if (other.dialogue == 6)
                message = "WHAT ARE YOU WAITING FOR";
            
            if (other.dialogue == 7)
                message = "GO DO IT!!!!!";
            
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
}
else if (place_meeting(x, y, obj_player))
{
    with (obj_player)
    {
        if (key_up2)
        {
            other.dialogue = 1000;
            
            if (audio_is_playing(sfx_snickcry))
                audio_stop_sound(sfx_snickcry);
            
            scr_soundeffect(sfx_snickcry);
            audio_sound_pitch(sfx_snickcry, 1 / (abs(other.image_xscale) - 1));
        }
    }
    
    if (dialogue == 1000)
    {
        with (obj_tv)
        {
            message = "👀👨‍🦲";
            showtext = 1;
            alarm[0] = 2;
        }
    }
}
else
{
    dialogue = 0;
}
