if (state == "follow" && collect > 0)
{
    repeat (collect)
    {
        global.collect += 10;
        
        if ((global.combotime + 10) > 100)
            global.combotime = 100;
        else
            global.combotime += 10;
    }
    
    instance_destroy();
}
