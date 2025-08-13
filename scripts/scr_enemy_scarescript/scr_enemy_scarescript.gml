function scr_enemy_scarescript()
{
	if (obj_player.x > (x - 400) && obj_player.x < (x + 400) && y <= (obj_player.y + 60) && y >= (obj_player.y - 60))
	{
	    if (state != states.snickmachstart && !thrown && (obj_player1.state == states.mach3 || obj_player1.state == states.playerpeppermanmach || (obj_player1.state == states.jetpack && obj_player1.sprite_index != spr_playerN_noisebombspinjump) || (obj_player1.state == states.Nfork && obj_player1.movespeed >= 11)))
	    {
	        state = states.snickmachstart;
	        sprite_index = scaredspr;
	        scaredbuffer = 100;
	        
	        if (x != obj_player.x)
	            image_xscale = -sign(x - obj_player.x);
	        
	        if (grounded)
	            vsp = -5;
	        
	        if (object_index == obj_ancho)
	            vsp = -1.25;
	    }
	}
}
