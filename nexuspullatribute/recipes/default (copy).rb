#
# Cookbook Name:: learn_chef_apache2
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


remote_file '/var/lib/tomcat7/webapps/sample.jar' do
  source 'https://artifacts.alfresco.com/nexus/content/groups/public/ORG/springframework/spring-context/4.1.7.RELEASE/spring-context-4.1.7.RELEASE.jar'
end

execute "Create-Folders" do
  command     "cat > sample"
end

execute "unzipping-package-/var/lib/tomcat7/webapps/sample" do
  command     "unzip -q -u -o  /var/lib/tomcat7/webapps/sample.jar -d /var/lib/tomcat7/webapps/sample"
end

execute "Start-tomcat" do
  command     "sudo /etc/init.d/tomcat7 restart"
end


