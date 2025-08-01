scr_getinput();

if (selecting == -1)
{
    if (key_up2 && key_select > -1)
    {
        key_select -= 1;
        scr_soundeffect(sfx_step);
    }
    
    if (key_down2 && key_select < 9)
    {
        key_select += 1;
        scr_soundeffect(sfx_step);
    }
    
    if (-key_left2)
        key_select = -1;
}

if (key_jump2 && selecting == -1 && key_select == -1)
{
    scr_soundeffect(sfx_enemyprojectile);
    ini_open("saveData.ini");
    ini_write_string("ControlsKeys", "up", global.key_up);
    ini_write_string("ControlsKeys", "right", global.key_right);
    ini_write_string("ControlsKeys", "left", global.key_left);
    ini_write_string("ControlsKeys", "down", global.key_down);
    ini_write_string("ControlsKeys", "jump", global.key_jump);
    ini_write_string("ControlsKeys", "slap", global.key_slap);
    ini_write_string("ControlsKeys", "attack", global.key_attack);
    ini_write_string("ControlsKeys", "taunt", global.key_taunt);
    ini_write_string("ControlsKeys", "start", global.key_start);
    ini_write_string("ControlsKeys", "punch", global.key_punch);
    ini_close();
    instance_destroy();
}

if (selecting == 0)
{
    if (keyboard_check_pressed(vk_anykey))
    {
        global.key_up = keyboard_key;
        selecting = -1;
    }
}

if (key_select == 0 && key_jump && selecting == -1)
{
    selecting = key_select;
    global.key_up = -1;
}

if (selecting == 1)
{
    if (keyboard_check_pressed(vk_anykey))
    {
        global.key_down = keyboard_key;
        selecting = -1;
    }
}

if (key_select == 1 && key_jump && selecting == -1)
{
    selecting = key_select;
    global.key_down = -1;
}

if (selecting == 2)
{
    if (keyboard_check_pressed(vk_anykey))
    {
        global.key_right = keyboard_key;
        selecting = -1;
    }
}

if (key_select == 2 && key_jump && selecting == -1)
{
    selecting = key_select;
    global.key_right = -1;
}

if (selecting == 3)
{
    if (keyboard_check_pressed(vk_anykey))
    {
        global.key_left = keyboard_key;
        selecting = -1;
    }
}

if (key_select == 3 && key_jump && selecting == -1)
{
    selecting = key_select;
    global.key_left = -1;
}

if (selecting == 4)
{
    if (keyboard_check_pressed(vk_anykey))
    {
        global.key_jump = keyboard_key;
        selecting = -1;
    }
}

if (key_select == 4 && key_jump && selecting == -1)
{
    selecting = key_select;
    global.key_jump = -1;
}

if (selecting == 5)
{
    if (keyboard_check_pressed(vk_anykey))
    {
        global.key_slap = keyboard_key;
        selecting = -1;
    }
}

if (key_select == 5 && key_jump && selecting == -1)
{
    selecting = key_select;
    global.key_slap = -1;
}

if (selecting == 6)
{
    if (keyboard_check_pressed(vk_anykey))
    {
        global.key_attack = keyboard_key;
        selecting = -1;
    }
}

if (key_select == 6 && key_jump && selecting == -1)
{
    selecting = key_select;
    global.key_attack = -1;
}

if (selecting == 7)
{
    if (keyboard_check_pressed(vk_anykey))
    {
        global.key_taunt = keyboard_key;
        selecting = -1;
    }
}

if (key_select == 7 && key_jump && selecting == -1)
{
    selecting = key_select;
    global.key_taunt = -1;
}

if (selecting == 8)
{
    if (keyboard_check_pressed(vk_anykey))
    {
        global.key_start = keyboard_key;
        selecting = -1;
    }
}

if (key_select == 8 && key_jump && selecting == -1)
{
    selecting = key_select;
    global.key_start = -1;
}

if (selecting == 9)
{
    if (keyboard_check_pressed(vk_anykey))
    {
        global.key_punch = keyboard_key;
        selecting = -1;
    }
}

if (key_select == 9 && key_jump && selecting == -1)
{
    selecting = key_select;
    global.key_punch = -1;
}
