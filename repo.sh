#!/bin/bash

#BaseOS and AppStream Repo Configuration

ansible all -m yum_repository -a "name=BaseOS description='BaseOS Repo' baseurl=http://10.1.14.36/RHEL9/BaseOS gpgcheck=false \
	enabled=true" -b

ansible all -m yum_repository -a "name=AppStream description='AppStream Repo' baseurl=http://10.1.14.36/RHEL9/AppStream \ 
	gpgcheck=false enabled=true" -b

#Clearing Cache
ansible all -m command -a "dnf clean all" -b

#Listing Installed Repos
ansible all -m command -a "dnf repolist" -b
