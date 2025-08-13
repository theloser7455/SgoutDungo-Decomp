attackin = random_range(50, 100);
turns = 0;
hp = 2;
maxhp = 2;
attack = "S";
ball = 0;
phase2transitionsound = sfx_pepperman_scared;
phases = 0;
notboss = 1;
spr_palette = spr_pepperman_palette;
paletteselect = 0;
var a = choose(0, 100);

if (a == 100)
    paletteselect = 2;

if (object_index == obj_pepperman_weak2)
    attack = "GP";
