if (image_alpha > 0)
    image_alpha -= 0.03;

if (image_alpha <= 0)
    instance_destroy();

x = xstart + random_range(5, -5);
