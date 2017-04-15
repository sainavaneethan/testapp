# Install Required Packages
 - yum install gcc-c++ patch readline readline-devel zlib zlib-devel 
 - yum install libyaml-devel libffi-devel openssl-devel make 
 - yum install bzip2 autoconf automake libtool bison iconv-devel sqlite-devel

# Install RVM 
 - curl -sSL https://rvm.io/mpapis.asc | gpg --import - 
 - curl -L get.rvm.io | bash -s stable
- source /etc/profile.d/rvm.sh 
- rvm reload

# Verify Dependencies 
- rvm requirements run
# Install Ruby 2.2 
 - rvm install 2.2.4

# Gemset creation 
- rvm gemset create rails410 
- rvm 2.2.4@rails410 
- gem install rails -v 4.1.0
# rvmc file 
- goto app 
- vim .rvmrc 
- add below line "rvm use 2.2.4@rails410 --create"
