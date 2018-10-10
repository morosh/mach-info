#!/bin/sh

if [ -e "./shell-utils" ]; then
	. ./shell-utils/console.sh
else
log () {
	echo "[LOG] $1"
}
fi

hostname=`hostname`
log_path="${hostname}"

init () {
	mkdir $log_path
}

run () {
	cpu
	ram
	disk
	network
	etc
}

cpu () {
	log "cpuinfo"
	cat /proc/cpuinfo > $log_path/cpuinfo.txt
}

ram () {
	log "free"
	free -h > $log_path/free.txt
}

disk () {
	log "df"
	df -h > $log_path/df.txt
}

network () {
	log "ip"
	ip a > $log_path/ip.txt

	log "hostname -i"
	hostname -i > $log_path/hostname_i.txt
}

etc () {
	log "hostname"
	hostname > $log_path/hostname.txt

	log "date"
	date > $log_path/date.txt

	log  "ps"
	ps aux > $log_path/ps.txt

	log "pstree"
	pstree > $log_path/pstree.txt

	log "dmesg"
	dmesg > $log_path/dmesg.txt

	log "whoami"
	whoami > $log_path/whoami.txt

	log "uname"
	uname -a > $log_path/uname.txt
}

init
run

