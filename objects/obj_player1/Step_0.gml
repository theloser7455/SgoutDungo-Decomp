scr_getinput();

if (mach4flame > 0)
    mach4flame--;

if (debug)
{
    if (keyboard_check_pressed(vk_f3))
        instance_create(x, y, obj_ratbro);
    
    if (keyboard_check_pressed(vk_f4))
        instance_create(x, y, obj_shotgun);
    
    if (keyboard_check_pressed(vk_f5))
        instance_create(x, y, obj_chainsawpickup);
    
    if (keyboard_check_pressed(vk_f6) && instance_exists(obj_strongbaddie))
    {
        with (obj_strongbaddie)
            hp -= 1;
    }
    
    if (keyboard_check_pressed(vk_f7))
    {
        targetDoor = "A";
        room = leveltransitioncutscene;
        state = 0;
    }
    
    if (keyboard_check_pressed(vk_f8))
        instance_create(x + 128, y, obj_hungrypillar);
    
    if (keyboard_check_pressed(vk_f9))
    {
        if (instance_exists(obj_solid))
        {
            with (obj_solid)
                visible = true;
        }
        
        if (instance_exists(obj_platform))
        {
            with (obj_platform)
                visible = true;
        }
        
        if (instance_exists(obj_slope))
        {
            with (obj_slope)
                visible = true;
        }
    }
    
    if (keyboard_check_pressed(vk_tab))
    {
        pepperplay = 1;
        sprite_index = spr_Pidle;
        state = 600;
    }
}

switch (character)
{
    case "R":
        jumpsound = ratjump;
        mach1sound = sfx_mach1;
        mach2sound = sfx_mach2;
        mach3sound = sfx_mach3;
        mach4sound = sfx_mach4;
        machturnsound = sfx_break;
        machslidesound = sfx_machslideboost;
        superjumpsound = sfx_superjumprelease;
        superjumpholdsound = sfx_superjumphold;
        superjumpprepsound = sfx_superjumpprep;
        thebeat = mu_breakdancemusicc;
        painscream = sfx_pepscream;
        clothes = spr_palettedresserdebris;
        break;
    
    case "N":
        mach1sound = sfx_mach1;
        mach2sound = sfx_noisemach2;
        mach3sound = sfx_noisemach3;
        mach4sound = sfx_noisemach4;
        machturnsound = sfx_noisemachslide;
        machslidesound = sfx_noiseturn;
        jumpsound = sfx_noisejumpsound;
        superjumpsound = sfx_noisesuperjumprelease;
        superjumpholdsound = sfx_noisesuperjumphold;
        superjumpprepsound = sfx_noisesuperjumphold;
        
        if (paletteselect != 6)
            thebeat = mu_imtoolazytotypeallatitsthenoisebreakdancemusic;
        
        if (paletteselect == 6)
            thebeat = mu_evilbluutunee;
        
        painscream = sfx_noisescream;
        clothes = spr_palettedresserdebrisN;
        break;
    
    default:
        mach1sound = sfx_mach1;
        mach2sound = sfx_mach2;
        mach3sound = sfx_mach3;
        mach4sound = sfx_mach4;
        machturnsound = sfx_break;
        machslidesound = sfx_machslideboost;
        jumpsound = sfx_jump;
        superjumpsound = sfx_superjumprelease;
        superjumpholdsound = sfx_superjumphold;
        superjumpprepsound = sfx_superjumpprep;
        thebeat = mu_breakdancemusicc;
        painscream = sfx_pepscream;
        clothes = spr_palettedresserdebris;
        break;
}

if (state != 36)
    mach2jumpguy = 0;

if (character == "R" && key_down && state != 76 && state != 98)
{
    if (place_meeting(x, bbox_bottom, obj_platform) && !place_meeting(x, bbox_bottom, obj_solid))
        y += 1;
}

if (state != 0)
    breakdancing = 0;

switch (state)
{
    case 0:
        if (character != "TERRENCE")
        {
            scr_player_normal();
        }
        else
        {
            move = key_left + key_right;
            hsp = Approach(hsp, move * 4, 1);
            
            if (move != 0)
                xscale = move;
            
            sprite_index = spr_terrencethegoat;
            
            if (key_jump)
                vsp = -20;
            
            if (!grounded)
                airbone = 1;
            
            if (grounded && airbone && !place_meeting(x, y + 1, obj_destructibles))
            {
                airbone = 0;
                scr_soundeffect(sfx_groundpound);
                instance_create(x, y, obj_ratdust);
                
                with (instance_create(x, y, obj_ratdust))
                    image_xscale *= -1;
                
                with (instance_create(x, y + 32, obj_machalleffect))
                {
                    speed = 12;
                    direction = 90;
                }
                
                with (instance_create(x, y + 32, obj_machalleffect))
                {
                    speed = 12;
                    direction = 22.5;
                }
                
                with (instance_create(x, y + 32, obj_machalleffect))
                {
                    speed = 12;
                    direction = 45;
                }
                
                with (instance_create(x, y + 32, obj_machalleffect))
                {
                    speed = 12;
                    direction = 67.5;
                }
                
                with (instance_create(x, y + 32, obj_machalleffect))
                {
                    speed = -12;
                    direction = -22.5;
                }
                
                with (instance_create(x, y + 32, obj_machalleffect))
                {
                    speed = -12;
                    direction = -45;
                }
                
                with (instance_create(x, y + 32, obj_machalleffect))
                {
                    speed = -12;
                    direction = -67.5;
                }
                
                jumpAnim = 1;
                jumpstop = 0;
                
                with (obj_baddie)
                {
                    if (grounded && point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), __view_get(0, 0) + __view_get(2, 0), __view_get(1, 0) + __view_get(3, 0)))
                    {
                        vsp = -11;
                        hsp = 0;
                    }
                }
                
                with (obj_camera)
                {
                    shake_mag = 10;
                    shake_mag_acc = 30 / room_speed;
                }
                
                combo = 0;
                bounce = 0;
                freefallstart = 0;
            }
            
            vsp += 1;
        }
        
        break;
    
    case 2:
        scr_player_finishingblow();
        break;
    
    case 1:
        scr_player_tumble();
        break;
    
    case 7:
        scr_player_titlescreen();
        break;
    
    case 3:
        scr_player_ejected();
        break;
    
    case 6:
        scr_player_firemouth();
        break;
    
    case 5:
        scr_player_fireass();
        break;
    
    case 4:
        scr_player_transitioncutscene();
        break;
    
    case 8:
        scr_playerN_hookshot();
        break;
    
    case 11:
        scr_player_slap();
        break;
    
    case 9:
        scr_player_tacklecharge();
        break;
    
    case 12:
        scr_player_cheesepep();
        break;
    
    case 10:
        scr_player_cheeseball();
        break;
    
    case 13:
        scr_player_cheesepepstick();
        break;
    
    case 14:
        scr_player_boxxedpep();
        break;
    
    case 15:
        scr_player_pistolaim();
        break;
    
    case 16:
        scr_player_climbwall();
        break;
    
    case 17:
        scr_player_knightpepslopes();
        break;
    
    case 18:
        scr_player_portal();
        break;
    
    case 19:
        scr_player_secondjump();
        break;
    
    case 20:
        scr_player_chainsawbump();
        break;
    
    case 21:
        scr_player_handstandjump();
        break;
    
    case 22:
        scr_player_gottreasure();
        break;
    
    case 23:
        scr_player_knightpep();
        break;
    
    case 24:
        scr_player_knightpepattack();
        break;
    
    case 25:
        scr_player_meteorpep();
        break;
    
    case 26:
        scr_player_bombpep();
        break;
    
    case 27:
        scr_player_grabbing();
        break;
    
    case 28:
        scr_player_chainsawpogo();
        break;
    
    case 29:
        scr_player_shotgunjump();
        break;
    
    case 30:
        scr_player_stunned();
        break;
    
    case 31:
        scr_player_highjump();
        break;
    
    case 32:
        scr_player_chainsaw();
        break;
    
    case 33:
        scr_player_facestomp();
        break;
    
    case 35:
        scr_player_timesup();
        break;
    
    case 36:
        scr_player_machroll();
        break;
    
    case 38:
        scr_player_pistol();
        break;
    
    case 37:
        scr_player_shotgun();
        break;
    
    case 39:
        scr_player_machfreefall();
        break;
    
    case 40:
        scr_player_throw();
        break;
    
    case 42:
        scr_player_superslam();
        break;
    
    case 41:
        scr_player_slam();
        break;
    
    case 43:
        scr_player_skateboard();
        break;
    
    case 44:
        scr_player_grind();
        break;
    
    case 45:
        scr_player_grab();
        break;
    
    case 46:
        scr_player_punch();
        break;
    
    case 47:
        scr_player_backkick();
        break;
    
    case 48:
        scr_player_uppunch();
        break;
    
    case 49:
        scr_player_shoulder();
        break;
    
    case 50:
        scr_player_backbreaker();
        break;
    
    case 51:
        scr_player_bossdefeat();
        break;
    
    case 53:
        scr_player_bossintro();
        break;
    
    case 61:
        scr_player_smirk();
        break;
    
    case 52:
        scr_player_pizzathrow();
        break;
    
    case 54:
        scr_player_gameover();
        break;
    
    case 91:
        scr_player_Sjumpland();
        break;
    
    case 90:
        scr_player_freefallprep();
        break;
    
    case 88:
        scr_player_runonball();
        break;
    
    case 87:
        scr_player_boulder();
        break;
    
    case 55:
        scr_player_keyget();
        break;
    
    case 56:
        scr_player_tackle();
        break;
    
    case 59:
        scr_player_slipnslide();
        break;
    
    case 58:
        scr_player_ladder();
        break;
    
    case 57:
        scr_player_jump();
        break;
    
    case 63:
        scr_player_victory();
        break;
    
    case 60:
        scr_player_comingoutdoor();
        break;
    
    case 62:
        scr_player_Sjump();
        break;
    
    case 64:
        scr_player_Sjumpprep();
        break;
    
    case 65:
        scr_player_crouch();
        break;
    
    case 66:
        scr_player_crouchjump();
        break;
    
    case 67:
        scr_player_crouchslide();
        break;
    
    case 68:
        scr_player_mach1();
        break;
    
    case 69:
        scr_player_mach2();
        break;
    
    case 89:
        scr_player_mach3();
        break;
    
    case 70:
        scr_player_machslide();
        break;
    
    case 71:
        scr_player_bump();
        break;
    
    case 72:
        scr_player_hurt();
        break;
    
    case 73:
        scr_player_freefall();
        break;
    
    case 76:
        scr_player_freefallland();
        break;
    
    case 74:
        scr_player_hang();
        break;
    
    case 77:
        scr_player_door();
        break;
    
    case 83:
        scr_player_barrelnormal();
        break;
    
    case 82:
        scr_player_barrelfall();
        break;
    
    case 81:
        scr_player_barrelmach1();
        break;
    
    case 80:
        scr_player_barrelmach2();
        break;
    
    case 79:
        scr_player_barrelfloat();
        break;
    
    case 78:
        scr_player_barrelcrouch();
        break;
    
    case 84:
        scr_player_barrelslipnslide();
        break;
    
    case 85:
        scr_player_barrelroll();
        break;
    
    case 86:
        scr_player_current();
        break;
    
    case 92:
        sprite_index = spr_snick_machstartanimation;
        image_speed = 0.35;
        hsp = 0;
        vsp = 0;
        
        if (floor(image_index) == (image_number - 1))
        {
            state = 89;
            sprite_index = spr_mach4;
        }
        
        break;
    
    case 93:
        sprite_index = spr_snick_climbdownladder;
        image_speed = 0.35;
        move = key_left + key_right;
        hsp = Approach(hsp, move * 12, 1);
        
        if (move != 0)
            xscale = move;
        
        if (grounded && vsp > 0)
        {
            state = 69;
            sprite_index = spr_mach;
        }
        
        break;
    
    case 94:
        scr_player_breakdanceattack();
        break;
    
    case 95:
        scr_player_stupidratroll();
        break;
    
    case 96:
        scr_player_stupidratstoproll();
        break;
    
    case 97:
        scr_player_stupidratturnroll();
        break;
    
    case 98:
        scr_player_stupidrat_cheeseslam();
        break;
    
    case 99:
        scr_player_stupidratjelly();
        break;
    
    case 100:
        scr_player_uppercut();
        break;
    
    case 307:
        scr_player_kungfu();
        break;
    
    case 308:
        scr_player_jetpack();
        break;
    
    case 9090:
        scr_player_NEWchainsaw();
        break;
    
    case 9890:
        scr_playerN_wallbounce();
        break;
    
    case 4719:
        scr_playerN_crusher();
        break;
    
    case 1670:
        scr_player_parryshit();
        break;
    
    case 9457:
        vsp = 0;
        hsp = 0;
        break;
    
    case 9458:
        image_speed = 0.5;
        
        if (floor(image_index) >= 5)
        {
            state = 1670;
            vsp = -5;
            hsp = -8 * xscale;
            
            with (instance_create(x, y, obj_playernoisebombboss))
            {
                vsp = -5;
                image_xscale = other.xscale;
                fling = 1;
            }
            
            with (instance_create(x + (32 * xscale), y, obj_bangeffect))
                sprite_index = spr_noisewalljumpeffect;
        }
        
        break;
    
    case 9459:
        scr_playerNfork();
        break;
    
    case 9360:
        scr_player_hitstun();
        break;
    
    case 600:
        scr_playerpepperman_idle();
        break;
    
    case 601:
        scr_playerpepperman_fall();
        break;
    
    case 602:
        scr_playerpepperman_mach();
        break;
    
    case 603:
        scr_playerpepperman_groundpound();
        break;
}

if (updash && state != 100 && state != 62 && state != 99)
    updash = 0;

if (!updash && (state == 100 || state == 99 || state == 62))
    updash = 1;

if (squished && state != 95 && state != 96 && state != 97 && state != 0 && state != 57)
    squished = 0;

scr_playersounds();

if (grounded && state != 21)
    suplexmove = 0;

if (state != 73 && state != 42)
    freefallsmash = 0;

if (global.playerhealth <= 0 && state != 54)
{
    image_index = 0;
    sprite_index = spr_deathstart;
    state = 54;
}

if (state == 54 && y > (room_height * 2))
{
    scr_playerreset();
    targetDoor = "A";
    room = hub_room1;
    state = 0;
    visible = true;
    x = 368;
}

if (!instance_exists(baddiegrabbedID) && (state == 45 || state == 42 || state == 9))
    state = 0;

if (!(state == 45 || state == 42 || state == 69))
    baddiegrabbedID = obj_slope;

if (grounded && place_meeting(x, y + 1, obj_newgrindrail) && !place_meeting(x, y + 1, obj_solid))
    state = 44;

if (anger == 0)
    angry = 0;

if (anger > 0)
{
    angry = 1;
    anger -= 1;
}

if (sprite_index == spr_player_winding && state != 0)
    windingAnim = 0;

if (state != 45)
    swingdingbuffer = 0;

if (sprite_index == spr_player_idlevomit && image_index > 28 && image_index < 43)
    instance_create(x + random_range(-5, obj_pause), y + 46, obj_vomit);

if (sprite_index == spr_player_idlevomitblood && image_index > 28 && image_index < 43)
{
    with (instance_create(x + random_range(-5, obj_pause), y + 46, obj_vomit))
        sprite_index = spr_vomit2;
}

if (global.playerhealth == 1 && !instance_exists(obj_sweat) && obj_player.state == 0)
    instance_create(x, y, obj_sweat);

if (angry == 1 && !instance_exists(obj_angrycloud) && obj_player.state == 0)
    instance_create(x, y, obj_angrycloud);

if (!global.combopause)
{
    if (global.combotime > 0)
    {
        if (character != "R")
            global.combotime -= 0.25;
        else
            global.combotime -= 0.16666666666666666;
    }
}

if (global.combopause > -1)
    global.combopause -= 1;

if (global.combotime == 0 && global.combo != 0)
{
    global.combo = 0;
    global.combodropped = 1;
    
    if (character == "N" && paletteselect == 6)
        scr_soundeffect(sfx_bluu1);
}

if (killstillsuper >= 10)
{
    killstillsuper = 0;
    supertaunts = 1;
}

if (input_buffer_jump < 8)
    input_buffer_jump++;

if (input_buffer_secondjump < 8)
    input_buffer_secondjump++;

if (input_buffer_highjump < 8)
    input_buffer_highjump++;

if (key_particles == 1)
    instance_create(random_range(x + 25, x - 25), random_range(y + 35, y - 25), obj_keyeffect);

if (inv_frames == 0 && hurted == 0)
    image_alpha = 1;

if (state == 69 || state == 9 || state == 43 || state == 23 || state == 14 || state == 12 || state == 17 || state == 24 || state == 26 || state == 33 || state == 39 || state == 33 || state == 36 || state == 89 || state == 73 || state == 62)
    attacking = 1;
else
    attacking = 0;

if (state == 40 || state == 46 || state == 47 || state == 49 || state == 48)
    grabbing = 1;
else
    grabbing = 0;

if (state == 89 || state == 69 || state == 16 || state == 73 || state == 1 || state == 5 || state == 6 || state == 8 || state == 43 || state == 34 || state == 62 || state == 36 || state == 39 || state == 9 || (state == 42 && sprite_index == spr_piledriver) || state == 23 || state == 24 || state == 17 || state == 14 || state == 12 || state == 10 || state == 94 || state == 98 || (state == 100 && vsp <= 0) || state == 307 || state == 308 || state == 9890 || state == 4719 || (state == 9090 && sprite_index == spr_player_chainsaw) || state == 9459 || state == 602 || state == 603 || state == 70)
    instakillmove = 1;
else
    instakillmove = 0;

if (flash == 1 && alarm[0] <= 0)
    alarm[0] = 0.15 * room_speed;

if (state != 89 && state != 70)
    autodash = 0;

if ((state != 57 && state != 66 && state != 11) || vsp < 0)
    fallinganimation = 0;

if (state != 76 && state != 0 && state != 70)
    facehurt = 0;

if (state != 0 && state != 70)
    machslideAnim = 0;

if (state != 0)
{
    idle = 0;
    dashdust = 0;
}

if (state != 68 && state != 57 && state != 8 && state != 21 && state != 0 && state != 69 && state != 89 && state != 73 && state != 23 && state != 37 && state != 36 && state != 17)
    momemtum = 0;

if (state != 62 && state != 64)
    a = 0;

if (state != 33)
    facestompAnim = 0;

if (state != 73 && state != 33 && state != 42 && state != 76)
    superslam = 0;

if (state != 69)
    machpunchAnim = 0;

if (state != 57)
    ladderbuffer = 0;

if (state != 57)
    stompAnim = 0;

if ((state == 89 || state == 69 || state == 16 || state == 8 || state == 9 || state == 21 || state == 70 || (state == 308 && sprite_index != spr_playerN_noisebombspinjump) || state == 62) && !instance_exists(obj_mach3effect))
{
    toomuchalarm1 = 6;
    instance_create(x, y, obj_mach3effect);
}

if (toomuchalarm1 > 0)
{
    toomuchalarm1 -= 1;
    
    if (toomuchalarm1 <= 0 && (state == 89 || state == 16 || state == 8 || state == 69 || state == 9 || state == 70 || state == 21 || (state == 32 && mach2 >= 100) || state == 62 || (state == 308 && sprite_index != spr_playerN_noisebombspinjump)))
    {
        instance_create(x, y, obj_mach3effect);
        toomuchalarm1 = 6;
    }
}

if (y < -800)
{
    x = roomstartx;
    y = -500;
    state = 73;
    vsp = 10;
}

if (character == "S")
{
    if (state == 66 || state == 65)
        state = 0;
}

var k = 0;

if (state == 308 && sprite_index == spr_playerN_jetpackslide)
    k = 1;

if (character != "S" && !place_meeting(x, y, obj_solid))
{
    if (state != 71 && !squished && sprite_index != spr_bombpepintro && sprite_index != spr_knightpepthunder && state != 1 && state != 5 && state != 65 && state != 14 && state != 38 && sprite_index != spr_player_crouchshoot && state != 64 && state != 32 && state != 36 && state != 72 && state != 67 && state != 66 && character != "TERRENCE" && !k)
        mask_index = spr_player_mask;
    else
        mask_index = spr_crouchmask;
}
else if (place_meeting(x, y, obj_solid))
{
    mask_index = spr_crouchmask;
}

if (character == "S" && state == 26)
    mask_index = spr_player_mask;
else if (character == "S")
    mask_index = spr_crouchmask;

if (state == 22 || sprite_index == spr_knightpep_start || sprite_index == spr_knightpep_thunder || state == 55 || state == 77 || state == 3 || state == 63 || state == 60 || state == 54)
    cutscene = 1;
else
    cutscene = 0;

if (cutscene)
    global.combopause = 5;

if ((place_meeting(x, y, obj_door) || place_meeting(x, y, obj_snick) || place_meeting(x, y, obj_keydoor) || (place_meeting(x, y, obj_exitgate) && global.panic == 1)) && !instance_exists(obj_uparrow) && scr_solid(x, y + 1) && state == 0)
    instance_create(x, y, obj_uparrow);

if (state == 69 && !instance_exists(obj_speedlines))
    instance_create(x, y, obj_speedlines);

scr_collide_destructibles();

if (place_meeting(x, y, obj_water) && !grounded)
    vsp -= (grav / 2);

if (global.lowgrav)
    vsp -= (grav / 1.5);

if (state != 7 && state != 77 && state != 62 && state != 3 && state != 60 && state != 87 && state != 55 && state != 63 && state != 18 && state != 35 && state != 22 && state != 54)
    scr_collide_player();

if (state == 87)
    scr_collide_player();

var windx = 0;
var windy = 0;

with (instance_place(x, y, obj_wind))
{
    windx = xforce;
    windy = yforce;
}

if (!scr_solid(x + windx, y))
    x += windx;

if (!scr_solid(x, y + windy))
    y += windy;

if (global.deathmode && !instance_exists(obj_sigmaface))
{
    with (instance_create(x, y, obj_sigmaface))
    {
        if (room == ruin_11 && other.targetDoor == "C")
            y = 528;
    }
}

afterimage--;
blur--;

if (state == 46 || state == 94 || state == 100 || state == 307 || state == 9890 || (state == 308 && sprite_index == spr_playerN_noisebombspinjump))
{
    if (afterimage <= 0)
    {
        with (instance_create(x, y, obj_afterimog))
        {
            image_index = other.image_index;
            sprite_index = other.sprite_index;
            ini_open("SGOUTDATA.ini");
            image_blend = make_color_rgb(ini_read_real("afterimages", "pepattack R", 1), ini_read_real("afterimages", "pepattack G", 1), ini_read_real("afterimages", "pepattack B", 1));
            
            if (other.character == "N")
                image_blend = make_color_rgb(ini_read_real("afterimages", "Nattack R", 1), ini_read_real("afterimages", "Nattack G", 1), ini_read_real("afterimages", "Nattack B", 1));
            
            ini_close();
            image_xscale = other.xscale;
            spr_palette = other.spr_palette;
            paletteselect = other.paletteselect;
        }
        
        afterimage = 5;
    }
}

if (state == 36 || state == 4719 || state == 93 || state == 73 || (state == 89 && sprite_index == spr_crazyrun) || state == 67 || state == 9459)
{
    if (blur <= 0)
    {
        with (instance_create(x, y, obj_afterimog))
        {
            image_index = other.image_index;
            sprite_index = other.sprite_index;
            image_blend = c_white;
            image_alpha = 0.75;
            drain = 0.125;
            image_xscale = other.xscale;
            spr_palette = other.spr_palette;
            paletteselect = other.paletteselect;
        }
        
        blur = 2;
    }
}

if ((state == 0 || state == 57 || state == 68 || state == 69 || state == 89 || state == 95 || state == 96 || state == 97) && !squished)
{
    scr_taunt();
    
    if (character == "R" && key_punch2 && enemiesswallowed > 1)
    {
        if (enemiesswallowed > 100)
            enemiesswallowed = 100;
        
        repeat (enemiesswallowed * 2)
        {
            sprite_index = choose(spr_player_suplexmash1, spr_player_suplexmash2, spr_player_suplexmash3, spr_player_suplexmash4, spr_player_suplexmash5, spr_player_suplexmash6, spr_player_suplexmash7);
            state = 56;
            movespeed = 3;
            vsp = -3;
            image_index = 0;
            
            with (instance_create(x + (image_xscale * 20), y, obj_shotgunbullet))
            {
                image_xscale = other.image_xscale;
                sprite_index = spr_baddiegibs;
                image_index = random_range(0, image_number - 1);
                image_speed = 0;
                vspeed = random_range(-5, 5);
                spd += random_range(-15, 15);
            }
        }
        
        scr_soundeffect(burp02);
        enemiesswallowed = 0;
        state = 2;
        sprite_index = spr_stupidrat_spit;
        movespeed = -5;
    }
    
    if (!global.gotsaw)
    {
        var bombie = 0;
        
        if (character == "N" && instance_exists(obj_strongbaddie))
            bombie = 1;
        
        if (key_slap2 && character != "S" && !(shotgunAnim == 1))
        {
            if (!bombie)
            {
                suplexmove = 1;
                scr_soundeffect(sfx_suplexdash);
                state = 21;
                image_index = 0;
                
                if (shotgunAnim == 0)
                    sprite_index = spr_suplexdash;
                else
                    sprite_index = spr_shotgun_suplexdash;
                
                if (character == "R")
                    sprite_index = spr_stupidrat_eat;
                
                if (movespeed < 11)
                    movespeed = 11;
            }
            else
            {
                state = 9458;
                sprite_index = spr_playerN_noisebombkick;
                image_index = 0;
            }
        }
        
        if (key_slap2 && character != "S" && character != "TERRENCE" && shotgunAnim == 1)
        {
            scr_soundeffect(sfx_killingblow);
            state = 37;
            
            with (instance_create(x, y, obj_pistoleffect))
                image_xscale = other.image_xscale;
            
            image_index = 0;
            sprite_index = spr_player_shotgun;
            
            if (!key_up)
            {
                instance_create(x + (image_xscale * 20), y + 20, obj_shotgunbullet);
                
                with (instance_create(x + (image_xscale * 20), y + 20, obj_shotgunbullet))
                    spdh = 4;
                
                with (instance_create(x + (image_xscale * 20), y + 20, obj_shotgunbullet))
                    spdh = -4;
            }
        }
    }
    else if (key_slap2 && character != "S" && character != "TERRENCE")
    {
        suplexmove = 1;
        scr_soundeffect(sfx_chainsawstart);
        state = 9090;
        image_index = 0;
        
        if (grounded)
            sprite_index = spr_player_chainsaw;
        else
            sprite_index = spr_player_chainsawpogo2;
        
        if (movespeed < 12)
            movespeed = 12;
    }
    
    if (key_slap2 && key_up && character == "R")
    {
        state = 99;
        sprite_index = spr_stupidrat_jelly;
        vsp = -20;
        scr_soundeffect(jellywiggle);
        
        repeat (8)
            instance_create(x, y, obj_jellyjunk);
    }
    
    if (key_slap2 && key_up && character != "R" && character != "TERRENCE")
    {
        if (!shotgunAnim)
        {
            state = 100;
            sprite_index = spr_uppercut1;
            vsp = -15;
            
            if (character == "N")
                vsp = -20;
            
            dir = xscale;
            
            if (audio_is_playing(sfx_chainsawstart))
                audio_stop_sound(sfx_chainsawstart);
            
            scr_soundeffect(sfx_uppercut);
        }
        else
        {
            scr_soundeffect(sfx_killingblow);
            image_index = 0;
            state = 73;
            sprite_index = spr_player_shotgunjump1;
            vsp = -25;
            
            with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
            {
                sprite_index = sprite10391;
                spdh = -10;
                spd = 0;
            }
            
            with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
            {
                sprite_index = sprite10391;
                spdh = -10;
                spd = 5;
            }
            
            with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
            {
                sprite_index = sprite10391;
                spdh = -10;
                spd = -5;
            }
        }
    }
    
    scr_playeraltattacks();
}

if (state == 9890 || state == 4719 || (state == 308 && sprite_index == spr_playerN_noisebombspinjump))
{
    if (key_slap2 && key_up && character != "R" && character != "TERRENCE")
    {
        if (!shotgunAnim)
        {
            state = 100;
            sprite_index = spr_uppercut1;
            vsp = -15;
            
            if (character == "N")
                vsp = -20;
            
            dir = xscale;
            
            if (audio_is_playing(sfx_chainsawstart))
                audio_stop_sound(sfx_chainsawstart);
            
            scr_soundeffect(sfx_uppercut);
        }
        else
        {
            scr_soundeffect(sfx_killingblow);
            image_index = 0;
            state = 73;
            sprite_index = spr_player_shotgunjump1;
            vsp = -25;
            
            with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
            {
                sprite_index = sprite10391;
                spdh = -10;
                spd = 0;
            }
            
            with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
            {
                sprite_index = sprite10391;
                spdh = -10;
                spd = 5;
            }
            
            with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
            {
                sprite_index = sprite10391;
                spdh = -10;
                spd = -5;
            }
        }
    }
    
    scr_playeraltattacks();
}

if (state == 0 || state == 57 || state == 68 || state == 69 || state == 89 || state == 95 || state == 96 || state == 97 || state == 9890 || state == 4719 || state == 9459)
    scr_taunt();

if (superdown > 0)
    superdown--;

superframe += 0.5;

if (superframe > 10)
    superframe = 0;
