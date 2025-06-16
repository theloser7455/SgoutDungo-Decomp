image_speed = 0.35;
font = 0;
global.holiday = "none";
secondtitle = 1162;
var date = date_current_datetime();
var month = date_get_month(date);
var day = date_get_day(date);

if (month == 12)
{
    global.holiday = "JOLLY";
    secondtitle = 1521;
}

if (month == 10)
{
    global.holiday = "SCARY";
    secondtitle = 1522;
}

if (month == 4)
{
    if (day == 20)
    {
        global.holiday = "EASTER";
        secondtitle = 1519;
    }
    
    if (day == 1)
    {
        global.holiday = "FOOL";
        secondtitle = 836;
    }
}

if (month == 9)
{
    if (day != 26)
    {
        global.holiday = "SEPTEMBER";
        secondtitle = 1523;
    }
    else
    {
        global.holiday = "MRSTICK";
        secondtitle = 1524;
        alarm[0] = 20;
    }
}

if (month == 3 && day == 17)
{
    global.holiday = "PATRICK";
    secondtitle = 1520;
}

scr_soundeffect(sfx_whatsapp);
