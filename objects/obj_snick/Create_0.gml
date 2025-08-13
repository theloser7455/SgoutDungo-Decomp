image_speed = 0.35;
dialogue = 0;
talkingsound = sfx_snicktalk;

if (object_index == obj_difficulty_change_explainer || object_index == obj_tutorialdummy)
{
    if (object_index == obj_difficulty_change_explainer)
        visible = false;
    
    talkingsound = sfx_LEGALtalk;
}

if (object_index == obj_selfinsert)
    talkingsound = sfx_selfinserttalk;
