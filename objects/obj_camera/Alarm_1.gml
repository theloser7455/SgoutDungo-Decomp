var nuhuh = 0;

if (global.deathmode && obj_player1.sprite_index == obj_player1.spr_gottreasure)
    nuhuh = 1;

if (!nuhuh)
{
    if (global.panic == 1 || global.snickchallenge == 1 || global.draintime == 1)
    {
        global.seconds -= 1;
        
        if (global.collect >= 5)
            global.collect -= 5;
        
        if (global.seconds < 0)
        {
            global.seconds = 59;
            global.minutes -= 1;
        }
        
        if (global.snickchallenge)
        {
            var thing = room_width;
            
            if (room_width < room_height)
                thing = room_height;
            
            if (instance_number(obj_glitchparticleemitter) < round(thing / 80))
            {
                repeat (2)
                    instance_create(random_range(0, room_width), random_range(0, room_height), obj_glitchparticleemitter);
            }
        }
        
        minut = random_range(10, 0);
        secund = random_range(0, 70);
    }
}

alarm[1] = 60;
