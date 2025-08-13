if (global.prank && obj_player1.character == "N")
    draw_sprite_ext(spr_rankNPbg, -1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

pal_swap_set(obj_player.spr_palette, obj_player.paletteselect, 0);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
var font = font_add_sprite_ext(global.fontspritee, global.fontcharacterss, 1, 0);
draw_set_font(font);

if (obj_endlevelfade.showtimer && image_index == (image_number - 1))
{
    var a = "";
    
    if (global.seconds <= 9)
        a = "0";
    
    draw_text_ext_transformed(x + 269, y + 70, string_hash_to_newline(string(global.minutes) + ":" + a + string(global.seconds)), 16, 960, 2, 2, 0);
}

shader_reset();
