scr_collide();

if (obj_player.state != states.normal || (obj_player.sprite_index != obj_player.spr_breakdance && obj_player.state == states.normal))
    instance_destroy();

if (!audio_is_playing(thebeat))
{
    audio_play_sound(thebeat, 11, true);
    audio_sound_gain(thebeat, global.audiomusbreakdancevol, 0.1);
}

if (distance_to_object(obj_player) >= 200)
    audio_sound_gain(thebeat, (((-distance_to_object(obj_player) + 300) / 100) * global.audiomusbreakdancevol) - obj_player1.thebeatvol, 180);
else
    audio_sound_gain(thebeat, global.audiomusbreakdancevol - obj_player1.thebeatvol, 180);

pitch = obj_player.image_speed * 2;
audio_sound_pitch(thebeat, pitch);
thebeat = obj_player.thebeat;

switch (obj_player.character)
{
    case "N":
        if (thebeat != 173 && audio_is_playing(mu_vanityboombox) && obj_player.paletteselect != 9 && global.butchermus == 1)
            audio_stop_sound(mu_vanityboombox);
        
        if (thebeat != 173 && audio_is_playing(mu_vanityboomboxthesecond) && obj_player.paletteselect != 9 && global.butchermus == 0)
            audio_stop_sound(mu_vanityboomboxthesecond);
        
        if (thebeat != 163 && audio_is_playing(mu_evilbluutunee) && obj_player.paletteselect != 7)
            audio_stop_sound(mu_evilbluutunee);
        
        if (thebeat != 216 && audio_is_playing(mu_sigmatic) && obj_player.paletteselect != 10)
            audio_stop_sound(mu_sigmatic);
        
        if (thebeat != 172 && audio_is_playing(mu_imtoolazytotypeallatitsthenoisebreakdancemusic) && (obj_player.paletteselect == 7 || obj_player.paletteselect == 9 || obj_player.paletteselect == 10))
            audio_stop_sound(mu_imtoolazytotypeallatitsthenoisebreakdancemusic);
        
        break;
    
    default:
        if (thebeat != 244 && audio_is_playing(mu_veggieboombox) && obj_player.paletteselect != 15)
            audio_stop_sound(mu_veggieboombox);
        
        if (thebeat != 171 && audio_is_playing(mu_breakdancemusicc) && obj_player.paletteselect == 15)
            audio_stop_sound(mu_breakdancemusicc);
        
        break;
}
