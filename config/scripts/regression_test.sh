#!/bin/bash

quit_process() {
	pid=$(ps -ef | grep $1)
    if [[ -n $pid ]]; then
    	return 0
    fi
	IFS=' ' read -a array <<< "$pid"
	process=${array[1]}
	kill -9 $process
}


cd /home/adnan/appium
node . &
sleep 10
cd $WORKSPACE
bash config/scripts/suite_change.sh "navigator regression test" #changes the name of the suite

bundle exec rspec spec/regression_test
status=$?
quit_process [a]ppium_test
quit_process [n]ode

bash config/scripts/suite_change.sh "default" #returns the suite name to 'default'

exit $status
