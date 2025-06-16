if (obj_player.key_up2)
{
    chosen += 1;
    scr_soundeffect(sfx_step);
}

if (obj_player.key_down2)
{
    chosen -= 1;
    scr_soundeffect(sfx_step);
}

if (chosen > 1)
    chosen = 0;

if (chosen < 0)
    chosen = 1;

if (chosen == 1)
    cursory = Approach(cursory, obj_player.y - 100, 25);

if (chosen == 0)
    cursory = Approach(cursory, obj_player.y + 100, 25);

if (obj_player.key_jump)
    instance_destroy();
