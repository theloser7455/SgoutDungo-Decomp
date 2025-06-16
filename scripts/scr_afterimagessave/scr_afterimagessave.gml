function scr_afterimagessave()
{
	ini_write_real("afterimages", "mach1 R", 255);
	ini_write_real("afterimages", "mach1 G", 0);
	ini_write_real("afterimages", "mach1 B", 0);
	ini_write_real("afterimages", "mach2 R", 0);
	ini_write_real("afterimages", "mach2 G", 255);
	ini_write_real("afterimages", "mach2 B", 0);
	ini_write_real("afterimages", "pepattack R", 0);
	ini_write_real("afterimages", "pepattack G", 255);
	ini_write_real("afterimages", "pepattack B", 255);
	ini_write_real("afterimages", "Nattack R", 248);
	ini_write_real("afterimages", "Nattack G", 224);
	ini_write_real("afterimages", "Nattack B", 128);
}
