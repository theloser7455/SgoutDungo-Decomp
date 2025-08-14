var deth = "";

if (global.pizzafacechasestyle != 0)
    deth = string(global.pizzafacechasestyle);

draw_self();
ini_open("SGOUTDATA new.ini");
var deth2 = "";

if (global.difficulty == 1)
{
    deth2 = "DEATH";
    
    if (global.pizzafacechasestyle != 0)
        deth2 = "DEATH" + string(global.pizzafacechasestyle);
}

var snicktime = ini_read_string("Ranks", "snickchallenge" + string(obj_player.character) + deth2, "");
ini_close();
font = font_add_sprite_ext(global.fontspritee, global.fontcharacterss, true, 0);
draw_set_font(font);
draw_set_halign(fa_center);
draw_set_color(c_white);
ini_open("SGOUTsaveData.ini");

if (place_meeting(x, y, obj_player))
{
    if (level == "snickchallenge")
        draw_text(x, y - 150, snicktime);
    
    if (global.difficulty != 1)
    {
        if (level != "snickchallenge" && !bosslevel)
        {
            draw_text(x, y - 150, ini_read_string("Highscore" + string(obj_player.character), level, 0));
            draw_text(x, y - 200, ini_read_string("Secret" + string(obj_player.character), level, 0) + " OF 6 SECRET");
            
            if (ini_read_string("Toppin" + string(obj_player.character), level + "1", 0) == 1)
            {
                draw_sprite(spr_toppinshroom, -1, x - 75, y - 100);
            }
            else
            {
                draw_set_color(c_black);
                draw_sprite(spr_toppinshroom, -1, x - 75, y - 100);
            }
            
            draw_set_color(c_white);
            
            if (ini_read_string("Toppin" + string(obj_player.character), level + "2", 0) == 1)
            {
                draw_sprite(spr_toppincheese, -1, x - 35, y - 100);
            }
            else
            {
                draw_set_color(c_black);
                draw_sprite(spr_toppincheese, -1, x - 35, y - 100);
            }
            
            draw_set_color(c_white);
            
            if (ini_read_string("Toppin" + string(obj_player.character), level + "3", 0) == 1)
            {
                draw_sprite(spr_toppintomato, -1, x, y - 100);
            }
            else
            {
                draw_set_color(c_black);
                draw_sprite(spr_toppintomato, -1, x, y - 100);
            }
            
            draw_set_color(c_white);
            
            if (ini_read_string("Toppin" + string(obj_player.character), level + "4", 0) == 1)
            {
                draw_sprite(spr_toppinsausage, -1, x + 35, y - 100);
            }
            else
            {
                draw_set_color(c_black);
                draw_sprite(spr_toppinsausage, -1, x + 35, y - 100);
            }
            
            draw_set_color(c_white);
            
            if (ini_read_string("Toppin" + string(obj_player.character), level + "5", 0) == 1)
            {
                draw_sprite(spr_toppinpineapple, -1, x + 75, y - 100);
            }
            else
            {
                draw_set_color(c_black);
                draw_sprite(spr_toppinpineapple, -1, x + 75, y - 100);
            }
            
            if (treasure && level != "snickchallenge" && bosslevel != 1)
                draw_sprite(treasuresprite, -1, x + 115, y - 100);
        }
    }
    else
    {
        deth = "";
        
        if (global.pizzafacechasestyle != 0)
            deth = string(global.pizzafacechasestyle);
        
        if (level != "snickchallenge")
            draw_text(x, y - 150, string(ini_read_real("unique collects" + deth + string(obj_player.character), level, 0)) + " UNIQUE COLLECTIBLES");
    }
}

ini_close();
