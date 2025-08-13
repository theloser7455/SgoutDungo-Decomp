if (obj_player.character == "N")
    sprite_index = spr_beatboxN;

alarm[0] = 25;
vsp = -10;
hsp = 0;
grav = 0.5;

with (instance_create(x, y, obj_bangeffect))
    sprite_index = spr_genericpoofeffect;

thebeat = obj_player.thebeat;
pitch = 1;
scr_soundeffect(sfx_breakdancescratch);
scr_soundeffect(sfx_poof);
