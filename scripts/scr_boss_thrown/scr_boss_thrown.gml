function scr_boss_thrown()
{
	image_speed = 0.35;
	attackin = 50;
	hsp = xscale * 12;
	sprite_index = spr_thrown;
	
	if (grounded && vsp > 0)
	{
	    state = states.normal;
	    immunityframes = 20;
	    hp -= 1;
	    
	    if (notboss)
	        hp -= 100000000;
	    
	    if (object_index == obj_greaterman)
	    {
	        repeat (phase + 1)
	            instance_create(x, y, choose(obj_pepperman_weak, obj_pepperman_weak2));
	    }
	    
	    alarm[1] = 5;
	    instance_create(x, y, obj_bangeffect);
	    
	    repeat (4)
	        instance_create(x, y, obj_baddiegibs);
	    
	    if ((hp <= 0 && object_index == obj_bestbossever) && phase != phases)
	    {
	        attack = "none";
	        attackin = 50;
	        y = ystart;
	    }
	}
	
	if (scr_solid(x + sign(hsp), y))
	    xscale *= -1;
}
