image_speed = 0;
image_index = obj_player.image_index;
image_xscale = obj_player.xscale;
sprite_index = obj_player.sprite_index;
randomize();
image_blend = choose(make_color_rgb(255, 0, 0), make_color_rgb(0, 255, 0));
alarm[1] = 3;

if (global.supertaunt == 2)
{
    sprite_index = choose(spr_supertaunteffect1, spr_supertaunteffect2, spr_supertaunteffect3, spr_supertaunteffect4, spr_supertaunteffect5);
    image_blend = c_white;
}
