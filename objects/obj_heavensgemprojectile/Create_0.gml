image_blend = make_colour_rgb(0, 219, 255);
vsp = 0;
hsp = 0;
grav = 0.25;
grounded = 0;
next = 2;
image_xscale = 1 + (0.25 * next);

if (next <= 0)
    image_xscale = 0.75;

image_yscale = image_xscale;
