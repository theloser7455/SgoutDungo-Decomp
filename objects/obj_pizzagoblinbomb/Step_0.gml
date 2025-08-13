if (timergooff)
    countdown -= 0.5;

if (place_meeting(x + 1, y, obj_bombblock) || place_meeting(x - 1, y, obj_bombblock) || place_meeting(x, y - 1, obj_bombblock) || place_meeting(x, y + 1, obj_bombblock))
{
    instance_create(x, y, obj_hurtbombexplosion);
    instance_destroy();
}

if (scr_solid(x + 1, y) || scr_solid(x - 1, y))
    drop = 1;

if (scr_solid(x, y + 1))
    hsp = Approach(hsp, 0, 1);

if (vsp < 12)
    vsp += grav;

if (countdown < 50)
    sprite_index = spr_bomblit;

if (countdown == 0)
    instance_create(x, y, obj_hurtbombexplosion);

scr_collide();

with (instance_place(x, y, obj_baddie))
{
    if (other.deflected && other.hsp != 0)
    {
        with (instance_create(x, y, obj_explosioneffect))
            sprite_index = spr_bombexplosion;
        
        scr_soundeffect(sfx_explosion);
        instance_destroy();
    }
}

if (place_meeting(x, y, obj_hallway))
    instance_destroy();
