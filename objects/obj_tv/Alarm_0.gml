showtext = 0;
tvsprite = spr_tvdefault;
image_speed = 0.1;
imageindexstore = 0;

if (message == "YOU UNLOCKED IDIOT" || message == "YOU ARE AN IDIOT!!!")
{
    repeat (3)
        show_message("you are an idiot");
    
    game_end();
}
