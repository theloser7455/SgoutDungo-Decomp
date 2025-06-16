fadealpha -= fadeout;

if (fadealpha <= 0)
    instance_destroy();
