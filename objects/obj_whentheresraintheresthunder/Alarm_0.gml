var nb = id;
var a = supermaliciouscount - 1;

if (instance_exists(obj_baddie))
{
    with (obj_baddie)
    {
        if (distance_to_point(other.x, other.y) <= 500)
        {
            with (instance_create(x, y, obj_whentheresraintheresthunder))
            {
                supermaliciouscount = a;
                nb = id;
            }
            
            scr_soundeffect(sfx_zap);
            instance_destroy();
        }
    }
}

sigmaid = nb;
