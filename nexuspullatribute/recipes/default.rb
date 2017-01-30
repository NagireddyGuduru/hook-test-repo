#
# Cookbook Name:: learn_chef_apache2
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


#remote_file '/var/lib/tomcat7/webapps/sample.jar' do
#  source 'https://artifacts.alfresco.com/nexus/content/groups/public/ORG/springframework/spring-context/4.1.7.RELEASE/spring-context-4.1.7.RELEASE.jar'
#end

remote_file '/home/vagrant/Nexusfiles/Realtime.war' do
  source 'http://172.20.64.99:8085/nexus/service/local/artifact/maven/redirect?r=snapshots&g=com.aig.dmp&a=global-ims-ui&v=LATEST&e=war'
end

execute "unzipping-package-/home/vagrant/Nexusfiles/" do
  command     "unzip -q -u -o  /home/vagrant/Nexusfiles/Realtime.war -d /home/vagrant/Nexusfiles/Realtime"
end 

execute "Copying and checking in cookbooks to chef server" do
command     "sshpass -p root scp -v -r -o StrictHostKeyChecking=no /home/vagrant/Nexusfiles/Realtime/cookbook/Deployapp root@172.16.151.194:/home/ubuntu/chef-repo/cookbooks/"
end


