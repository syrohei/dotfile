#!/bin/sh

xcode-select --install

ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

brew doctor

brew -v

brew update

brew -v

brew tap phinze/homebrew-cask

brew install brew-cask

brew cask install virtualbox

brew cask install vagrant

vagrant -v

var=`vagrant box list`

if echo $var | grep "cmfun_env" ; then
  echo 'image already exists!'
else
  echo 'download image ...'
  vagrant box add cmfun_environment https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box
  
fi


vagrant box list

vagrant up

echo "done!"

