#!/usr/bin/expect

#Usage <ip> <user> <pass>

set timeout 60

spawn ssh [lindex $argv 1]@[lindex $argv 0]

expect "yes/no" {
        send "yes\r"
        expect "*?assword" { send "[lindex $argv 2]\r" }
		        } "*?assword" { send "[lindex $argv 2]\r" }


expect "*hpiLO-> " { send "[lindex $argv 3]\r" } >> /tmp/ILO.log
#expect "*hpiLO-> " { send "show /system1/log1\r" } >> /tmp/ILO.log
#expect "# " { send "scope log\r" }
#expect "# " { send "show entries\r" }
 expect {
    -ex "--More--" { send "\r"; exp_continue }
    "*hpiLO-> " { send "exit\r" }
}
#expect "# " { send "exit\r" }
#expect "# " { send "exit\r" }
expect "*hpiLO-> " { send "exit\r" }
# interact

