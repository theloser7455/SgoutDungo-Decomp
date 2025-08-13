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
    
    if (keyboard_check_pressed(vk_f7) && !instance_exists(hidontdeletemepls) && !instance_exists(obj_fakeloaderforsgoutdungo))
    {
        targetDoor = "A";
        room = leveltransitioncutscene;
        state = states.normal;
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
        
        if (instance_exists(obj_flippedplatform))
        {
            with (obj_flippedplatform)
                visible = true;
        }
    }
    
    if (keyboard_check_pressed(vk_f10))
        global.uniquecollects += 1;
    
    if (keyboard_check_pressed(vk_f11))
    {
        grav *= -1;
        yscale *= -1;
    }
    
    if (keyboard_check_pressed(vk_tab))
    {
        pepperplay = 1;
        sprite_index = spr_Pidle;
        state = states.playerpeppermanidle;
    }
    
    if (keyboard_check_pressed(vk_home))
        instance_create(x, y, obj_snickexescreaming);
}

switch (character)
{
    case "S":
        mach1sound = sfx_mach1;
        mach2sound = sfx_snickmach2;
        mach3sound = sfx_snickmach3;
        mach4sound = sfx_snickmach4;
        machturnsound = sfx_snickbreak;
        machslidesound = sfx_snickturn;
        jumpsound = sfx_snickjump;
        superjumpsound = sfx_snicksuperjumprelease;
        superjumpholdsound = sfx_snicksuperjumphold;
        superjumpprepsound = sfx_snicksuperjumphold;
        thebeatvol = 0.25;
        thebeat = mu_thesnickdance;
        painscream = sfx_snickscream;
        clothes = spr_palettedresserdebris;
        break;
    
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
        thebeatvol = 0;
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
        thebeatvol = 0;
        
        if (paletteselect != 7 && paletteselect != 9 && paletteselect != 10)
            thebeat = mu_imtoolazytotypeallatitsthenoisebreakdancemusic;
        
        if (paletteselect == 7)
            thebeat = mu_evilbluutunee;
        
        if (paletteselect == 9)
        {
            thebeatvol = 0.35;
            thebeat = mu_vanityboombox;
            
            if (global.butchermus == 0)
            {
                thebeatvol = 0;
                thebeat = mu_vanityboomboxthesecond;
            }
        }
        
        if (paletteselect == 10)
            thebeat = mu_sigmatic;
        
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
        thebeatvol = 0;
        
        if (paletteselect != 15)
            thebeat = mu_breakdancemusicc;
        else
            thebeat = mu_veggieboombox;
        
        painscream = sfx_pepscream;
        
        if (paletteselect == 17 && !global.lamepalettes)
            painscream = sfx_pursuerscream;
        
        clothes = spr_palettedresserdebris;
        break;
}

if (state != states.machroll)
    mach2jumpguy = 0;

if (character == "R" && key_down && state != states.freefallland && state != states.stupidratcheeseslam)
{
    if (place_meeting(x, bbox_bottom, obj_platform) && !place_meeting(x, bbox_bottom, obj_solid))
        y += 1;
}

if (state != states.normal)
    breakdancing = 0;

switch (state)
{
    case states.normal:
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
    
    case states.finishingblow:
        scr_player_finishingblow();
        break;
    
    case states.tumble:
        scr_player_tumble();
        break;
    
    case states.titlescreen:
        scr_player_titlescreen();
        break;
    
    case states.ejected:
        scr_player_ejected();
        break;
    
    case states.firemouth:
        scr_player_firemouth();
        break;
    
    case states.fireass:
        scr_player_fireass();
        break;
    
    case states.transitioncutscene:
        scr_player_transitioncutscene();
        break;
    
    case states.hookshot:
        scr_playerN_hookshot();
        break;
    
    case states.slap:
        scr_player_slap();
        break;
    
    case states.tacklecharge:
        scr_player_tacklecharge();
        break;
    
    case states.cheesepep:
        scr_player_cheesepep();
        break;
    
    case states.cheeseball:
        scr_player_cheeseball();
        break;
    
    case states.cheesepepstick:
        scr_player_cheesepepstick();
        break;
    
    case states.boxxedpep:
        scr_player_boxxedpep();
        break;
    
    case states.pistolaim:
        scr_player_pistolaim();
        break;
    
    case states.climbwall:
        scr_player_climbwall();
        break;
    
    case states.knightpepslopes:
        scr_player_knightpepslopes();
        break;
    
    case states.portal:
        scr_player_portal();
        break;
    
    case states.secondjump:
        scr_player_secondjump();
        break;
    
    case states.chainsawbump:
        scr_player_chainsawbump();
        break;
    
    case states.handstandjump:
        scr_player_handstandjump();
        break;
    
    case states.gottreasure:
        scr_player_gottreasure();
        break;
    
    case states.knightpep:
        scr_player_knightpep();
        break;
    
    case states.knightpepattack:
        scr_player_knightpepattack();
        break;
    
    case states.meteorpep:
        scr_player_meteorpep();
        break;
    
    case states.bombpep:
        scr_player_bombpep();
        break;
    
    case states.grabbing:
        scr_player_grabbing();
        break;
    
    case states.chainsawpogo:
        scr_player_chainsawpogo();
        break;
    
    case states.shotgunjump:
        scr_player_shotgunjump();
        break;
    
    case states.stunned:
        scr_player_stunned();
        break;
    
    case states.highjump:
        scr_player_highjump();
        break;
    
    case states.chainsaw:
        scr_player_chainsaw();
        break;
    
    case states.facestomp:
        scr_player_facestomp();
        break;
    
    case states.timesup:
        scr_player_timesup();
        break;
    
    case states.machroll:
        scr_player_machroll();
        break;
    
    case states.pistol:
        scr_player_pistol();
        break;
    
    case states.shotgun:
        scr_player_shotgun();
        break;
    
    case states.machfreefall:
        scr_player_machfreefall();
        break;
    
    case states.throwin:
        scr_player_throw();
        break;
    
    case states.superslam:
        scr_player_superslam();
        break;
    
    case states.slam:
        scr_player_slam();
        break;
    
    case states.skateboard:
        scr_player_skateboard();
        break;
    
    case states.grind:
        scr_player_grind();
        break;
    
    case states.grab:
        scr_player_grab();
        break;
    
    case states.punch:
        scr_player_punch();
        break;
    
    case states.backkick:
        scr_player_backkick();
        break;
    
    case states.uppunch:
        scr_player_uppunch();
        break;
    
    case states.shoulder:
        scr_player_shoulder();
        break;
    
    case states.backbreaker:
        scr_player_backbreaker();
        break;
    
    case states.bossdefeat:
        scr_player_bossdefeat();
        break;
    
    case states.bossintro:
        scr_player_bossintro();
        break;
    
    case states.smirk:
        scr_player_smirk();
        break;
    
    case states.pizzathrow:
        scr_player_pizzathrow();
        break;
    
    case states.gameover:
        scr_player_gameover();
        break;
    
    case states.Sjumpland:
        scr_player_Sjumpland();
        break;
    
    case states.freefallprep:
        scr_player_freefallprep();
        break;
    
    case states.runonball:
        scr_player_runonball();
        break;
    
    case states.boulder:
        scr_player_boulder();
        break;
    
    case states.keyget:
        scr_player_keyget();
        break;
    
    case states.tackle:
        scr_player_tackle();
        break;
    
    case states.slipnslide:
        scr_player_slipnslide();
        break;
    
    case states.ladder:
        scr_player_ladder();
        break;
    
    case states.jump:
        scr_player_jump();
        break;
    
    case states.victory:
        scr_player_victory();
        break;
    
    case states.comingoutdoor:
        scr_player_comingoutdoor();
        break;
    
    case states.Sjump:
        scr_player_Sjump();
        break;
    
    case states.Sjumpprep:
        scr_player_Sjumpprep();
        break;
    
    case states.crouch:
        scr_player_crouch();
        break;
    
    case states.crouchjump:
        scr_player_crouchjump();
        break;
    
    case states.crouchslide:
        scr_player_crouchslide();
        break;
    
    case states.mach1:
        scr_player_mach1();
        break;
    
    case states.mach2:
        scr_player_mach2();
        break;
    
    case states.mach3:
        scr_player_mach3();
        break;
    
    case states.machslide:
        scr_player_machslide();
        break;
    
    case states.bump:
        scr_player_bump();
        break;
    
    case states.hurt:
        scr_player_hurt();
        break;
    
    case states.freefall:
        scr_player_freefall();
        break;
    
    case states.freefallland:
        scr_player_freefallland();
        break;
    
    case states.hang:
        scr_player_hang();
        break;
    
    case states.door:
        scr_player_door();
        break;
    
    case states.barrelnormal:
        scr_player_barrelnormal();
        break;
    
    case states.barrelfall:
        scr_player_barrelfall();
        break;
    
    case states.barrelmach1:
        scr_player_barrelmach1();
        break;
    
    case states.barrelmach2:
        scr_player_barrelmach2();
        break;
    
    case states.barrelfloat:
        scr_player_barrelfloat();
        break;
    
    case states.barrelcrouch:
        scr_player_barrelcrouch();
        break;
    
    case states.barrelslipnslide:
        scr_player_barrelslipnslide();
        break;
    
    case states.barrelroll:
        scr_player_barrelroll();
        break;
    
    case states.current:
        scr_player_current();
        break;
    
    case states.snickmachstart:
        sprite_index = spr_snick_machstartanimation;
        image_speed = 0.35;
        hsp = 0;
        vsp = 0;
        
        if (floor(image_index) == (image_number - 1))
        {
            state = states.mach3;
            sprite_index = spr_mach4;
        }
        
        break;
    
    case states.snickclimbdown:
        sprite_index = spr_snick_climbdownladder;
        image_speed = 0.35;
        move = key_left + key_right;
        hsp = Approach(hsp, move * 12, 1);
        
        if (move != 0)
            xscale = move;
        
        if (grounded && vsp > 0)
        {
            state = states.mach2;
            sprite_index = spr_mach;
        }
        
        if (key_slap2)
        {
            scr_soundeffect(choose(sfx_snickglitchnew, sfx_snickglitchnew2, sfx_snickglitchnew3, sfx_snickglitchnew4));
            
            if (movespeed < 12)
                movespeed = 12;
            
            tauntstoredvsp = hsp;
            tauntstoredhsp = vsp;
            hsp = 0;
            vsp = 0;
            tpcd = 0;
            tph = 60 * xscale;
            tpv = 0;
            tptimes = 4;
            tauntstoredstate = 0;
            tauntstoredsprite = sprite_index;
            tauntstoredmovespeed = movespeed + 4;
            sprite_index = spr_secondjump2;
            
            if (key_down)
            {
                tph = 0;
                tpv = 60;
            }
            
            state = states.snicktp;
        }
        
        break;
    
    case states.breakdanceattack:
        scr_player_breakdanceattack();
        break;
    
    case states.stupidratroll:
        scr_player_stupidratroll();
        break;
    
    case states.stupidratstoproll:
        scr_player_stupidratstoproll();
        break;
    
    case states.stupidratturnroll:
        scr_player_stupidratturnroll();
        break;
    
    case states.stupidratcheeseslam:
        scr_player_stupidrat_cheeseslam();
        break;
    
    case states.stupidratjelly:
        scr_player_stupidratjelly();
        break;
    
    case states.uppercut:
        scr_player_uppercut();
        break;
    
    case states.kungfu:
        scr_player_kungfu();
        break;
    
    case states.jetpack:
        scr_player_jetpack();
        break;
    
    case states.NEWchainsaw:
        scr_player_NEWchainsaw();
        break;
    
    case states.wallbounce:
        scr_playerN_wallbounce();
        break;
    
    case states.Ncrusher:
        scr_playerN_crusher();
        break;
    
    case states.parryshit:
        scr_player_parryshit();
        break;
    
    case states.stopvspNhsp:
        vsp = 0;
        hsp = 0;
        break;
    
    case states.noisebomb:
        image_speed = 0.5;
        
        if (floor(image_index) >= 5)
        {
            state = states.parryshit;
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
    
    case states.Nfork:
        scr_playerNfork();
        break;
    
    case states.hitstun:
        scr_player_hitstun();
        break;
    
    case states.playerpeppermanidle:
        scr_playerpepperman_idle();
        break;
    
    case states.playerpeppermanfall:
        scr_playerpepperman_fall();
        break;
    
    case states.playerpeppermanmach:
        scr_playerpepperman_mach();
        break;
    
    case states.playerpeppermangroundpound:
        scr_playerpepperman_groundpound();
        break;
    
    case states.phase2transition:
        scr_player_phase2transition();
        break;
    
    case states.snicktp:
        scr_playersnick_tp();
        break;
}

if (state != states.Sjump)
    ervilvariable = 0;

if (state != states.kungfu && state != states.uppercut && state != states.breakdanceattack && state != states.punch)
    yscaleplus = 0;

xscaleplus = lerp(xscaleplus, 0, 0.0625);

if (state == states.jetpack)
    xscaleplus = lerp(xscaleplus, 0, 0.125);

if (updash && state != states.uppercut && state != states.Sjump && state != states.stupidratjelly)
    updash = 0;

if (!updash && (state == states.uppercut || state == states.stupidratjelly || state == states.Sjump))
    updash = 1;

if (squished && state != states.stupidratroll && state != states.stupidratstoproll && state != states.stupidratturnroll && state != states.normal && state != states.jump)
    squished = 0;

scr_playersounds();

if (grounded && state != states.handstandjump)
    suplexmove = 0;

if (state != states.freefall && state != states.superslam)
    freefallsmash = 0;

if (global.playerhealth <= 0 && state != states.gameover)
{
    image_index = 0;
    sprite_index = spr_deathstart;
    state = states.gameover;
}

if (state == states.gameover && y > (room_height * 1.5))
    vsp = 0;

if (!instance_exists(baddiegrabbedID) && (state == states.grab || state == states.superslam || state == states.tacklecharge))
    state = states.normal;

if (!(state == states.grab || state == states.superslam || state == states.mach2))
    baddiegrabbedID = 0;

if (grounded && place_meeting(x, y + 1, obj_newgrindrail) && !place_meeting(x, y + 1, obj_solid))
    state = states.grind;

if (anger == 0)
    angry = 0;

if (anger > 0)
{
    angry = 1;
    anger -= 1;
}

if (sprite_index == spr_player_winding && state != states.normal)
    windingAnim = 0;

if (state != states.grab)
    swingdingbuffer = 0;

if (sprite_index == spr_player_idlevomit && image_index > 28 && image_index < 43)
    instance_create(x + random_range(-5, obj_pause), y + 46, obj_vomit);

if (sprite_index == spr_player_idlevomitblood && image_index > 28 && image_index < 43)
{
    with (instance_create(x + random_range(-5, obj_pause), y + 46, obj_vomit))
        sprite_index = spr_vomit2;
}

if (global.playerhealth == 1 && !instance_exists(obj_sweat) && obj_player.state == states.normal)
    instance_create(x, y, obj_sweat);

if (angry == 1 && !instance_exists(obj_angrycloud) && obj_player.state == states.normal)
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
    
    if ((character == "N" && paletteselect == 6) && !global.lamepalettes)
        scr_soundeffect(sfx_bluu1);
}

if (killstillsuper >= 10)
{
    killstillsuper = 0;
    
    if (supertaunts <= 0)
        scr_soundeffect(sfx_supertauntready);
    
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

if (state == states.mach2 || state == states.tacklecharge || state == states.skateboard || state == states.knightpep || state == states.boxxedpep || state == states.cheesepep || state == states.knightpepslopes || state == states.knightpepattack || state == states.bombpep || state == states.facestomp || state == states.machfreefall || state == states.facestomp || state == states.machroll || state == states.mach3 || state == states.freefall || state == states.Sjump)
    attacking = 1;
else
    attacking = 0;

if (state == states.throwin || state == states.punch || state == states.backkick || state == states.shoulder || state == states.uppunch)
    grabbing = 1;
else
    grabbing = 0;

if (state == states.mach3 || state == states.mach2 || state == states.climbwall || state == states.freefall || state == states.tumble || state == states.fireass || state == states.firemouth || state == states.hookshot || state == states.skateboard || state == 34 || state == states.Sjump || state == states.machroll || state == states.machfreefall || state == states.tacklecharge || (state == states.superslam && sprite_index == spr_piledriver) || state == states.knightpep || state == states.knightpepattack || state == states.knightpepslopes || state == states.boxxedpep || state == states.cheesepep || state == states.cheeseball || state == states.breakdanceattack || state == states.stupidratcheeseslam || (state == states.uppercut && vsp <= 0) || state == states.kungfu || state == states.jetpack || state == states.wallbounce || state == states.Ncrusher || (state == states.NEWchainsaw && sprite_index == spr_player_chainsaw) || state == states.Nfork || state == states.playerpeppermanmach || state == states.playerpeppermangroundpound || state == states.crouchslide || state == states.snicktp || state == states.machslide)
    instakillmove = 1;
else
    instakillmove = 0;

if (flash == 1 && alarm[0] <= 0)
    alarm[0] = 0.15 * room_speed;

if (state != states.mach3 && state != states.machslide)
    autodash = 0;

if ((state != states.jump && state != states.crouchjump && state != states.slap) || vsp < 0)
    fallinganimation = 0;

if (state != states.freefallland && state != states.normal && state != states.machslide)
    facehurt = 0;

if (state != states.normal && state != states.machslide)
    machslideAnim = 0;

if (state != states.normal)
{
    idle = 0;
    dashdust = 0;
}

if (state != states.mach1 && state != states.jump && state != states.hookshot && state != states.handstandjump && state != states.normal && state != states.mach2 && state != states.mach3 && state != states.freefall && state != states.knightpep && state != states.shotgun && state != states.machroll && state != states.knightpepslopes)
    momemtum = 0;

if (state != states.Sjump && state != states.Sjumpprep)
    a = 0;

if (state != states.facestomp)
    facestompAnim = 0;

if (state != states.freefall && state != states.facestomp && state != states.superslam && state != states.freefallland)
    superslam = 0;

if (state != states.mach2)
    machpunchAnim = 0;

if (state != states.jump)
    ladderbuffer = 0;

if (state != states.jump)
    stompAnim = 0;

if ((state == states.mach3 || state == states.mach2 || state == states.climbwall || state == states.hookshot || state == states.tacklecharge || state == states.handstandjump || state == states.machslide || (state == states.freefall && freefallsmash > 10) || (state == states.jetpack && sprite_index != spr_playerN_noisebombspinjump) || state == states.Sjump) && !instance_exists(obj_mach3effect))
{
    toomuchalarm1 = 6;
    instance_create(x, y, obj_mach3effect);
}

if (toomuchalarm1 > 0)
{
    toomuchalarm1 -= 1;
    
    if (toomuchalarm1 <= 0 && (state == states.mach3 || state == states.climbwall || state == states.hookshot || state == states.mach2 || state == states.tacklecharge || state == states.machslide || (state == states.freefall && freefallsmash > 10) || state == states.handstandjump || (state == states.chainsaw && mach2 >= 100) || state == states.Sjump || (state == states.jetpack && sprite_index != spr_playerN_noisebombspinjump)))
    {
        instance_create(x, y, obj_mach3effect);
        toomuchalarm1 = 6;
    }
}

if (y < -800)
{
    x = roomstartx;
    y = -500;
    state = states.freefall;
    vsp = 10;
}

if (character == "S")
{
    if (state == states.crouchjump || state == states.crouch)
        state = states.normal;
}

var k = 0;

if (state == states.jetpack && sprite_index == spr_playerN_jetpackslide)
    k = 1;

if (character != "S" && !place_meeting(x, y, obj_solid))
{
    if (state != states.bump && !squished && sprite_index != spr_bombpepintro && sprite_index != spr_knightpepthunder && state != states.tumble && state != states.fireass && state != states.crouch && state != states.boxxedpep && state != states.pistol && sprite_index != spr_player_crouchshoot && state != states.Sjumpprep && state != states.chainsaw && state != states.machroll && state != states.hurt && state != states.crouchslide && state != states.crouchjump && character != "TERRENCE" && !k)
        mask_index = spr_player_mask;
    else
        mask_index = spr_crouchmask;
}
else if (place_meeting(x, y, obj_solid))
{
    mask_index = spr_crouchmask;
}

if (character == "S" && state == states.bombpep)
    mask_index = spr_player_mask;
else if (character == "S")
    mask_index = spr_crouchmask;

if (state == states.gottreasure || sprite_index == spr_knightpep_start || sprite_index == spr_knightpep_thunder || state == states.keyget || state == states.door || state == states.ejected || state == states.victory || state == states.comingoutdoor || state == states.gameover)
    cutscene = 1;
else
    cutscene = 0;

if (cutscene)
    global.combopause = 5;

var g = 1;

with (instance_place(x, y, obj_snick))
    g = visible;

if ((place_meeting(x, y, obj_door) || place_meeting(x, y, obj_boss_giantkey) || (place_meeting(x, y, obj_snick) && g) || place_meeting(x, y, obj_keydoor) || (place_meeting(x, y, obj_exitgate) && global.panic == 1)) && !instance_exists(obj_uparrow) && scr_solid(x, y + 1) && state == states.normal)
    instance_create(x, y, obj_uparrow);

scr_collide_destructibles();

if (state != states.titlescreen && state != states.door && state != states.Sjump && state != states.ejected && state != states.comingoutdoor && state != states.boulder && state != states.keyget && state != states.victory && state != states.portal && state != states.timesup && state != states.gottreasure && state != states.gameover)
    scr_collide_player();

if (state == states.boulder)
    scr_collide_player();

if ((global.deathmode && !instance_exists(obj_sigmaface)) && !instance_exists(obj_gameoverrestart))
{
    with (instance_create(x, y, obj_sigmaface))
    {
        if (room == ruin_11 && other.targetDoor == "C")
            y = 528;
    }
}

afterimage--;
blur--;

if (state == states.punch || state == states.breakdanceattack || state == states.uppercut || state == states.kungfu || state == states.wallbounce || (state == states.jetpack && sprite_index == spr_playerN_noisebombspinjump))
{
    if (afterimage <= 0)
    {
        with (instance_create(x, y, obj_afterimog))
        {
            image_index = other.image_index;
            sprite_index = other.sprite_index;
            ini_open("SGOUTDATA new.ini");
            image_blend = make_color_rgb(ini_read_real("afterimages", "pepattack R", 1), ini_read_real("afterimages", "pepattack G", 1), ini_read_real("afterimages", "pepattack B", 1));
            
            if (other.character == "N")
                image_blend = make_color_rgb(ini_read_real("afterimages", "Nattack R", 1), ini_read_real("afterimages", "Nattack G", 1), ini_read_real("afterimages", "Nattack B", 1));
            
            ini_close();
            image_xscale = other.xscale;
            spr_palette = other.spr_palette;
            paletteselect = other.paletteselect;
        }
        
        if (state == states.wallbounce)
            instance_create(x, y, obj_noisetornadoeffect);
        
        if ((state == states.uppercut && character == "N" && vsp < 0) || (character == "P" && state == states.punch))
        {
            with (instance_create(x, y, obj_bangeffect))
            {
                sprite_index = spr_shineeffect;
                image_speed = 0.35;
            }
        }
        
        afterimage = 5;
    }
}

if (state == states.machroll || state == states.Ncrusher || state == states.snickclimbdown || state == states.freefall || (state == states.mach3 && sprite_index == spr_crazyrun) || state == states.crouchslide || state == states.Nfork)
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
            blurtastic = 1;
        }
        
        blur = 2;
    }
}

if (((state == states.normal || state == states.jump || state == states.mach1 || state == states.mach2 || state == states.mach3 || state == states.stupidratroll || state == states.stupidratstoproll || state == states.crouchslide || state == states.stupidratturnroll || state == states.jetpack) && !squished) || state == states.machroll || state == states.uppercut || (state == states.kungfu && sprite_index == spr_player_kungfujump))
{
    scr_taunt();
    
    if (character == "R" && key_punch2 && enemiesswallowed > 1)
    {
        if (move != 0 && state == states.kungfu)
            xscale = move;
        
        if (enemiesswallowed > 100)
            enemiesswallowed = 100;
        
        repeat (enemiesswallowed * 2)
        {
            sprite_index = choose(spr_player_suplexmash1, spr_player_suplexmash2, spr_player_suplexmash3, spr_player_suplexmash4, spr_player_suplexmash5, spr_player_suplexmash6, spr_player_suplexmash7);
            state = states.tackle;
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
        state = states.finishingblow;
        sprite_index = spr_stupidrat_spit;
        movespeed = -5;
    }
    
    if (state != states.uppercut)
    {
        if (!global.gotsaw)
        {
            var bombie = 0;
            
            if (character == "N" && instance_exists(obj_bosscontrol))
                bombie = 1;
            
            if (key_slap2 && character != "S" && !(shotgunAnim == 1))
            {
                if (move != 0 && state == states.kungfu)
                    xscale = move;
                
                if (!bombie)
                {
                    if (!key_up)
                        instance_create(x, y, obj_jumpdust);
                    
                    suplexmove = 1;
                    scr_soundeffect(sfx_suplexdash);
                    state = states.handstandjump;
                    image_index = 0;
                    
                    if (shotgunAnim == 0)
                        sprite_index = spr_suplexdash;
                    else
                        sprite_index = spr_shotgun_suplexdash;
                    
                    if (character == "R")
                        sprite_index = spr_stupidrat_eat;
                    
                    if (movespeed < 11)
                        movespeed = 11;
                    
                    if (character == "V")
                    {
                        if (!key_up)
                        {
                            with (instance_create(x, y, obj_shotgunbullet))
                            {
                                spd = other.xscale * 25;
                                phasing = 1;
                            }
                            
                            with (instance_create(x, y, obj_bangeffect))
                                sprite_index = spr_pistoleffect;
                            
                            if (!grounded)
                                vsp = -5;
                        }
                    }
                }
                else
                {
                    if (!key_up)
                        instance_create(x, y, obj_jumpdust);
                    
                    state = states.noisebomb;
                    sprite_index = spr_playerN_noisebombkick;
                    image_index = 0;
                }
            }
            
            if (key_slap2 && character != "S" && character != "TERRENCE" && shotgunAnim == 1)
            {
                if (move != 0 && state == states.kungfu)
                    xscale = move;
                
                if (!key_up)
                    instance_create(x, y, obj_jumpdust);
                
                scr_soundeffect(sfx_killingblow);
                state = states.shotgun;
                
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
            
            if (key_slap2 && character == "S" && character != "TERRENCE")
            {
                scr_soundeffect(choose(sfx_snickglitchnew, sfx_snickglitchnew2, sfx_snickglitchnew3, sfx_snickglitchnew4));
                
                if (move != 0 && state == states.kungfu)
                    xscale = move;
                
                if (!key_up)
                    instance_create(x, y, obj_jumpdust);
                
                if (movespeed < 12)
                    movespeed = 12;
                
                tauntstoredvsp = hsp;
                tauntstoredhsp = vsp;
                hsp = 0;
                vsp = 0;
                tpcd = 0;
                tph = 60 * xscale;
                tpv = 0;
                tptimes = 4;
                tauntstoredstate = state;
                tauntstoredsprite = sprite_index;
                tauntstoredmovespeed = movespeed + 4;
                sprite_index = spr_secondjump2;
                
                if (key_down)
                {
                    tph = 0;
                    tpv = 60;
                }
                
                state = states.snicktp;
            }
        }
        else if (key_slap2 && character != "S" && character != "TERRENCE")
        {
            suplexmove = 1;
            
            if (move != 0 && state == states.kungfu)
                xscale = move;
            
            if (!key_up)
                instance_create(x, y, obj_jumpdust);
            
            scr_soundeffect(sfx_chainsawstart);
            state = states.NEWchainsaw;
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
            state = states.stupidratjelly;
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
                state = states.uppercut;
                sprite_index = spr_uppercut1;
                vsp = -15;
                instance_create(x, y, obj_highjumpcloud2);
                
                if (character == "N")
                {
                    vsp = -20;
                    
                    repeat (5)
                    {
                        with (instance_create(random_range(x - 20, x + 20), random_range(y - 20, y + 20), obj_bangeffect))
                        {
                            sprite_index = spr_shineeffect;
                            image_speed = 0.35;
                        }
                    }
                }
                
                dir = xscale;
                
                if (audio_is_playing(sfx_chainsawstart))
                    audio_stop_sound(sfx_chainsawstart);
                
                scr_soundeffect(sfx_uppercut);
                
                if (character == "S")
                {
                    hsp = 0;
                    tauntstoredvsp = hsp;
                    tauntstoredhsp = vsp;
                    hsp = 0;
                    vsp = 0;
                    tpcd = 0;
                    tph = 0;
                    tpv = -60;
                    tptimes = 4;
                    tauntstoredstate = state;
                    tauntstoredsprite = sprite_index;
                    tauntstoredmovespeed = movespeed + 4;
                    state = states.snicktp;
                }
            }
            else
            {
                scr_soundeffect(sfx_killingblow);
                image_index = 0;
                state = states.freefall;
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
    }
    
    scr_playeraltattacks();
}

if (state == states.wallbounce || state == states.Ncrusher || (state == states.jetpack && sprite_index == spr_playerN_noisebombspinjump))
{
    if (key_slap2 && key_up && character != "R" && character != "TERRENCE")
    {
        if (!shotgunAnim)
        {
            state = states.uppercut;
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
            state = states.freefall;
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

if (state == states.normal || state == states.jump || state == states.mach1 || state == states.mach2 || state == states.mach3 || state == states.stupidratroll || state == states.stupidratstoproll || state == states.stupidratturnroll || state == states.wallbounce || state == states.Ncrusher || state == states.Nfork || state == states.jetpack)
    scr_taunt();

if (superdown > 0)
    superdown--;

superframe += 0.5;

if (superframe > 10)
    superframe = 0;

if (y > (room_height * 2))
{
    y = roomstarty;
    x = roomstartx;
    scr_soundeffect(sfx_boowomp);
    
    with (obj_tv)
    {
        message = "SHAME ON YOU";
        showtext = 1;
        alarm[0] = 200;
    }
}

if (global.hallucination > 0 && hallucinationtimer <= -1)
    hallucinationtimer = 1;

if (global.hallucination <= 0 && hallucinationtimer > 0)
    hallucinationtimer = -1;

if (hallucinationtimer > 0)
    hallucinationtimer--;

if (hallucinationtimer <= 0 && global.hallucination > 0)
{
    with (instance_create(x + 960, y, obj_hallucination))
    {
        if (x != obj_player1.x)
            image_xscale = -sign(x - obj_player1.x);
        
        hspeed = 8 * image_xscale;
        thing = 100;
    }
    
    hallucinationtimer = random_range(300, 500) / global.hallucination;
    scr_soundeffect(sfx_enemyprojectile);
}
