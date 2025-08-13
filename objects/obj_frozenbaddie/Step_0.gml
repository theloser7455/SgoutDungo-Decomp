scr_collide();

if (thrown)
{
    hsp = thrownhsp;
    
    if (thrownvertically)
        vsp = thrownvsp;
    
    if (scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_slope))
        instance_destroy();
    
    if (scr_solid(x, y + sign(vsp), y) && thrownvertically)
        instance_destroy();
}
else
{
    hsp = Approach(hsp, 0, 0.01);
}

if (!thrown)
{
    with (instance_place(x, y, obj_player))
    {
        if (state == states.handstandjump || state == states.punch || instakillmove)
        {
            if (state == states.handstandjump || state == states.punch)
            {
                if (!key_attack)
                {
                    sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4);
                    image_index = 0;
                    state = states.tackle;
                    movespeed = 3;
                    vsp = -3;
                }
                else
                {
                    state = states.mach2;
                    sprite_index = choose(spr_machpunch1, spr_machpunch2);
                    image_index = 0;
                    
                    if (key_jump2)
                    {
                        sprite_index = spr_mach2jump;
                        mach2jumpguy = 1;
                        suplexmove = 0;
                        vsp = -11;
                    }
                }
            }
            
            other.thrownhsp = xscale * 25;
            
            if (movespeed > 13)
                other.thrownhsp = (xscale * 25) + ((movespeed - 12) * xscale);
            
            if (updash)
            {
                other.thrownhsp = movespeed * xscale;
                other.thrownvertically = 1;
                other.thrownvsp = -25;
            }
            
            repeat (8)
            {
                with (instance_create(x, y, obj_baddiegibs))
                {
                    sprite_index = spr_iceblockshards;
                    hsp = other.xscale * 25;
                    
                    if (other.movespeed > 13)
                        hsp = (other.xscale * 25) + ((other.movespeed - 12) * other.xscale);
                }
            }
            
            if (instance_exists(-2))
            {
                with (other)
                {
                    if (image_xscale == -1)
                        y -= 1;
                    
                    if (image_xscale == 1)
                        y -= 1;
                    
                    with (obj_camera)
                    {
                        shake_mag = 3;
                        shake_mag_acc = 3 / room_speed;
                    }
                    
                    global.hit += 1;
                    
                    if (other.object_index == obj_pizzaball)
                        global.golfhit += 1;
                    
                    global.combotime = 100;
                    thrown = 1;
                    vsp = -5;
                }
                
                scr_soundeffect(sfx_hitsound);
            }
        }
    }
}
