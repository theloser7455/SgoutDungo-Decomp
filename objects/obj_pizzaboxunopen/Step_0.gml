var evilvariable3 = 0;

with (instance_place(x, y, obj_baddie))
    evilvariable3 = thrown;

if ((place_meeting(x, y, obj_player) && sprite_index == spr_pizzaboxunopen) || evilvariable3)
{
    scr_soundeffect(sfx_collecttoppin);
    global.uniquecollects += 1;
    
    if (instance_exists(obj_tv))
    {
        with (obj_tv)
        {
            shakething += 10;
            
            if (shakething >= 20)
                shakething = 20;
        }
    }
    
    if (content == obj_noisebomb)
    {
        with (obj_player)
        {
            state = states.backbreaker;
            sprite_index = spr_player_bossintro;
            image_index = 0;
        }
        
        with (instance_create(x, y - 25, content))
            sprite_index = spr_noisebomb_intro;
        
        instance_create(x, y, obj_taunteffect);
        instance_create(x, y + 600, obj_itspizzatime);
        global.panic = 1;
        
        switch (room)
        {
            case floor1_room11:
                global.minutes = 2;
                global.seconds = 30;
                break;
            
            case floor2_roomtreasure:
                global.minutes = 2;
                global.seconds = 40;
                break;
            
            case floor3_roomtreasure:
                global.minutes = 2;
                global.seconds = 30;
                break;
            
            case floor4_roomtreasure:
                global.minutes = 2;
                global.seconds = 0;
                break;
            
            case floor5_roomtreasure:
                global.minutes = 2;
                global.seconds = 0;
                break;
        }
        
        global.wave = 0;
        global.maxwave = ((global.minutes * 60) + global.seconds) * 60;
        
        if (global.panicbg)
            scr_panicbg_init();
    }
    
    if (content == obj_pizzakinshroom)
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "1000";
        
        global.collect += 1000;
        global.combotime = 100;
        instance_create(x, y, obj_taunteffect);
        
        with (instance_create(x, y - 25, content))
            sprite_index = spr_toppinshroom_intro;
        
        if (global.toppintotal < 5)
            obj_tv.message = "YOU NEED " + string(5 - global.toppintotal) + " MORE TOPPINS!";
        
        if (global.toppintotal == 5)
            obj_tv.message = "YOU HAVE ALL TOPPINS!";
        
        obj_tv.showtext = 1;
        obj_tv.alarm[0] = 150;
        global.toppintotal += 1;
        global.shroomfollow = 1;
    }
    
    if (content == obj_pizzakincheese)
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "1000";
        
        global.collect += 1000;
        global.combotime = 100;
        
        with (instance_create(x, y - 25, content))
            sprite_index = spr_toppincheese_intro;
        
        instance_create(x, y, obj_taunteffect);
        
        if (global.toppintotal < 5)
            obj_tv.message = "YOU NEED " + string(5 - global.toppintotal) + " MORE TOPPINS!";
        
        if (global.toppintotal == 5)
            obj_tv.message = "YOU HAVE ALL TOPPINS!";
        
        obj_tv.showtext = 1;
        obj_tv.alarm[0] = 150;
        global.toppintotal += 1;
        global.cheesefollow = 1;
    }
    
    if (content == obj_pizzakintomato)
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "1000";
        
        global.collect += 1000;
        global.combotime = 100;
        
        with (instance_create(x, y - 25, content))
            sprite_index = spr_toppintomato_intro;
        
        instance_create(x, y, obj_taunteffect);
        
        if (global.toppintotal < 5)
            obj_tv.message = "YOU NEED " + string(5 - global.toppintotal) + " MORE TOPPINS!";
        
        if (global.toppintotal == 5)
            obj_tv.message = "YOU HAVE ALL TOPPINS!";
        
        obj_tv.showtext = 1;
        obj_tv.alarm[0] = 150;
        global.toppintotal += 1;
        global.tomatofollow = 1;
    }
    
    if (content == obj_pizzakinsausage)
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "1000";
        
        global.collect += 1000;
        global.combotime = 100;
        
        with (instance_create(x, y - 25, content))
            sprite_index = spr_toppinsausage_intro;
        
        instance_create(x, y, obj_taunteffect);
        
        if (global.toppintotal < 5)
            obj_tv.message = "YOU NEED " + string(5 - global.toppintotal) + " MORE TOPPINS!";
        
        if (global.toppintotal == 5)
            obj_tv.message = "YOU HAVE ALL TOPPINS!";
        
        obj_tv.showtext = 1;
        obj_tv.alarm[0] = 150;
        global.toppintotal += 1;
        global.sausagefollow = 1;
    }
    
    if (content == obj_pizzakinpineapple)
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "1000";
        
        global.collect += 1000;
        global.combotime = 100;
        
        with (instance_create(x, y - 25, content))
            sprite_index = spr_toppinpineapple_intro;
        
        instance_create(x, y, obj_taunteffect);
        global.combotime = 100;
        global.style += 50;
        ds_list_add(global.saveroom, id);
        
        if (global.toppintotal < 5)
            obj_tv.message = "YOU NEED " + string(5 - global.toppintotal) + " MORE TOPPINS!";
        
        if (global.toppintotal == 5)
            obj_tv.message = "YOU HAVE ALL TOPPINS!";
        
        obj_tv.showtext = 1;
        obj_tv.alarm[0] = 150;
        global.toppintotal += 1;
        global.pineapplefollow = 1;
    }
    
    sprite_index = spr_cagedebris;
    
    for (var i = 0; i < (image_number - 1); i++)
    {
        with (instance_create(x, y, obj_baddiegibs))
        {
            sprite_index = other.sprite_index;
            image_index = i;
        }
    }
    
    if (evilvariable3)
    {
        with (instance_create(x, y, obj_explosioneffect))
            sprite_index = spr_bombexplosion;
        
        scr_soundeffect(sfx_explosion);
    }
    
    instance_destroy();
}

if (floor(image_index) == 26 && helpme == 0)
{
    with (instance_create(x, y - 64, obj_bangeffect))
    {
        sprite_index = spr_toppinhelp;
        image_speed = other.image_speed;
    }
    
    helpme = 1;
}

if (floor(image_index) != 26 && helpme == 1)
    helpme = 0;
