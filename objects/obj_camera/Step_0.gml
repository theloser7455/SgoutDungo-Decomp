if (room == rank_room || room == timesuproom || room == Realtitlescreen)
    visible = false;
else
    visible = true;

if (global.combo >= 10)
{
    global.SAGEcombo10 = 1;
    ini_open("SGOUTsaveData.ini");
    ini_write_string("SAGE2019", "combo10", 1);
    ini_close();
}

if (room == timesuproom)
    timestop = 1;

if (global.seconds <= 0 && global.minutes <= 0 && ded == 0 && obj_player.character != "TERRENCE")
{
    alarm[1] = -1;
    alarm[2] = 3;
    audio_stop_all();
    ded = 1;
}

if (global.seconds < 0)
{
    global.seconds = 59;
    global.minutes -= 1;
}

if (global.seconds > 59)
{
    global.minutes += 1;
    global.seconds -= 59;
}

if ((global.minutes == 0 && global.seconds == 0 && !global.snickchallenge && !global.deathmode) && !instance_exists(obj_gameoverrestart))
{
    if (!instance_exists(obj_VERYFUCKINGSTRONGPIZZAFACE))
        instance_create(obj_player.x, obj_player.y, obj_VERYFUCKINGSTRONGPIZZAFACE);
}

if ((global.panic == 1 && global.minutes < 1) || obj_player1.sprite_index == spr_player_timesup)
{
    shake_mag = 2;
    shake_mag_acc = 3 / room_speed;
}
else if (global.panic == 1 && basement == 0)
{
    shake_mag = 2;
    shake_mag_acc = 3 / room_speed;
}

if (shake_mag > 0)
{
    shake_mag -= shake_mag_acc;
    
    if (shake_mag < 0)
        shake_mag = 0;
}

if (global.combo <= 0)
    combox = Approach(combox, 1200, 10);
else
    combox = Approach(combox, 960, 10);

zoom = clamp(zoom, 0, 960);
var mmmmm = 1;

if (room != Realtitlescreen && room != rm_contentunlocked)
    mmmmm = global.globalzoom;

if (zooming)
    zoomF = Approach(zoomF, zoomto, 0.1);
else
    zoomF = Approach(zoomF, mmmmm, 0.1);

if (instance_exists(obj_player1) && obj_player1.state != states.timesup && obj_player1.state != states.gameover)
{
    var target = obj_player1;
    
    if (obj_player1.state == states.mach3 || obj_player1.state == states.machroll)
    {
        if (chargecamera > (obj_player1.xscale * 100))
            chargecamera -= 2;
        
        if (chargecamera < (obj_player1.xscale * 100))
            chargecamera += 2;
        
        __view_set(0, 0, (target.x - (__view_get(2, 0) / 2)) + chargecamera);
    }
    else
    {
        if (chargecamera > 0)
            chargecamera -= 2;
        
        if (chargecamera < 0)
            chargecamera += 2;
        
        __view_set(0, 0, (target.x - (__view_get(2, 0) / 2)) + chargecamera);
    }
    
    __view_set(0, 0, clamp(__view_get(0, 0), 0, room_width - __view_get(2, 0)));
    __view_set(1, 0, target.y - 23 - (__view_get(3, 0) / 2));
    __view_set(1, 0, clamp(__view_get(1, 0), 0, room_height - __view_get(3, 0)));
    
    if (shake_mag != 0)
    {
        __view_set(0, 0, (target.x - (__view_get(2, 0) / 2)) + chargecamera);
        __view_set(0, 0, clamp(__view_get(0, 0), 0, room_width - __view_get(2, 0)));
        __view_set(1, 0, (target.y - 23 - (__view_get(3, 0) / 2)) + irandom_range(-shake_mag, shake_mag));
        __view_set(1, 0, clamp(__view_get(1, 0), 0 + irandom_range(-shake_mag, shake_mag), (room_height - __view_get(3, 0)) + irandom_range(-shake_mag, shake_mag)));
    }
    
    if (global.pizdec)
    {
        tilt++;
        camera_set_view_angle(view_camera[0], tilt);
        camera_set_view_size(view_camera[0], wave(960, 540, 0.4, 0.4, -4), wave(540, 960, 0.4, 0.4, -4));
    }
    else
    {
        var aaaaaa = "\n        camera_set_view_angle(view_camera[0], 0)\n        camera_set_view_size(view_camera[0], 960, 540)";
        var _viewX = camera_get_view_x(view_camera[0]);
        var _viewY = camera_get_view_y(view_camera[0]);
        var _viewW = camera_get_view_width(view_camera[0]);
        var _viewH = camera_get_view_height(view_camera[0]);
        var _factor = 0.2;
        mouseW = 0;
        zoomF = clamp(zoomF + (mouseW * _factor), _factor, 2);
        lerpH = lerp(_viewH, zoomF * 540, _factor);
        var thingg = 540 * round(room_width / 960);
        
        if (thingg > room_height)
            thingg = room_height;
        
        var _newH = clamp(lerpH, 0, thingg);
        var _newW = _newH * 1.7777777777777777;
        camera_set_view_size(view_camera[0], _newW, _newH);
        camera_set_view_angle(view_camera[0], 0);
    }
}
