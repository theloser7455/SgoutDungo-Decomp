x = room_width / 2;
y = -10;
hitboxcreate = 0;
var lay_id = layer_background_get_id("Backgrounds_1");
var back_id = layer_background_get_id(lay_id);

if (layer_background_get_sprite(back_id) != 1212)
    layer_background_sprite(back_id, 1212);

hitboxcreate = 0;
image_speed = 0;
depth = -5;
attackcooldown = 100;
attack = "idk";
attacking = 0;
getbacktoworkin = 0;
shake = 0;
dashamounts = 3;
evilcharge = 0;
beamshot = 0;
previousattack = "beam";
