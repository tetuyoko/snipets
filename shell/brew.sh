#!/bin/bash

# Homebrew
echo -e "\n####### Homebrew Update #######\n"
brew update
brew upgrade
echo -e "\n####### Homebrew Clean Up #######\n"
brew cleanup
echo -e "\n####### Homebrew Check #######\n"
brew -v list
brew doctor

# Ruby
echo -e "\n####### Ruby #######\n"
ruby -v

# RubyGem
echo -e "\n####### RubyGem #######\n"
sudo update_rubygems
sudo gem update
echo -e "\n####### gem clean #######\n"
sudo gem clean
echo -e "\n####### gem list #######\n"
gem list

# npm
echo -e "\n####### node.js npm Update #######\n"
sudo npm cache clean
sudo npm update -g
echo -e "\n####### node.js version #######"
node -v
echo -e "\n####### grunt-init version #######"
grunt-init --version
echo -e "\n####### grunt version #######"
grunt --version
echo -e "\n####### bower version #######"
bower --version
echo -e "\n####### gulp version #######"
gulp --version
echo -e "\n####### less version #######"
lessc -v

# Vagrant plugin
echo -e "\n####### Vagrant plugin Update #######\n"
vagrant plugin update
echo -e "\n####### Vagrant plugin List #######\n"
vagrant plugin list
