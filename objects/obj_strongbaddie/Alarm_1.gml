switch (image_alpha)
{
    case 0.2:
        image_alpha = 1;
        break;
    
    case 1:
        image_alpha = 0.2;
        break;
}

immunityframes -= 1;

if (immunityframes > 0 || image_alpha == 0.2)
    alarm[1] = 2;
