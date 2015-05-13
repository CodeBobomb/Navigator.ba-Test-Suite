#!/bin/bash

function suite_change {
	a=$(sed -n '/suite/p' config/rspec2db.yml)
	ouput="  suite: \"$*\""
	sed -i "s/.*suite.*/$ouput/" config/rspec2db.yml
}

suite_change $1