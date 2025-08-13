draw_self();
draw_sprite_ext(spr_difficultychangerpart2, 0, x - 1, y + 10, image_xscale, image_yscale, rottt, image_blend, image_alpha);

if (global.difficulty == 0)
    draw_sprite_ext(spr_easy, -1, x - 32, y - 64, 1, 1, 0, c_white, 1);

if (global.difficulty == 1)
    draw_sprite_ext(spr_hard, -1, x + 32, y - 64, 1, 1, 0, c_white, 1);

if (global.difficulty == 2)
    draw_sprite_ext(spr_playerN_boxxedidle, -1, x, y + 100, 1, 1, 0, c_white, 1);
