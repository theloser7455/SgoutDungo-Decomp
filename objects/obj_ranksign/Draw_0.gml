if (global.difficulty == 1 && object_index != obj_ranksignboss)
{
    draw_sprite_ext(spr_medalpizza, 0, x - 32, y - 32, image_xscale, image_yscale, image_angle, c_white, 1);
    draw_sprite_ext(spr_medalpizza_icons, global.pizzafacechasestyle, x - 32, y - 32, image_xscale, image_yscale, image_angle, c_white, 1);
}

draw_self();
