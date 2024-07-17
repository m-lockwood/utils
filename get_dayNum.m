function dayNum = get_dayNum(dateStr)    
    dayNum = datenum(dateStr, 'yyyy-mm-dd');
    dayNum = dayNum-dayNum(1);
end