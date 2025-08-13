x = obj_player.x;
y = obj_player.y;
image_speed = 0.35;
image_alpha = 0;
move = 0;
stun = 0;
speedies = 0;
speedies2 = 0;
accuracy = random_range(0.25, 0.16666666666666666);
alarm[0] = 150;
falling = 0;
hsp = 0;
vsp = 0;
grav = 0.8;
hit = 0;
grounded = 0;
immunityframes = 3;
alarm[2] = 5;
shart = 1;
spid = 0;
howmuchtimesdidyoukickmyass = 0;
depth = obj_player.depth + 1;

if ((place_meeting(x, y, obj_doorblocked) && !global.snickchallenge) || object_index == obj_VERYFUCKINGSTRONGPIZZAFACE)
{
    sprite_index = spr_pizzaface_intro2;
    
    if (audio_is_playing(sfx_pizzafacelaugh))
        audio_stop_sound(sfx_pizzafacelaugh);
    
    if (!audio_is_playing(sfx_pizzafacelaugh))
        scr_soundeffect(sfx_pizzafacelaugh);
}
