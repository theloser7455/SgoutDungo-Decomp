var cheat_code = keyboard_string;

switch (cheat_code)
{
    case "rat":
        instance_create(x + 500, y - 500, obj_evilahhrat);
        break;
    
    case "ice":
        if (instance_exists(obj_baddie))
        {
            with (obj_baddie)
            {
                corpse = 0;
                
                with (instance_create(x, y, obj_frozenbaddie))
                {
                    sprite_index = other.sprite_index;
                    image_index = other.image_index;
                    mask_index = other.mask_index;
                }
                
                instance_destroy();
            }
        }
        
        break;
    
    case "red":
        instance_create(x, y, object374);
        break;
    
    case "terrence":
        character = "TERRENCE";
        state = 0;
        break;
    
    case "freeze":
        if (instance_exists(obj_baddie))
        {
            with (obj_baddie)
                status = "freezing";
        }
        
        break;
    
    case "back":
        if (instance_exists(obj_baddie))
        {
            with (obj_baddie)
                status = "";
        }
        
        break;
    
    case "welp":
        if (instance_exists(obj_baddie))
        {
            with (obj_baddie)
                status = "welp shi";
        }
        
        break;
    
    case "fire":
        if (instance_exists(obj_baddie))
        {
            with (obj_baddie)
                status = "burning";
        }
        
        break;
    
    case "evilwelp":
        if (instance_exists(obj_baddie))
        {
            with (obj_baddie)
                status = "EVIL welp shi";
        }
        
        break;
    
    case "whatever":
        if (instance_exists(obj_baddie))
        {
            with (obj_baddie)
                status = "whatever";
        }
        
        break;
    
    case "zap":
        instance_create(x, y, obj_whentheresraintheresthunder);
        break;
}

keyboard_string = "";
