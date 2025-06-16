function scr_enemystatuseffects()
{
	previousstatus = status;
	
	switch (status)
	{
	    case "burning":
	        statuscolor = make_colour_rgb(255, 135, 0);
	        statusspeed = 3;
	        
	        with (instance_place(x, y, obj_baddie))
	            status = "burning";
	        
	        if (place_meeting(x, y, obj_water))
	            status = "";
	        
	        break;
	    
	    case "freezing":
	        statuscolor = make_colour_rgb(0, 219, 255);
	        statusspeed = -1;
	        break;
	    
	    case "welp shi":
	        statuscolor = make_colour_rgb(146, 102, 204);
	        statusspeed = 12;
	        break;
	    
	    case "EVIL welp shi":
	        statuscolor = make_colour_rgb(204, 102, 146);
	        statusspeed = -12;
	        break;
	    
	    case "whatever":
	        statuscolor = make_colour_rgb(random_range(0, 255), random_range(0, 255), random_range(0, 255));
	        statusspeed = random_range(-22, 22);
	        break;
	    
	    default:
	        statuscolor = make_color_rgb(255, 255, 255);
	        statusspeed = 0;
	        break;
	}
	
	if (movespeed == 0 && statusspeed != 0)
	    statusspeed = 0;
	
	if (status == "" && previousstatus == "burning")
	{
	    repeat (8)
	    {
	        with (instance_create(x, y + 32, obj_machalleffect))
	        {
	            speed = 12 + random_range(5, -5);
	            direction = 90 + random_range(-10, 10);
	        }
	    }
	    
	    scr_soundeffect(sfx_stompenemy);
	}
	
	if (status == "freezing" && previousstatus == "")
	{
	    repeat (8)
	    {
	        with (instance_create(x, y + 32, obj_machalleffect))
	        {
	            speed = 0 + random_range(5, 1);
	            direction = random_range(0, 360);
	            image_xscale = random_range(1, 3.5);
	            image_yscale = image_xscale;
	        }
	    }
	    
	    scr_soundeffect(sfx_stompenemy);
	}
	
	if (statusparticle > 0)
	    statusparticle -= 1;
	
	if (statusparticle <= 0)
	{
	    switch (status)
	    {
	        case "welp shi":
	            with (instance_create(x, y, obj_baddiegibs))
	                sprite_index = spr_grape;
	            
	            statusparticle = 2;
	            break;
	        
	        case "burning":
	            repeat (4)
	            {
	                with (instance_create(x + random_range(image_xscale * 32, image_xscale * -32), (y - 16) + random_range(image_yscale * 32, image_yscale * -32), obj_machalleffect))
	                    sprite_index = spr_flamecloud;
	            }
	            
	            statusparticle = 10;
	            break;
	        
	        default:
	            break;
	    }
	}
	
	image_blend = statuscolor;
}
