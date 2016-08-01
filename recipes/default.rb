#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package 'java-1.8.0-openjdk-devel'

package 'tomcat'

group 'tomcat'

user 'tomcat' do
  group 'tomcat'
  home '/opt/tomcat'
  manage_home false
  shell '/bin/nologin'
end
