#!/bin/bash

function build_inc {
	a=$(sed -n '/build/p' config/rspec2db.yml)
	echo $a
	b=${a:9} 
	b=${b//\"}
	IFS="." read -a ver <<< "$b"

	let ver[2]++
	if [  "${ver[2]}" -gt  9  ]; then
		ver[2]=0
		let ver[1]++
	fi

	if [  "${ver[1]}" -gt  9  ]; then
		ver[1]=0
		let ver[0]++
	fi


	s="  build: \"${ver[0]}.${ver[1]}.${ver[2]}\""
	sed -i "s/.*build.*/$s/" config/rspec2db.yml
	a=$(sed -n '/build/p' config/rspec2db.yml)
	echo $a
}


build_inc