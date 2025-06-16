x = obj_player.x + wave(-64 * positionshit, 64 * positionshit, 2, 1);
y = obj_player.y + wave(-32 * positionshit, 32 * positionshit, 6, 1);

if (!instance_exists(obj_baddie))
{
    if (x != obj_player.x)
        image_xscale = -sign(x - obj_player.x);
}

if (instance_exists(obj_baddie))
{
    if (x != instance_nearest(x, y, obj_baddie).x)
        image_xscale = -sign(x - instance_nearest(x, y, obj_baddie).x);
    
    shootcooldown--;
    
    if (shootcooldown <= 0)
    {
        with (instance_create(x, y, obj_shotgunbullet))
        {
            spd = 0;
            direction = point_direction(x, y, instance_nearest(x, y, obj_baddie).x, instance_nearest(x, y, obj_baddie).y);
            image_angle = direction;
            speed = 12;
            image_xscale = 1;
            phasing = 1;
        }
        
        scr_soundeffect(sfx_machpunch);
        shootcooldown = random_range(20, 30);
    }
}

fuel--;

if (fuel <= 0)
    instance_destroy();
