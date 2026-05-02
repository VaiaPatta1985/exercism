#!/usr/bin/env tclsh

proc isLeapYear {year} {
    set result [expr {$year % 400}]
    if {$result == 0} {return true}
    set result [expr {$year % 100}]
    if {$result == 0} {return false}
    set result [expr {$year % 4}]
    if {$result == 0} {return true}
    return false
}
