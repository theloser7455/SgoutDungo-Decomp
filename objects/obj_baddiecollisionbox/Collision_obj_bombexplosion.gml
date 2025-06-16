if (instance_exists(baddieID))
{
    with (baddieID)
    {
        if (state != 107)
        {
            state = 104;
            stunned = 100;
            vsp = -5;
        }
    }
}
