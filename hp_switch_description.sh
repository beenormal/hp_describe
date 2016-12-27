#!/usr/bin/expect
#
# Example: 	> hp_switch_connect {HOST} {USERNAME} {PASSWORD} {PORT}
#			> hp_switch_connect 192.168.10.123 admin password 12 | grep Description


set timeout 2

# Get variables from commandline arguments
set name [lindex $argv 0]
set user [lindex $argv 1]
set password [lindex $argv 2]
set port [lindex $argv 3]
set desc [lindex $argv 4]

spawn telnet $name 

# Authentication
expect "Username:" 
send "$user\r\n"
expect "Password:"
send "$password\r\n"

# Display information about port given from the command line


send "_cmdline-mode on\r\n"
send "Y\r\n"
send "512900\r\n"
send "pwd\r\n"

send "system-view\r\n"


send "interface GigabitEthernet 1/0/$port\r\n"
send "description $desc\r\n"
send "quit\r\nquit\r\nquit\r\n"

interact