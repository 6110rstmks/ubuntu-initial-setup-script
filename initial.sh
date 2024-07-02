#!bin/bash

sudo su

sudo apt update

sudo apt install npm -y
sudo apt install git -y
git config --global user.name "6110rstmks"
git config --global user.email "soras.k.m.tj16@gmail.com"
sudo apt install vim -y
# sudo apt install awscli -y
sudo apt install npm -y

# node version up
sudo apt update

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

source ~/.bashrc

nvm install v18.14.2

# composer install
sudo apt install php-curl -y
sudo apt install php-xml -y
sudo apt install php-mbstring -y
sudo apt install composer -y
# --------------------------------

# sudo apt install mysql-server -y
# sudo apt install mysql-client -y

# php-mysql driver
sudo apt-get install php*-mysql 

# 作成したユーザではコマンドラインからクエリを操作できるが、なぜだかroot userで行うことができない
# There should not be a space between your password and the -p when you pass it on the command-line!
mysql -u ss119 -p119089 <<My_Query
create database unko;
CREATE USER 'unko'@'localhost' IDENTIFIED BY 'ss119';
GRANT ALL ON *.* TO 'unko'@'localhost' WITH GRANT OPTION;
My_Query

# capslock をctrlにする
# ファイルに追記はできているが、これではうまくいかないっぽい
sed -i 's/XKBOPTIONS=""/XKBOPTIONS="ctrl:nocaps"/' /etc/default/keyboard

# chrome setting(safesearch, etc...)
sudo mkdir /etc/opt/chrome/policies
sudo mkdir /etc/opt/chrome/policies/managed
sudo touch /etc/opt/chrome/policies/managed/setting.json
sudo chmod 777 /etc/opt/chrome/policies/managed/setting.json

echo '{"IncognitoModeAvailability": 1, "BrowserGuestModeEnabled": false, "BrowserAddPersonEnabled": 0, "ForceGoogleSafeSearch": true, "ForceYouTubeRestrict": 2}
' > /etc/opt/chrome/policies/managed/setting.json

# hosts file setting
cd /etc
echo -e '127.0.0.1 bing.com\n127.0.0.1 duckduckgo.com' >> hosts


# systemctl enable mysqld


sudo apt install gnome-tweaks -y

sudo apt install gnome-shell-extensions -y

# use xampp instead of individual apache2
# sudo apt install apache2 -y
# sudo systemctl stop apache2

# 日本語入力 Japanese input
sudo apt install ibus-mozc -y
ibus restart 
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'jp'), ('ibus', 'mozc-jp')]"

# github multiple account

cd ~
cd .ssh
echo '
Host github-js
  HostName github.com
  IdentityFile ~/.ssh/js/id_rsa
  User git
  Port 22
  TCPKeepAlive yes
  IdentitiesOnly yes

Host github-php
  HostName github.com
  IdentityFile ~/.ssh/php/id_rsa
  User git
  Port 22
  TCPKeepAlive yes
  IdentitiesOnly yes

Host github-python
  HostName github.com
  IdentityFile ~/.ssh/python/id_rsa
  User git
  Port 22
  TCPKeepAlive yes
  IdentitiesOnly yes

Host github-docker
  HostName github.com
  IdentityFile ~/.ssh/docker/id_rsa
  User git
  Port 22
  TCPKeepAlive yes
  IdentitiesOnly yes

Host github-terraform
  HostName github.com
  IdentityFile ~/.ssh/terraform/id_rsa
  User git
  Port 22
  TCPKeepAlive yes
  IdentitiesOnly yes

Host github-dataenginnering
  HostName github.com
  IdentityFile ~/.ssh/dataengineering/id_rsa
  User git
  Port 22
  TCPKeepAlive yes
  IdentitiesOnly yes

'  > config



cd ..
echo '
function githubjs()
{
 git config --global user.name "js-rstmks"
 git config --global user.email "javascript.skmtsr@gmail.com"
 ssh -T git@github.com
}

function githubphp()
{
 git config --global user.name "php-rstmks"
 git config --global user.email "php.skmtsr@gmail.com"
 ssh -T git@github.com
}

function githubpython()
{
 git config --global user.name "pytho-rstmks"
 git config --global user.email "python.skmtsr@gmail.com"
}

function githubdocker()
{
 git config --global user.name "docker-rstmks"
 git config --global user.email "docker.skmtsr@gmail.com"
}

function githubterraform()
{
 git config --global user.name "terraform-rstmks"
 git config --global user.email "terraform.skmtsr@gmail.com"
}

function githubdataengineering()
{
 git config --global user.name "dataengineering-rstmks"
 git config --global user.email "dataengineering.skmtsr@gmail.com"
}
' >> .bashrc

sudo mkdir /etc/apt/preference.d
cd /etc/apt/preference.d
sudo touch firefox.pref
sudo touch snapd.pref
sudo touch microsoft-edge-stable.pref
sudo touch brave-browser.pref

echo '
Package: snapd
Pin: release *
Pin-Priority: -1
' >> snapd.pref

echo '
Package: microsoft-edge-stable
Pin: release *
Pin-Priority: -1
' >> microsoft-edge-stable.pref

echo '
Package: brave-browser
Pin: release *
Pin-Priority: -1
' >> brave-browser.pref


# docker install
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

sudo mkdir -m 0755 -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# ここでのsudo apt updateは必須
sudo apt update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# docker desktop for ubuntu

wget https://desktop.docker.com/linux/main/amd64/docker-desktop-4.17.0-amd64.deb

sudo apt install ./docker-desktop-4.17.0-amd64.deb -y

# use docker cmd without sudo.
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker

# xampp
wget https://www.apachefriends.org/xampp-files/8.1.1/xampp-linux-x64-8.1.1-2-installer.run

chmod a+x xampp-linux-*-installer.run

sudo ./xampp-linux-x64-8.1.1-2-installer.run
sudo apt install net-tools -y


# typescript 

# gnome-extension gui 関連のやつ


# gnome-extensionのinstallを自動化する

array=( https://extensions.gnome.org/extension/779/clipboard-indicator/
https://extensions.gnome.org/extension/4012/gnome-bedtime/
https://extensions.gnome.org/extension/4747/hide-date/ )

for i in "${array[@]}"
do
    EXTENSION_ID=$(curl -s $i | grep -oP 'data-uuid="\K[^"]+')
    VERSION_TAG=$(curl -Lfs "https://extensions.gnome.org/extension-query/?search=$EXTENSION_ID" | jq '.extensions[0] | .shell_version_map | map(.pk) | max')
    wget -O ${EXTENSION_ID}.zip "https://extensions.gnome.org/download-extension/${EXTENSION_ID}.shell-extension.zip?version_tag=$VERSION_TAG"
    gnome-extensions install --force ${EXTENSION_ID}.zip
    if ! gnome-extensions list | grep --quiet ${EXTENSION_ID}; then
        busctl --user call org.gnome.Shell.Extensions /org/gnome/Shell/Extensions org.gnome.Shell.Extensions InstallRemoteExtension s ${EXTENSION_ID}
    fi
    gnome-extensions enable ${EXTENSION_ID}
    rm ${EXTENSION_ID}.zip
done

# phpmyadmin
sudo apt install phpmyadmin -y
# processがロックされてしまうので、一番下にもってくる

# dockerを非rootで実行するには再起動する必要がある
sudo shutdown -r now


# -------------------------------

# 
