scr_initinput();
optionselected = 0;
optionsaved_fullscreen = global.option_fullscreen;
optionsaved_resolution = global.option_resolution;
depth = -99;
x1 = 0;
y1 = 0;

if (instance_exists(obj_pause))
{
    x1 = obj_pause.x1;
    y1 = obj_pause.y1;
}
