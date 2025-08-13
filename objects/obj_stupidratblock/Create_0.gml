image_speed = 0.5;
deadspr = spr_ratblock_dead;

if (object_index != obj_ratblock2x2)
    sprite_index = choose(spr_ratblock, spr_ratblock1, spr_ratblock2, spr_ratblock3, spr_ratblock4, spr_ratblock5);

switch (sprite_index)
{
    case spr_ratblock1:
        deadspr = spr_ratblock1_dead;
        break;
    
    case spr_ratblock2:
        deadspr = spr_ratblock2_dead;
        break;
    
    case spr_ratblock3:
        deadspr = spr_ratblock3_dead;
        break;
    
    case spr_ratblock4:
        deadspr = spr_ratblock4_dead;
        break;
    
    case spr_ratblock5:
        deadspr = spr_ratblock5_dead;
        break;
    
    case spr_ratblock2x2:
        deadspr = spr_ratblock2x2die;
        break;
}

bomb = 0;
