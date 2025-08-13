pal_swap_set(spr_palette, paletteselect, 0);
var font = font_add_sprite_ext(spr_smallerfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.:?1234567890", 1, 0);
draw_set_font(font);
draw_set_halign(fa_right);
draw_set_color(c_white);

if (instance_exists(obj_strongbaddie))
{
    phaseeeeeeee = obj_strongbaddie.phase + 1;
    
    if (obj_strongbaddie.object_index == obj_pepperman_boss_butwith50phases)
        draw_text_colour(960, 163, "CURRENT PHASE: " + string(phaseeeeeeee), c_white, c_white, c_white, c_white, 1);
}

for (var i = 0; i < bossmaxhp; i++)
{
    var healthy = 88;
    var thingx = 0;
    
    if ((bossmaxhp / 2) <= i)
    {
        healthy += 25;
        thingx = (32 * bossmaxhp) / 2;
    }
    
    draw_sprite_ext(hpicon, -1, 872 + (i * -32) + thingx, healthy, 1, 1, idiotrot, c_black, 1);
}

for (var i = 0; i < bosshp; i++)
{
    var healthy = 88;
    var thingx = 0;
    
    if ((bossmaxhp / 2) <= i)
    {
        healthy += 25;
        thingx = (32 * bossmaxhp) / 2;
    }
    
    draw_sprite_ext(hpicon, -1, 872 + (i * -32) + thingx, healthy, 1, 1, idiotrot, c_white, 1);
}

pal_swap_set(obj_player.spr_palette, obj_player.paletteselect, 0);

for (var i = 0; i < playerhealthmax; i++)
{
    var healthy = 88;
    var thingx = 0;
    
    if ((playerhealthmax / 2) <= i)
    {
        healthy += 25;
        thingx = (-32 * playerhealthmax) / 2;
    }
    
    draw_sprite_ext(obj_player.hpicon, playerhealthframe, 88 + (i * 32) + thingx, healthy, 1, 1, 0, c_black, 1);
}

for (var i = 0; i < playerhealth; i++)
{
    var healthy = 88;
    var thingx = 0;
    
    if ((playerhealthmax / 2) <= i)
    {
        healthy += 25;
        thingx = (-32 * playerhealthmax) / 2;
    }
    
    draw_sprite_ext(obj_player.hpicon, playerhealthframe, 88 + (i * 32) + thingx, healthy, 1, 1, 0, c_white, 1);
}

shader_reset();
