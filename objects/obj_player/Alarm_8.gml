if (state == states.hurt)
{
    state = 0;
    
    if (pepperplay)
        state = states.playerpeppermanidle;
    
    movespeed = 0;
}
