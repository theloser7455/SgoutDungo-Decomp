function scr_collide()
{
	grounded = 0;
	var windx = 0;
	var windy = 0;
	
	with (instance_place(x, y, obj_wind))
	{
	    windx = xforce;
	    windy = yforce;
	}
	
	if (!scr_solid(x, y + windy))
	    y += windy;
	
	if (!scr_solid(x + windx, y))
	    x += windx;
	
	repeat (abs(vsp))
	{
	    if (!scr_solid(x, y + sign(vsp)))
	    {
	        y += sign(vsp);
	    }
	    else
	    {
	        vsp = 0;
	        break;
	    }
	}
	
	repeat (abs(hsp))
	{
	    if (scr_solid(x + sign(hsp), y) && !scr_solid(x + sign(hsp), y - 1))
	        y--;
	    
	    if (!scr_solid(x + sign(hsp), y) && !scr_solid(x + sign(hsp), y + 1) && scr_solid(x + sign(hsp), y + 2))
	        y++;
	    
	    if (!scr_solid(x + sign(hsp), y))
	    {
	        x += sign(hsp);
	    }
	    else
	    {
	        hsp = 0;
	        break;
	    }
	}
	
	var delit = 1;
	
	if (place_meeting(x, y, obj_water))
	    delit += 1;
	
	if (global.lowgrav)
	    delit += 1.5;
	
	if (vsp < 20)
	    vsp += (grav / delit);
	
	if (grav >= 0)
	{
	    grounded |= scr_solid(x, y + 1);
	    grounded |= (!place_meeting(x, y, obj_platform) && place_meeting(x, y + 1, obj_platform));
	}
	
	if (grav < 0)
	{
	    grounded |= scr_solid(x, y - 1);
	    grounded |= (!place_meeting(x, y, obj_flippedplatform) && place_meeting(x, y - 1, obj_flippedplatform));
	}
}
