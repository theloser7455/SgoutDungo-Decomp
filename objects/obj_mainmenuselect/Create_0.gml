optionselected = 0;
selected = 0;
textx = 0;
textxx = 0;
textxxx = 0;
m1 = 0;
m2 = 0;
m = 0;
brickid = id;
brickid1 = id;
brickid2 = id;

with (instance_create(-4, 398, obj_solid))
{
    image_xscale = 10;
    image_yscale = 9;
    other.brickid = id;
}

with (instance_create(400, 448, obj_solid))
{
    image_xscale = 5;
    image_yscale = 5;
    other.brickid1 = id;
}

instance_create(448, 384, obj_metalblock);

with (instance_create(658, 398, obj_solid))
{
    image_xscale = 10;
    image_yscale = 7;
    other.brickid2 = id;
}
