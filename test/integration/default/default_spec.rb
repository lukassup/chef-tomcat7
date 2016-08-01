# coding: utf-8

control 'test-group' do
  impact 0.1
  title 'Check if `tomcat` group exists'
  describe group('tomcat') do
    it { should exist }
  end
end

control 'test-user' do
  impact 0.1
  title 'Check if `tomcat` user has been setup correctly'
  describe user('tomcat') do
    it { should exist }
    its('group') { should eq 'tomcat' }
    its('home') { should eq '/opt/tomcat' }
    its('shell') { should eq '/bin/nologin' }
  end
end

control 'test-jdk' do
  impact 0.2
  title 'Check installed JDK version'
  describe package('java-1.8.0-openjdk-devel') do
    it { should be_installed }
    its('version') { should match (/^1.8.0.101/) }
  end
end

control 'test-tomcat' do
  impact 0.4
  title 'Check installed Apache Tomcat version'
  describe package('tomcat') do
    it { should be_installed }
    its('version') { should match (/^7.0.54/) }
  end
end

control 'test-services' do
  impact 0.5
  title 'Check if Tomcat service is enabled and running'
  describe service('tomcat') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
end

control 'test-ports' do
  impact 0.5
  title 'Check if Tomcat is listening on the right network ports'
  describe port(8080) do
    it { should be_listening }
    its('processes') { should eq ['java'] }
    its('protocols') { should eq ['tcp'] }  # fails, listents on tcp6 instead
  end
  describe port(8009) do
    it { should be_listening }
    its('processes') { should eq ['java'] }
    its('protocols') { should eq ['tcp'] }  # fails, listents on tcp6 instead
  end
end
