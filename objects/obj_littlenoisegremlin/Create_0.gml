grounded = 1;
image_speed = 0.5;
hsp = 0;
vsp = 0;
grav = 0.5;
var a = "image_blend= choose(c_white, c_black, c_red, c_orange, c_yellow, c_green, c_blue, c_purple)";
personality = global.gremlinpersonality;
name = "LIL GREMLIN";

if (personality == 1)
{
    image_blend = make_colour_rgb(random_range(0, 225), random_range(0, 225), random_range(0, 225));
    name = choose("SKIBIDIWAPAPA", "MATPAT24", "SIGMA55", "ZALUPA", "NOISEY ANDREY", "YOUFUCKINGSUCK93", "ANTON", "1MATISSUCK1", "SGOUTDUNGO4EVER", "EDWIN", "THEFUCKINGMIMIC", "THEONEWHOKNOWS", "MRRAH", "KIWUMABUTEVIL", "BUMBLEBEE", "MRPENIS");
}

if (personality == 2)
{
    image_blend = c_blue;
    name = "LOBOTOZELLE 2";
}
