#!/usr/bin/expect
set file [lindex $argv 0]
set line [lindex $argv 1]
set watch [lindex $argv 2]
spawn node debug localhost:5858
set timeout 1
expect "NO EXPECT" {exit 0} timeout {
    send "watch('$watch')\r"
    send "setBreakpoint(\"$file\", $line)\r"
    send "c\r"
    interact
}
#send "c\r"

