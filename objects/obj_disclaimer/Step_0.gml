if (fadein)
{
    image_alpha = Approach(image_alpha, 1, 0.125);
    
    if (image_alpha >= 0.8)
        fadein = 0;
}

if (fadeout)
{
    image_alpha = Approach(image_alpha, 0, 0.125);
    
    if (image_alpha <= 0.2)
        instance_destroy();
}

if (!fadein && !fadeout && keyboard_check_pressed(vk_anykey))
    fadeout = 1;
