#!/usr/bin

expect -c "
spawn sh /tmp/setup.sh
expect \\\"Do you want to proceed with the installation? [default: yes] \\\"
send \\\"yes\n\\\"
"
