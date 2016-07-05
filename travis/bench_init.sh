#!/bin/bash

cd ~/
curl -I https://gitlab.com/modernmachines/frappe-mirror/tree/$TRAVIS_BRANCH | head -n 1 | cut -d $' ' -f2 | (
	read response;
	[ $response == '200' ] && branch=$TRAVIS_BRANCH || branch='develop';
	bench init frappe-bench --frappe-path https://gitlab.com/modernmachines/frappe-mirror.git --frappe-branch $branch
)
