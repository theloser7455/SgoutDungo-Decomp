if (room == rank_room || room == timesuproom || room == boss_room1 || room == Realtitlescreen)
    alpha = 0;

if (room == entrance_1)
{
    global.srank = 5750;
    global.arank = global.srank - (global.srank / 4);
    global.brank = global.srank - ((global.srank / 4) * 2);
    global.crank = global.srank - ((global.srank / 4) * 3);
}

if (room == medieval_1 && global.snickchallenge == 0)
{
    global.srank = 11000;
    global.arank = global.srank - (global.srank / 4);
    global.brank = global.srank - ((global.srank / 4) * 2);
    global.crank = global.srank - ((global.srank / 4) * 3);
}

if (room == medieval_1 && global.snickchallenge == 1)
{
    global.srank = 8300;
    global.arank = global.srank - (global.srank / 4);
    global.brank = global.srank - ((global.srank / 4) * 2);
    global.crank = global.srank - ((global.srank / 4) * 3);
}

if (room == ruin_1 && global.snickchallenge == 0)
{
    global.srank = 11600;
    global.arank = global.srank - (global.srank / 4);
    global.brank = global.srank - ((global.srank / 4) * 2);
    global.crank = global.srank - ((global.srank / 4) * 3);
}

if (room == dungeon_1 && global.snickchallenge == 0)
{
    global.srank = 10400;
    global.arank = global.srank - (global.srank / 4);
    global.brank = global.srank - ((global.srank / 4) * 2);
    global.crank = global.srank - ((global.srank / 4) * 3);
}

if (showtext == 1)
{
    xi = 500;
    yi = Approach(yi, 475, 10);
}

if (showtext == 0)
{
    xi = 500;
    yi = Approach(yi, 690, 10);
}

if (!(obj_player.state == 23 && obj_player.state == 24 && obj_player.state == 17))
    once = 0;

if (obj_player.y < 200 && obj_player.x > (room_width - 200))
    alpha = 0.5;
else if (!(room == rank_room || room == timesuproom || room == boss_room1 || room == Realtitlescreen))
    alpha = 1;

if (instance_exists(obj_itspizzatime))
{
    image_speed = 0.25;
    message = "GET TO THE EXIT!!";
    alarm[0] = 200;
    showtext = 1;
    tvsprite = spr_tvexit;
}
else if (global.collect > global.arank && shownranka == 0 && obj_player.character == "")
{
    image_speed = 0;
    message = "YOU GOT ENOUGH FOR RANK A";
    showtext = 1;
    alarm[0] = 200;
    tvsprite = spr_tvranka;
    shownranka = 1;
}
else if (global.collect > global.brank && shownrankb == 0 && obj_player.character == "")
{
    image_speed = 0;
    message = "YOU GOT ENOUGH FOR RANK B";
    showtext = 1;
    alarm[0] = 200;
    tvsprite = spr_tvrankb;
    shownrankb = 1;
}
else if (global.collect > global.crank && shownrankc == 0 && obj_player.character == "")
{
    image_speed = 0;
    message = "YOU GOT ENOUGH FOR RANK C";
    showtext = 1;
    alarm[0] = 200;
    tvsprite = spr_tvrankc;
    shownrankc = 1;
}
else if (obj_player.sprite_index == spr_player_levelcomplete)
{
    image_speed = 0.1;
    alarm[0] = 50;
    chose = 1;
    tvsprite = spr_tvclap;
    once = 1;
}
else if (obj_player.state == 35)
{
    alarm[0] = 50;
    image_speed = 0.1;
    tvsprite = spr_tvskull;
}
else if (global.hurtcounter >= global.hurtmilestone)
{
    alarm[0] = 150;
    image_speed = 0.1;
    
    switch (obj_player1.character)
    {
        case "N":
            character = "THE NOISE";
            break;
        
        case "R":
            character = "STUPID RAT";
            break;
        
        case "S":
            character = "SNICK";
            break;
        
        default:
            character = "PEPPINO";
            break;
    }
    
    message = "YOU HAVE HURT " + character + " " + string(global.hurtmilestone) + " TIMES...";
    
    if (tvsprite != spr_tvtalking1 && tvsprite != spr_tvtalking2 && tvsprite != spr_tvtalking3 && tvsprite != spr_tvtalking4)
        tvsprite = choose(spr_tvtalking1, spr_tvtalking2, spr_tvtalking3, spr_tvtalking4);
    
    global.hurtmilestone += 3;
}
else if (room == Realtitlescreen)
{
    image_speed = 0.1;
    tvsprite = spr_tvbanana;
    alarm[0] = 2;
    
    if (obj_mainmenuselect.selected == 0)
    {
        if (obj_mainmenuselect.optionselected == 0)
        {
            showtext = 1;
            message = "START GAME";
        }
        
        if (obj_mainmenuselect.optionselected == 1)
        {
            showtext = 1;
            message = "OPTION";
        }
        
        if (obj_mainmenuselect.optionselected == 2)
        {
            showtext = 1;
            message = "ERASE DATA";
        }
    }
    else
    {
        showtext = 1;
        message = "";
    }
}

if (obj_player.state == 55)
{
    showtext = 1;
    message = "GOT THE KEY!";
    alarm[0] = 50;
}

if (instance_exists(obj_noise_pushbutton))
{
    if (obj_noise_pushbutton.hsp != 0 && global.panic == 0)
    {
        showtext = 1;
        message = "UH OH...";
        alarm[0] = 50;
    }
}

if (tvsprite == spr_tvdefault && global.gotsaw)
    tvsprite = spr_tvchainsaw;
