pause = 0;
i = 0;
color = make_color_rgb(121, 103, 151);
selected = 0;
image_speed = 0;
shroomdone = 0;
cheesedone = 0;
tomatodone = 0;
sausagedone = 0;
pineappledone = 0;
depth = -998;
draw_screen = 0;
x1 = 0;
y1 = 0;
alarm[0] = -1;

if (file_exists("BLAMEKIWUMA.zip"))
    alarm[0] = 500;
