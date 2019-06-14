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
brew upgrade ruby-build

# RubyGem
echo -e "\n####### RubyGem #######\n"
update_rubygems
gem update
echo -e "\n####### gem clean #######\n"
gem clean
echo -e "\n####### gem list #######\n"
gem list

# npm
echo -e "\n####### node.js npm Update #######\n"
sudo npm cache verify
sudo npm update -g
echo -e "\n####### node.js version #######"
node -v

#yarn
curl -o- -L https://yarnpkg.com/install.sh | bash

# pip3
echo -e "\n####### pip3 update #######"
pip3 install --upgrade pip setuptools
echo -e "\n####### pip version #######"
pip3 --version
