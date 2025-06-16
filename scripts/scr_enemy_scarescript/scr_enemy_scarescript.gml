function scr_enemy_scarescript()
{
	if (obj_player.x > (x - 400) && obj_player.x < (x + 400) && y <= (obj_player.y + 60) && y >= (obj_player.y - 60))
	{
	    if (state != 92 && !thrown && (obj_player1.state == 89 || obj_player1.state == 602 || (obj_player1.state == 308 && obj_player1.sprite_index != spr_playerN_noisebombspinjump) || (obj_player1.state == 9459 && obj_player1.movespeed >= 11)))
	    {
	        state = 92;
	        sprite_index = scaredspr;
	        scaredbuffer = 100;
	        
	        if (x != obj_player.x)
	            image_xscale = -sign(x - obj_player.x);
	        
	        vsp = -5;
	        
	        if (object_index == obj_ancho)
	            vsp = -1.25;
	    }
	}
}
