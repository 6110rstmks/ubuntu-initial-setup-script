#!bin/bash

sudo su

sudo apt update

sudo apt install npm -y
sudo apt install git -y
sudo apt install vim -y

# composer install
sudo apt install php-curl -y
sudo apt install php-xml -y
sudo apt install php-mbstring -y
sudo apt install composer -y
# --------------------------------

sudo apt install mysql-server -y
sudo apt install mysql-client -y

# php-mysql driver
sudo apt-get install php*-mysql 

# 作成したユーザではコマンドラインからクエリを操作できるが、root userで行うことができない
# There should not be a space between your password and the -p when you pass it on the command-line!
mysql -u ss119 -p119089 <<My_Query
create database unko;
CREATE USER 'unko'@'localhost' IDENTIFIED BY 'ss119';
GRANT ALL ON *.* TO 'unko'@'localhost' WITH GRANT OPTION;
My_Query

# capslock をctrlにする
sed -i 's/XKBOPTIONS=""/XKBOPTIONS="ctrl:nocaps"/' /etc/default/keyboard



systemctl enable mysqld


sudo apt install gnome-tweaks -y

sudo apt install gnome-shell-extensions


sudo apt install apache2 -y

# 日本語入力 Japanese input
sudo apt install ibus-mozc -y
ibus restart 
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'jp'), ('ibus', 'mozc-jp')]"

# docker
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

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# docker desktop for ubuntu

wget https://desktop.docker.com/linux/main/amd64/docker-desktop-4.17.0-amd64.deb

sudo apt install ./docker-desktop-4.17.0-amd64.deb 

# typescript 


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


# -------------------------------
