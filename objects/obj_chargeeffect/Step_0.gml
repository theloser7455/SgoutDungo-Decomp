image_xscale = obj_player.xscale;
var forklin = 0;

with (obj_player)
{
    if (state == states.Nfork && movespeed >= 10)
        forklin = 1;
    
    if (state == states.jetpack && sprite_index != spr_playerN_noisebombspinjump)
        forklin = 1;
    
    if (state == states.machroll && movespeed >= 12)
        forklin = 1;
    
    if (state == states.crouchslide && movespeed >= 12)
        forklin = 1;
}

if (obj_player.state != states.mach3 && !forklin && (obj_player.state != states.breakdanceattack && obj_player.sprite_index != spr_player_buttattack && obj_player.sprite_index != spr_player_buttattackstart))
    instance_destroy();

if (obj_player.sprite_index == spr_player_buttattackend)
    instance_destroy();

x = obj_player.x;
y = obj_player.y;

if (obj_player.mask_index == spr_crouchmask)
    y = obj_player.y + 16;
