scr_collide();

if (obj_player.state != 0 || (obj_player.sprite_index != obj_player.spr_breakdance && obj_player.state == 0))
    instance_destroy();

if (!audio_is_playing(thebeat))
    scr_sound(thebeat);

if (distance_to_object(obj_player) >= 200)
{
    audio_sound_gain(thebeat, (-distance_to_object(obj_player) + 300) / 100, 180);
}
else
{
    audio_sound_gain(thebeat, 1, 180);
    
    if (instance_exists(obj_music))
        audio_sound_gain(obj_music.pausedmusic * global.audiomusvol, 0.125, 180);
}

pitch = obj_player.image_speed * 2;
audio_sound_pitch(thebeat, pitch);
thebeat = obj_player.thebeat;

if (thebeat != 163 && audio_is_playing(mu_evilbluutunee) && obj_player.paletteselect != 6)
    audio_stop_sound(mu_evilbluutunee);

if (thebeat != 172 && audio_is_playing(mu_imtoolazytotypeallatitsthenoisebreakdancemusic) && obj_player.paletteselect == 6)
    audio_stop_sound(mu_imtoolazytotypeallatitsthenoisebreakdancemusic);
