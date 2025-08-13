function scr_playerreset()
{
	if (instance_exists(obj_endlevelfade))
	    instance_destroy(obj_endlevelfade);
	
	if (instance_exists(obj_itspizzatime))
	    instance_destroy(obj_itspizzatime);
	
	global.uniquecollects = 0;
	global.hasthetreasure = 0;
	global.draintime = 0;
	global.timeractive = 0;
	global.wave = 0;
	global.prank = 0;
	global.maxwave = 0;
	global.secretfound = 0;
	global.supersecretsfound = 0;
	global.hurtcounter = 0;
	global.snickchallenge = 0;
	global.lowgrav = 0;
	global.gotsaw = 0;
	
	with (obj_camera)
	{
	    zooming = 0;
	    zoomto = 1;
	    n = 0;
	    lerpH = 0;
	    zoom = 0.25;
	    zoomF = 1;
	    zoomer = 0;
	    mouseW = 0;
	    alarm[1] = 60;
	}
	
	if (instance_exists(obj_littlenoisegremlin))
	    instance_destroy(obj_littlenoisegremlin);
	
	if (instance_exists(obj_snickexe))
	    instance_destroy(obj_snickexe);
	
	with (obj_tv)
	{
	    shownranka = 0;
	    shownrankb = 0;
	    shownrankc = 0;
	}
	
	global.SAGEshotgunsnicknumber = 0;
	obj_music.fadeoff = 0;
	
	if (instance_exists(obj_timesup))
	    instance_destroy(obj_timesup);
	
	global.seconds = 59;
	global.minutes = 1;
	obj_player.state = states.normal;
	obj_player.visible = true;
	ds_list_clear(global.saveroom);
	ds_list_clear(global.baddieroom);
	
	with (obj_player1)
	{
	    yscale = 1;
	    xscaleplus = 0;
	    yscaleplus = 0;
	    image_yscale = 1;
	    image_xscale = 1;
	    alarm[0] = -1;
	    alarm[1] = -1;
	    alarm[3] = -1;
	    alarm[4] = -1;
	    alarm[5] = -1;
	    alarm[6] = -1;
	    alarm[7] = -1;
	    alarm[8] = -1;
	    alarm[9] = -1;
	    alarm[10] = -1;
	    alarm[11] = -1;
	    pepperplay = 0;
	    killstillsuper = 0;
	    supertaunts = 1;
	    enemiesswallowed = 0;
	    squished = 0;
	    grav = 0.5;
	    hsp = 0;
	    vsp = 0;
	    global.playerhealth = 5;
	    xscale = 1;
	    yscale = 1;
	    x = backtohubstartx;
	    y = backtohubstarty;
	    backupweapon = 0;
	    shotgunAnim = 0;
	    box = 0;
	    steppy = 0;
	    movespeedmax = 5;
	    jumpstop = 0;
	    start_running = 1;
	    obj_camera.ded = 0;
	    visible = true;
	    global.panic = 0;
	    turn = 0;
	    jumpAnim = 1;
	    dashAnim = 1;
	    landAnim = 0;
	    machslideAnim = 0;
	    moveAnim = 1;
	    stopAnim = 1;
	    crouchslideAnim = 1;
	    crouchAnim = 1;
	    machhitAnim = 0;
	    stompAnim = 0;
	    inv_frames = 0;
	    turning = 0;
	    hurtbounce = 0;
	    hurted = 0;
	    autodash = 0;
	    mach2 = 0;
	    input_buffer_jump = 8;
	    input_buffer_secondjump = 8;
	    input_buffer_highjump = 8;
	    flash = 0;
	    global.key_inv = 0;
	    global.shroomfollow = 0;
	    global.cheesefollow = 0;
	    global.tomatofollow = 0;
	    global.sausagefollow = 0;
	    global.pineapplefollow = 0;
	    global.keyget = 0;
	    global.collect = 0;
	    global.ammo = 0;
	    global.treasure = 0;
	    global.combo = 0;
	    global.combotime = 0;
	    global.combopause = 0;
	    global.combodropped = 0;
	    global.pizzacoin = 0;
	    global.toppintotal = 1;
	    global.hit = 0;
	    ini_open("SGOUTsaveData.ini");
	    global.SAGEshotgunsnick = ini_read_string("SAGE2019", "shotgunsnick", 0);
	    global.SAGEshotgunsnicknumber = 0;
	    global.SAGEdungeonbackup = ini_read_string("SAGE2019", "dungeonbackup", 0);
	    global.SAGEsrank = ini_read_string("SAGE2019", "srank", 0);
	    global.SAGEsnicksrank = ini_read_string("SAGE2019", "snicksrank", 0);
	    global.SAGEcombo10 = ini_read_string("SAGE2019", "combo10", 0);
	    global.SAGEsecret = ini_read_string("SAGE2019", "secret", 0);
	    global.SAGEknight = ini_read_string("SAGE2019", "knight", 0);
	    global.SAGEknighttaken = 0;
	    global.SAGEtoppin = ini_read_string("SAGE2019", "toppin", 0);
	    global.SAGEtreasure = ini_read_string("SAGE2019", "treasure", 0);
	    ini_close();
	    in_water = 0;
	    key_particles = 0;
	    barrel = 0;
	    bounce = 0;
	    a = 0;
	    idle = 0;
	    attacking = 0;
	    slamming = 0;
	    superslam = 0;
	    machpunchAnim = 0;
	    punch = 0;
	    machfreefall = 0;
	    shoot = 1;
	    instakillmove = 0;
	    windingAnim = 0;
	    facestompAnim = 0;
	    ladderbuffer = 0;
	    chainsaw = 50;
	    toomuchalarm1 = 0;
	    toomuchalarm2 = 0;
	    dashdust = 0;
	    throwforce = 0;
	    hurtsound = sfx_jump;
	    idleanim = 0;
	    momemtum = 0;
	    cutscene = 0;
	    grabbing = 0;
	    dir = xscale;
	    goingdownslope = 0;
	    goingupslope = 0;
	    fallinganimation = 0;
	    bombpeptimer = 100;
	    slapbuffer = 0;
	    slaphand = 1;
	    suplexmove = 0;
	    suplexhavetomash = 0;
	    timeuntilhpback = 300;
	    anger = 0;
	    angry = 0;
	    ervilvariable = 0;
	}
}
