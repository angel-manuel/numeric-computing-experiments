# -*- coding: utf-8 -*-
"""
Created on Sun Jan 18 11:14:01 2015

@author: arturo
"""

def century_inter(century):
    return str(century*100) + "-" + str(century*100+99)
    
def date_to_str(day, month, year):
    return reduce(lambda a, b: a+'/'+b, map(str, [month, day, year]))
    
def leap_year(year):
    if year % 4 == 0:
        if year % 100 == 0:
            return year % 400 == 0
        else:
            return True
    else:
        return False

def doomsday_rule(day, month, year):
    day_week = ("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")    
    
    century = year/100;
    print str(year) + " is on " + century_inter(century)
    if century < 18 or century > 21:
        eq_century = ((century - 2) % 4) + 19
        print century_inter(century) + " is equivalent to " + century_inter(eq_century)
        century = eq_century
    
    if century == 18:
        anchor = 5        
        print century_inter(century) + " has anchor on Friday"
    elif century == 19:
        anchor = 3
        print century_inter(century) + " has anchor on Wednesday(We-in-dis-day, as most people were born here)"
    elif century == 20:
        anchor = 2
        print century_inter(century) + " has anchor on Tuesday(Two-day 2-day as this is the 2K century)"
    elif century == 21:
        anchor = 0
        print century_inter(century) + " has anchor on Sunday(0-day, the future guys!!)"
    else:
        print century_inter(century) + " ???"
        return -1
        
    print "anchor = " + str(anchor)
    
    intra_year = year % 100
    print "Last two digits are " + str(intra_year)    
    
    displacement = intra_year + intra_year % 4
    print "displacement = " + str(intra_year) + " + " + str(intra_year) + " % 4 = " + str(displacement)

    doomsday = (anchor + displacement) % 7
    print "doomsday = (anchor + displacement) mod 7 = " + str(doomsday) + " = " + day_week[doomsday]
   
    if month==1:
        if leap_year(year):
            print str(year) + " is a leap year"
            print "1/4 is doomsday on leap years"
            displacement = (day - 4) % 7
            ret = (displacement + doomsday) % 7
        else:
            print str(year) + " is a common year"
            print "1/3 is doomsday on common years"
            displacement = (day - 3) % 7
            ret = (displacement + doomsday) % 7
    elif month==2:
        print "Last day of February is doomsday"
        if leap_year(year):
            print str(year) + " is a leap year"
            print "2/29 is doomsday on leap years"
            displacement = (day - 29) % 7
            ret = (displacement + doomsday) % 7
        else:
            print str(year) + " is a common year"
            print "2/28 is doomsday on common years"
            displacement = (day - 28) % 7
            ret = (displacement + doomsday) % 7
    elif month==3:
        print "Pi day (3/14) is a doomsday"
        displacement = (day - 14) % 7
        ret = (displacement + doomsday) % 7
    elif month==4:
        print "4/4 is a doomsday"
        displacement = (day - 4) % 7
        ret = (displacement + doomsday) % 7
    elif month==5:
        print "5/9 is a doomsday"
        displacement = (day - 9) % 7
        ret = (displacement + doomsday) % 7
    elif month==6:
        print "6/6 is a doomsday"
        displacement = (day - 6) % 7
        ret = (displacement + doomsday) % 7
    elif month==7:
        print "7/11 is a doomsday"
        displacement = (day - 11) % 7
        ret = (displacement + doomsday) % 7
    elif month==8:
        print "8/8 is a doomsday"
        displacement = (day - 8) % 7
        ret = (displacement + doomsday) % 7
    elif month==9:
        print "9/5 is a doomsday"
        displacement = (day - 5) % 7
        ret = (displacement + doomsday) % 7
    elif month==10:
        print "10/10 is a doomsday"
        displacement = (day - 10) % 7
        ret = (displacement + doomsday) % 7
    elif month==11:
        print "11/7 is a doomsday"
        displacement = (day - 7) % 7
        ret = (displacement + doomsday) % 7
    elif month==12:
        print "12/12 is a doomsday"
        displacement = (day - 12) % 7
        ret = (displacement + doomsday) % 7
    else:
        print "WTF!!!!?!"
        return -1
    
    print date_to_str(day, month, year) + " is a " + day_week[ret]
    return ret
    
def bicond(cond, a, b):
    if(cond):
        return a
    else:
        return b
        
def growstr(s, tam):
    return (tam-len(s))*" " + s
    
def print_month(month, year):
    #month_len = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31, 29]
    first_day = doomsday_rule(1, month, year)
    #start_displacement = (first_day + 6) % 7
    print "Mon Tue Wed Thu Fri Sat Sun"
    print reduce(lambda x,y: x + " " + y, map(lambda x: bicond(x>0, growstr(str(x), 3), "---") ,map(lambda x: x + 1 - first_day, range(1, 8))))
    