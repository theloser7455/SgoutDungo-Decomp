function scr_enemy_grabbed()
{
	var oo = 0;
	
	if (mask_index == spr_pepperman_mask)
	    oo = 21;
	
	image_xscale = -obj_player1.xscale;
	stunned = 200;
	obj_player1.baddiegrabbedID = id;
	
	if (obj_player1.state == states.grabbing || obj_player1.state == states.grab || obj_player1.state == states.throwin || obj_player1.state == states.slam || obj_player1.state == states.tacklecharge)
	{
	    x = obj_player1.x;
	    
	    if (obj_player.sprite_index != spr_playerN_grab)
	    {
	        if (obj_player1.sprite_index != spr_player_haulingstart && obj_player1.sprite_index != spr_playerN_haulingstart)
	        {
	            y = obj_player1.y - 50 - oo;
	        }
	        else
	        {
	            if (floor(obj_player1.image_index) == 0)
	                y = obj_player1.y - oo;
	            
	            if (floor(obj_player1.image_index) == 1)
	                y = obj_player1.y - 20 - oo;
	            
	            if (floor(obj_player1.image_index) == 2)
	                y = obj_player1.y - 40 - oo;
	            
	            if (floor(obj_player1.image_index) == 3)
	                y = obj_player1.y - 45 - oo;
	        }
	    }
	    else
	    {
	        y = obj_player1.y - oo;
	    }
	    
	    image_xscale = -obj_player1.xscale;
	}
	
	with (obj_player1)
	{
	    suplexhavetomash = other.hp - 1;
	    scr_getinput();
	    move = key_left2 + key_right2;
	    
	    if (key_slap && sprite_index == spr_grab)
	    {
	        global.hit += 1;
	        
	        if (other.object_index == obj_pizzaball)
	            global.golfhit += 1;
	        
	        global.combotime = 100;
	        image_index = 0;
	        sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4);
	        other.hp -= 1;
	        instance_create(other.x, other.y, obj_slapstar);
	        instance_create(other.x, other.y, obj_baddiegibs);
	        other.flash = 1;
	        
	        with (obj_camera)
	        {
	            shake_mag = 3;
	            shake_mag_acc = 3 / room_speed;
	        }
	    }
	    
	    if (!(state == states.grab || state == states.finishingblow || state == states.grabbing || state == states.throwin || state == states.slam || state == states.tacklecharge || state == states.punch || state == states.superslam || state == states.backkick || state == states.uppunch || state == states.shoulder))
	    {
	        other.x = x;
	        other.y = y - oo;
	        other.state = states.enemystun;
	        other.image_index = 0;
	    }
	}
	
	hsp = 0;
	
	if (obj_player1.state == states.punch)
	{
	    alarm[3] = 3;
	    global.hit += 1;
	    
	    if (other.object_index == obj_pizzaball)
	        global.golfhit += 1;
	    
	    hp -= 1;
	    instance_create(x + (obj_player1.xscale * 30), y, obj_bumpeffect);
	    alarm[1] = 5;
	    thrown = 1;
	    x = obj_player1.x;
	    vsp = 0;
	    y = obj_player1.y - oo;
	    state = states.enemystun;
	    hsp = -image_xscale * 25;
	    grav = 0;
	    global.combotime = 100;
	    instance_create(x, y, obj_slapstar);
	    instance_create(x, y, obj_baddiegibs);
	    flash = 1;
	    
	    with (obj_camera)
	    {
	        shake_mag = 3;
	        shake_mag_acc = 3 / room_speed;
	    }
	}
	
	if (obj_player1.state == states.finishingblow && obj_player1.image_index < 5)
	{
	    x = obj_player1.x + (obj_player1.xscale * 60);
	    
	    while (scr_solid(x + obj_player1.xscale, y))
	        x -= obj_player1.xscale;
	    
	    y = obj_player1.y - oo;
	}
	
	if (obj_player1.state == states.backkick)
	{
	    alarm[3] = 3;
	    global.hit += 1;
	    
	    if (other.object_index == obj_pizzaball)
	        global.golfhit += 1;
	    
	    hp -= 1;
	    instance_create(x + (-obj_player1.xscale * 50), y, obj_bumpeffect);
	    alarm[1] = 5;
	    thrown = 1;
	    x = obj_player1.x;
	    y = obj_player1.y - oo;
	    state = states.enemystun;
	    image_xscale *= -1;
	    hsp = -image_xscale * 20;
	    vsp = -7;
	    global.combotime = 100;
	    instance_create(x, y, obj_slapstar);
	    instance_create(x, y, obj_baddiegibs);
	    flash = 1;
	    
	    with (obj_camera)
	    {
	        shake_mag = 3;
	        shake_mag_acc = 3 / room_speed;
	    }
	}
	
	if (obj_player1.state == states.shoulder)
	{
	    alarm[3] = 3;
	    global.hit += 1;
	    
	    if (other.object_index == obj_pizzaball)
	        global.golfhit += 1;
	    
	    hp -= 1;
	    instance_create(x, y + 20, obj_bumpeffect);
	    alarm[1] = 5;
	    thrown = 1;
	    x = obj_player1.x;
	    y = obj_player1.y - oo;
	    state = states.enemystun;
	    
	    if (obj_player1.sprite_index == spr_player_shoulder)
	        vsp = 15;
	    
	    if (obj_player1.sprite_index == spr_player_diagonaldownthrow)
	    {
	        hsp = -image_xscale * 10;
	        vsp = 15;
	    }
	    
	    if (obj_player1.sprite_index == spr_player_diagonalupthrow)
	    {
	        hsp = -image_xscale * 10;
	        vsp = -15;
	    }
	    
	    global.combotime = 100;
	    instance_create(x, y, obj_slapstar);
	    instance_create(x, y, obj_baddiegibs);
	    flash = 1;
	    
	    with (obj_camera)
	    {
	        shake_mag = 3;
	        shake_mag_acc = 3 / room_speed;
	    }
	}
	
	if (place_meeting(x, y, obj_swordhitbox))
	{
	    if (piledriven)
	    {
	        global.SAGEoverkill = 1;
	        ini_open("SGOUTsaveData.ini");
	        ini_write_string("SAGE2025", "overkill", 1);
	        ini_close();
	    }
	    
	    with (instance_create(x, y, obj_bangeffect))
	        sprite_index = spr_parryeffect;
	    
	    with (instance_create(x, y, obj_bangeffect))
	        sprite_index = spr_kungfueffect;
	    
	    hp -= 1;
	    instance_create(x, y, obj_slapstar);
	    instance_create(x, y, obj_slapstar);
	    instance_create(x, y, obj_slapstar);
	    instance_create(x, y, obj_baddiegibs);
	    instance_create(x, y, obj_baddiegibs);
	    instance_create(x, y, obj_baddiegibs);
	    
	    with (obj_camera)
	    {
	        shake_mag = 3;
	        shake_mag_acc = 3 / room_speed;
	    }
	    
	    alarm[3] = 3;
	    global.hit += 1;
	    
	    if (other.object_index == obj_pizzaball)
	        global.golfhit += 1;
	    
	    global.combotime = 100;
	    alarm[1] = 5;
	    thrown = 1;
	    state = states.enemystun;
	    
	    with (obj_player)
	    {
	        move = key_right + key_left;
	        
	        if (sprite_index == spr_finishingblowup)
	        {
	            other.throwhsp = 0;
	            other.throwvsp = -25;
	            other.upthrow = 1;
	        }
	        else
	        {
	            other.throwhsp = -other.image_xscale * 25;
	            other.vsp = -6;
	            other.upthrow = 0;
	        }
	    }
	    
	    if (piledriven)
	        global.SAGEoverkill = 1;
	}
	
	if (obj_player1.state == states.throwin)
	{
	    global.hit += 1;
	    
	    if (other.object_index == obj_pizzaball)
	        global.golfhit += 1;
	    
	    alarm[1] = 5;
	    thrown = 1;
	    x = obj_player1.x;
	    y = obj_player1.y - oo;
	    state = states.enemystun;
	    hsp = -image_xscale * 8;
	    vsp = -6;
	}
	
	if (obj_player1.state == states.uppunch)
	{
	    alarm[3] = 3;
	    global.hit += 1;
	    
	    if (other.object_index == obj_pizzaball)
	        global.golfhit += 1;
	    
	    hp -= 1;
	    instance_create(x + (-obj_player1.xscale * 15), y - 50, obj_bumpeffect);
	    alarm[1] = 5;
	    thrown = 1;
	    x = obj_player1.x;
	    y = obj_player1.y - oo;
	    hsp = -image_xscale * 2;
	    state = states.enemystun;
	    vsp = -20;
	    global.combotime = 100;
	    instance_create(x, y, obj_slapstar);
	    instance_create(x, y, obj_baddiegibs);
	    flash = 1;
	    
	    with (obj_camera)
	    {
	        shake_mag = 3;
	        shake_mag_acc = 3 / room_speed;
	    }
	}
	
	if (obj_player1.state == states.tacklecharge)
	{
	    x = obj_player1.x + (obj_player1.xscale * 15);
	    y = obj_player1.y - oo;
	}
	
	if (obj_player1.state == states.superslam && obj_player1.character != "P" && obj_player1.sprite_index != obj_player1.spr_piledriverland)
	{
	    x = obj_player.x;
	    y = obj_player1.y - 50 - oo;
	}
	
	if ((obj_player1.state == states.superslam && obj_player1.sprite_index == spr_player_piledriver) || (obj_player1.state == states.grab && obj_player1.sprite_index == spr_player_swingding))
	{
	    if (obj_player1.character == "P")
	    {
	        if (floor(obj_player1.image_index) == 0)
	        {
	            depth = 0;
	            x = obj_player1.x + (obj_player1.xscale * 10);
	            y = obj_player1.y - oo;
	        }
	        
	        if (floor(obj_player1.image_index) == 1)
	        {
	            depth = 0;
	            x = obj_player1.x + (obj_player1.xscale * 5);
	            y = obj_player1.y - oo;
	        }
	        
	        if (floor(obj_player1.image_index) == 2)
	        {
	            depth = 0;
	            x = obj_player1.x;
	            y = obj_player1.y - oo;
	        }
	        
	        if (floor(obj_player1.image_index) == 3)
	        {
	            depth = 0;
	            x = obj_player1.x + (obj_player1.xscale * -5);
	            y = obj_player1.y - oo;
	        }
	        
	        if (floor(obj_player1.image_index) == 4)
	        {
	            depth = 0;
	            x = obj_player1.x + (obj_player1.xscale * -10);
	            y = obj_player1.y - oo;
	        }
	        
	        if (floor(obj_player1.image_index) == 5)
	        {
	            depth = -8;
	            x = obj_player1.x + (obj_player1.xscale * -5);
	            y = obj_player1.y - oo;
	        }
	        
	        if (floor(obj_player1.image_index) == 6)
	        {
	            depth = -8;
	            x = obj_player1.x;
	            y = obj_player1.y - oo;
	        }
	        
	        if (floor(obj_player1.image_index) == 7)
	        {
	            depth = -8;
	            x = obj_player1.x + (obj_player1.xscale * 5);
	            y = obj_player1.y - oo;
	        }
	    }
	    else
	    {
	        depth = -7;
	        x = obj_player.x;
	        y = obj_player.y - 40 - oo;
	    }
	}
	
	if (obj_player1.sprite_index == obj_player1.spr_piledriverland && floor(obj_player1.image_index) == (obj_player1.image_number - 1))
	{
	    with (obj_player)
	    {
	        state = states.jump;
	        vsp = -8;
	        sprite_index = spr_machfreefall;
	    }
	    
	    instance_create(x, y, obj_slapstar);
	    instance_create(x, y, obj_baddiegibs);
	    flash = 1;
	    global.combotime = 100;
	    global.hit += 1;
	    hp -= 5;
	    alarm[1] = 5;
	    thrown = 1;
	    x = obj_player1.x;
	    y = obj_player1.y - oo;
	    state = states.enemystun;
	    throwhsp = -image_xscale * 10;
	    vsp = -10;
	    piledriven = 1;
	}
	
	if (obj_player1.state == states.grab && obj_player1.sprite_index == spr_player_swingding)
	{
	    if (obj_player1.character == "P")
	    {
	        if (floor(obj_player1.image_index) == 0)
	        {
	            depth = -8;
	            x = obj_player1.x + (obj_player1.xscale * 25);
	            y = obj_player1.y - oo;
	        }
	        
	        if (floor(obj_player1.image_index) == 1)
	        {
	            depth = -8;
	            x = obj_player1.x;
	            y = obj_player1.y - oo;
	        }
	        
	        if (floor(obj_player1.image_index) == 2)
	        {
	            depth = -8;
	            x = obj_player1.x + (obj_player1.xscale * -25);
	            y = obj_player1.y - oo;
	        }
	        
	        if (floor(obj_player1.image_index) == 3)
	        {
	            depth = 0;
	            x = obj_player1.x + (obj_player1.xscale * -50);
	            y = obj_player1.y - oo;
	        }
	        
	        if (floor(obj_player1.image_index) == 4)
	        {
	            depth = 0;
	            x = obj_player1.x + (obj_player1.xscale * -25);
	            y = obj_player1.y - oo;
	        }
	        
	        if (floor(obj_player1.image_index) == 5)
	        {
	            depth = 0;
	            x = obj_player1.x;
	            y = obj_player1.y - oo;
	        }
	        
	        if (floor(obj_player1.image_index) == 6)
	        {
	            depth = 0;
	            x = obj_player1.x + (obj_player1.xscale * 25);
	            y = obj_player1.y - oo;
	        }
	        
	        if (floor(obj_player1.image_index) == 7)
	        {
	            depth = 0;
	            x = obj_player1.x + (obj_player1.xscale * 50);
	            y = obj_player1.y - oo;
	        }
	    }
	    else
	    {
	        depth = -7;
	        x = obj_player.x;
	        y = obj_player.y - 40 - oo;
	    }
	}
	
	sprite_index = grabbedspr;
	image_speed = 0.35;
}
