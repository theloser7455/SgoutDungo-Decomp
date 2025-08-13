if (alpha < 1)
{
    if (!global.instantR)
        alpha += fadein;
    else
        alpha = Approach(alpha, 1, 0.05);
}
else
{
    if (!pizzalaugh)
    {
        pizzalaugh = 1;
        sprite_index = spr_pizzaface_intro2;
        scr_soundeffect(sfx_pizzafacelaugh);
        
        if (global.instantR)
            instance_create(x, y, obj_bossdefeatflash);
    }
    
    if (obj_player.key_jump2 && !global.instantR)
        scr_exitlevelscript();
    
    if (obj_player.key_slap2 || global.instantR)
    {
        if (global.playingsnickchallenge)
            global.snickchallenge = 1;
        
        scr_levelrestartscript();
    }
}

if (floor(image_index) == 20)
    sprite_index = spr_pizzaface;
