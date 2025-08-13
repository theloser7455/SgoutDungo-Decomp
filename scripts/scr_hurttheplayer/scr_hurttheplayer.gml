function scr_hurttheplayer()
{
	if ((state == states.knightpep || state == states.knightpepattack || state == states.knightpepslopes) && cutscene == 0)
	{
	}
	else if (character == "TERRENCE")
	{
	}
	else if (state == states.phase2transition)
	{
	}
	else if (state == states.punch && other.object_index == obj_forkhitbox)
	{
	}
	else if (instance_exists(obj_fadeout))
	{
	}
	else if (state == states.bombpep && hurted == 0)
	{
	}
	else if (state == states.door)
	{
	}
	else if (state == states.boxxedpep)
	{
	}
	else if (state == states.tumble)
	{
	}
	else if (place_meeting(x, y, obj_parryhitbox) && other.parryable)
	{
	}
	else if (state == states.parryshit && sprite_index != spr_playerN_noisebombkick)
	{
	}
	else if (state == states.cheesepep || state == states.cheesepepstick)
	{
	}
	else if (state != states.hurt && hurted == 0 && cutscene == 0 && state != states.bump && !other.team)
	{
	    if (instance_exists(obj_bosscontrol))
	    {
	        obj_bosscontrol.playerhealth -= other.dmg;
	        global.hurttimes += 1;
	    }
	    
	    if (other.object_index == obj_forkhitbox)
	    {
	        with (other)
	        {
	            if (ID.object_index == obj_snickexe)
	            {
	                if (instance_exists(obj_snickexecrosshair))
	                    instance_destroy(obj_snickexecrosshair);
	            }
	        }
	    }
	    
	    if (instance_exists(obj_tv))
	    {
	        with (obj_tv)
	        {
	            shakethingv += 15;
	            
	            if (shakethingv >= 20)
	                shakethingv = 20;
	        }
	    }
	    
	    if (other.object_index == obj_forkhitbox)
	    {
	        with (other)
	        {
	            if (ID.object_index == obj_snickexe)
	            {
	                with (ID)
	                {
	                    with (instance_create(x, y, obj_bangeffect))
	                        sprite_index = spr_genericpoofeffect;
	                    
	                    scr_soundeffect(sfx_poof);
	                    x = room_width / 2;
	                    y = -100;
	                    mivspid = 0;
	                }
	            }
	        }
	    }
	    
	    with (other)
	    {
	        if (object_index == obj_littlenoisegremlin)
	        {
	            if (instance_exists(obj_tv))
	            {
	                obj_tv.message = name + " GAVE YOU AN ASS WHOOPING!";
	                obj_tv.showtext = 1;
	                obj_tv.alarm[0] = 150;
	            }
	        }
	    }
	    
	    if (character != "R")
	    {
	        scr_soundeffect(sfx_pephurt);
	    }
	    else
	    {
	        var hurtsound = choose(100, 101, 102, 103, 104);
	        scr_soundeffect(hurtsound);
	    }
	    
	    if ((character == "N" && paletteselect == 6) && !global.lamepalettes)
	        scr_soundeffect(sfx_bluu3);
	    
	    if (character == "P" && paletteselect == 17 && !global.lamepalettes)
	        scr_soundeffect(sfx_pursuerhurt);
	    
	    alarm[8] = 100;
	    alarm[7] = 120;
	    hurted = 1;
	    squished = 0;
	    
	    if (xscale == other.image_xscale)
	        sprite_index = spr_hurtjump;
	    else
	        sprite_index = spr_hurt;
	    
	    if (pepperplay)
	        sprite_index = spr_Phurt;
	    
	    instance_create(x, y, obj_bangeffect);
	    
	    repeat (7)
	    {
	        with (instance_create(x, y, obj_baddiegibs))
	        {
	            sprite_index = choose(spr_shroomcollect, spr_cheesecollect, spr_sausagecollect, spr_tomatocollect, spr_pineapplecollect);
	            image_speed = 0.5;
	            image_angle = 0;
	        }
	    }
	    
	    repeat (3)
	        instance_create(x, y, obj_slapstar);
	    
	    movespeed = 9;
	    vsp = -12;
	    timeuntilhpback = 300;
	    instance_create(x, y, obj_spikehurteffect);
	    state = states.hurt;
	    image_index = 0;
	    flash = 1;
	    global.hurtcounter += 1;
	    
	    if (global.collect > 50)
	        global.collect -= 50;
	    else
	        global.collect = 0;
	    
	    global.combotime -= 30;
	    
	    if (global.combotime < 0)
	        global.combotime = 0;
	    
	    with (instance_create(x + random_range(64, -64), y + random_range(64, -64), obj_negativenumber))
	        number = -50;
	}
}
