if (obj_player1.state != 50)
    instance_destroy();

var ultr = 0;

if (obj_player.paletteselect == 3 && obj_player.character == "P")
    ultr = 1;

with (instance_place(x, y, obj_hurtbox))
{
    if (!team)
    {
        if (object_index == obj_forkhitbox)
        {
            with (instance_create(ID.x, ID.y, obj_bangeffect))
                sprite_index = spr_parryeffect;
            
            with (instance_create(ID.x, ID.y, obj_bangeffect))
                sprite_index = spr_kungfueffect;
            
            if (ID.object_index != obj_snickexe && instance_exists(ID))
            {
                instance_destroy(ID);
                instance_destroy();
            }
            else
            {
                with (ID)
                {
                    with (instance_create(x, y, obj_sausageman_dead))
                        sprite_index = spr_snick_gyatter;
                    
                    x = room_width / 2;
                    y = -100;
                }
            }
        }
        
        if (object_index == obj_pizzard_bolt)
        {
            team = 1;
            speeed *= -1.5;
        }
        
        with (obj_player)
        {
            state = 1670;
            sprite_index = choose(spr_parry1, spr_parry2, spr_parry3);
            image_index = 0;
            
            if (!ultr)
            {
                scr_soundeffect(sfx_parry2);
            }
            else
            {
                scr_soundeffect(sfx_ultraparry);
                flash = 1;
            }
            
            if (x != other.x)
                xscale = -sign(x - other.x);
            
            hsp = -12 * xscale;
            
            with (instance_create(x + (16 * xscale), y, obj_bangeffect))
                sprite_index = spr_parryeffect;
            
            with (obj_baddie)
            {
                if (distance_to_object(other) <= 96)
                    instance_destroy();
            }
            
            with (obj_littlenoisegremlin)
            {
                if (distance_to_object(other) <= 96)
                {
                    if (x != other.x)
                        image_xscale = -sign(x - other.x);
                    
                    vsp = random_range(-15, -5);
                    hsp = -image_xscale * random_range(20, 10);
                }
            }
            
            with (obj_pizzacutter2)
            {
                if (distance_to_object(other) <= 96)
                {
                    image_xscale *= -1;
                    
                    with (instance_place(x, y, obj_pizzacutter1))
                        image_xscale = other.image_xscale;
                }
            }
        }
    }
}

with (instance_place(x, y, obj_strongbaddie))
{
    if (hurtandhitable || hurting)
    {
        with (obj_player)
        {
            state = 1670;
            sprite_index = choose(spr_parry1, spr_parry2, spr_parry3);
            image_index = 0;
            
            if (!ultr)
            {
                scr_soundeffect(sfx_parry2);
            }
            else
            {
                scr_soundeffect(sfx_ultraparry);
                flash = 1;
            }
            
            if (x != other.x)
                xscale = -sign(x - other.x);
            
            hsp = -12 * xscale;
            
            with (instance_create(x + (16 * xscale), y, obj_bangeffect))
                sprite_index = spr_parryeffect;
            
            with (obj_baddie)
            {
                if (distance_to_object(other) <= 96)
                    instance_destroy();
            }
            
            with (obj_littlenoisegremlin)
            {
                if (distance_to_object(other) <= 96)
                {
                    if (x != other.x)
                        image_xscale = -sign(x - other.x);
                    
                    vsp = random_range(-15, -5);
                    hsp = -image_xscale * random_range(20, 10);
                }
            }
            
            with (obj_pizzacutter2)
            {
                if (distance_to_object(other) <= 96)
                {
                    image_xscale *= -1;
                    
                    with (instance_place(x, y, obj_pizzacutter1))
                        image_xscale = other.image_xscale;
                }
            }
        }
    }
}

with (instance_place(x, y, obj_pepgoblin_kickhitbox))
{
    with (obj_player)
    {
        state = 1670;
        sprite_index = choose(spr_parry1, spr_parry2, spr_parry3);
        image_index = 0;
        
        if (!ultr)
        {
            scr_soundeffect(sfx_parry2);
        }
        else
        {
            scr_soundeffect(sfx_ultraparry);
            flash = 1;
        }
        
        if (x != other.x)
            xscale = -sign(x - other.x);
        
        hsp = -12 * xscale;
        
        with (instance_create(x + (16 * xscale), y, obj_bangeffect))
            sprite_index = spr_parryeffect;
        
        with (obj_baddie)
        {
            if (distance_to_object(other) <= 96)
                instance_destroy();
        }
        
        with (obj_littlenoisegremlin)
        {
            if (distance_to_object(other) <= 96)
            {
                if (x != other.x)
                    image_xscale = -sign(x - other.x);
                
                vsp = random_range(-15, -5);
                hsp = -image_xscale * random_range(20, 10);
            }
        }
        
        with (obj_pizzacutter2)
        {
            if (distance_to_object(other) <= 96)
            {
                image_xscale *= -1;
                
                with (instance_place(x, y, obj_pizzacutter1))
                    image_xscale = other.image_xscale;
            }
        }
    }
}
