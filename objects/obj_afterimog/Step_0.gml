image_alpha -= drain;

if (image_alpha <= 0)
    instance_destroy();
