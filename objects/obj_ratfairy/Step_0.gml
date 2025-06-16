switch (state)
{
    case "follow":
        x = lerp(x, obj_player.x + 100, 0.25);
        y = lerp(y, obj_player.y - 50, 0.25);
        break;
    
    case "goaway":
        x += t;
        y -= tt;
        t += spr_cheeseblob;
        tt += 0.5;
        break;
    
    default:
        break;
}

with (instance_place(x, y, obj_player))
{
    if (other.state != "follow" && other.state != "goaway")
    {
        other.state = "follow";
        other.alarm[0] = 10;
    }
}
