function scr_boss_stun()
{
	image_speed = 0.35;
	
	if (grounded)
	    hsp = Approach(hsp, 0, 0.5);
	
	if (sprite_index == spr_pepperman_groundpoundland)
	    image_index = 0;
	
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_pepperman_shoulderhurtstart)
	    sprite_index = spr_pepperman_shoulderhurt;
	
	if (sprite_index != spr_pepperman_shoulderhurt && sprite_index != spr_pepperman_shoulderhurtstart && sprite_index != spr_pepperman_groundpoundland)
	    sprite_index = spr_stunned;
	
	stunned--;
	
	if (object_index == obj_pepperman_boss)
	{
	    if (ball && stunned <= 120 && sprite_index == spr_pepperman_groundpoundland)
	    {
	        state = states.gottreasure;
	        vsp = -15;
	        
	        if (x != obj_player.x)
	            image_xscale = -sign(x - obj_player.x);
	        
	        sprite_index = spr_pepperman_rolling;
	        scr_soundeffect(sfx_pepperman_jump);
	    }
	}
	
	if (stunned <= 0)
	    state = states.normal;
	
	if (scr_solid(x + hsp, y))
	    hsp *= -1;
}
