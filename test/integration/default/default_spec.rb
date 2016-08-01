# coding: utf-8

control 'test-group' do
  impact 0.1
  title 'Check if `tomcat` group exists'
  describe group('tomcat') do
    it { should exist }
  end
end

control 'test-user' do
  impact 0.2
  title 'Check if `tomcat` user has been setup correctly'
  describe user('tomcat') do
    it { should exist }
    its('group') { should eq 'tomcat' }
    its('home') { should eq '/opt/tomcat' }
    its('shell') { should eq '/bin/nologin' }
  end
end

control 'test-jdk' do
  impact 0.5
  title 'Check installed JDK version'
  describe package('java-1.8.0-openjdk-devel') do
    it { should be_installed }
    its('version') { should match (/^1.8.0.101/) }
  end
end

control 'test-tomcat' do
  impact 0.5
  title 'Check installed Apache Tomcat version'
  describe package('tomcat') do
    it { should be_installed }
    its('version') { should match (/^7.0.54/) }
  end
end
