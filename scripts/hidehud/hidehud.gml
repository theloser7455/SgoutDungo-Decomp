function hidehud()
{
	var roomname = room_get_name(room);
	
	if (room == Titlescreen || room == hub_room1 || room == cowboytask || room == Scootertransition || instance_exists(obj_strongbaddie) || room == rm_contentunlocked || string_letters(roomname) == "PProom" || string_letters(roomname) == "PProom")
	    exit;
}
