function scr_bossphasechange()
{
	instance_create(x, y, obj_bossdefeatflash);
	
	if (room == boss_room1)
	{
	    var bg1 = layer_get_id("Compatibility_Background_0");
	    var bg2 = layer_get_id("Compatibility_Background_1_bg_bossroom");
	    var bg12 = layer_get_id("Compatibility_Background_02");
	    var bg22 = layer_get_id("Compatibility_Background_1_bg_bossroom2");
	    layer_background_visible(bg22, true);
	    layer_background_visible(bg12, true);
	    layer_background_visible(bg1, false);
	    layer_background_visible(bg2, false);
	}
	
	if (audio_is_playing(mu_peppermanboss) && obj_music.pausedmusic == 174)
	    audio_sound_set_track_position(obj_music.pausedmusic, 70);
}
