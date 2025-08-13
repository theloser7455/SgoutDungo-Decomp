fadein = 0.01;
alpha = -0.7;
depth = obj_player.depth + 0.00001;
font = font_add_sprite_ext(global.fontspritee, global.fontcharacterss, 1, 0);
pizzalaugh = 0;
spr = spr_pizzaface;
image_speed = 0.3;
image_alpha = 0;

if (!global.instantR)
{
    audio_stop_all();
    scr_soundeffect(mu_timesup);
}
