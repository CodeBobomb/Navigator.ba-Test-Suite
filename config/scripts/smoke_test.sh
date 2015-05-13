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
nohup node . &
sleep 10
cd $WORKSPACE
bundle install

bash config/scripts/build_inc.sh #increments the build of the test
bash config/scripts/suite_change.sh "navigator smoke test" #changes the suite name

bundle exec rspec spec/smoke_test
status=$?
quit_process [a]ppium_test
quit_process [n]ode
exit $status

