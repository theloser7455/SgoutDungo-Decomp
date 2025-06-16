scr_sleep(50);
global.combotime = 60;

with (instance_create(x, y, obj_dissapearingeffect))
{
    sprite_index = other.sprite_index;
    image_speed = other.image_speed;
    image_index = other.image_index;
}
