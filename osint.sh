#!/bin/bash

read -r -p "This script will install various tools, Press enter to continue or type 'quit' to stop: " input

# Check if the user wants to quit
if [ "$input" == "quit" ]; then
  echo "You chose to stop the script."
  exit 0
fi

# Update and upgrade
sudo apt update && sudo apt upgrade -y

# Remove unnecessary packages
sudo apt purge -y apport apport-symptoms popularity-contest ubuntu-report whoopsie
sudo apt autoremove -y
sudo apt update && sudo apt upgrade -y

# Install basic tools
sudo apt install -y build-essential dkms gcc make perl curl wget vlc ffmpeg python3-pip git default-jre mediainfo-gui libimage-exiftool-perl mat2 subversion ripgrep jq libncurses-dev libffi-dev open-vm-tools gnome-tweaks transmission python3-shodan webhttrack outguess stegosuite exifprobe ruby-bundler cherrytree drawing

# Function to install the venv module for a specific Python version
install_venv() {
    local version=$1
    if command -v python"$version" &> /dev/null; then
        echo "Installing python$version-venv..."
        sudo apt install python"$version"-venv -y
        if [ $? -eq 0 ]; then
            echo "Successfully installed python$version-venv"
        else
            echo "Failed to install python$version-venv"
        fi
    else
        echo "Python $version is not installed."
    fi
}

# List of Python versions to check
versions=("3.10" "3.11" "3.12")

# Iterate over the list and install venv if the version is installed
for version in "${versions[@]}"; do
    install_venv "$version"
done

# fix Git always asking for user credentials
git config --global credential.helper store
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=600'

# Install and configure specific tools
sudo snap install code --classic
sudo snap install chromium
sudo snap install joplin-desktop
sudo snap install amass

sudo apt install -y mediainfo-gui libimage-exiftool-perl mat2 httrack libcanberra-gtk-module kazam bleachbit ripgrep yarn openvpn nmap tor proxychains fonts-roboto fonts-jetbrains-mono nikto netdiscover

# Wireshark
echo "wireshark-common wireshark-common/install-setuid boolean true" | sudo debconf-set-selections
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install wireshark

# Environment setup for Node.js and other dependencies
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
export NVM_DIR="$HOME/.nvm"
# shellcheck disable=SC1091
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# shellcheck disable=SC1091
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install --lts

sudo pip install setuptools wheel --break-system-packages
sudo pip install --upgrade setuptools wheel --break-system-packages

# Create Tools directory in user's home
mkdir -p /opt/Tools
sudo chown "$USER":"$USER" /opt/Tools

# Detect it easy
cd /opt/Tools || {
    echo "Failed to change directory. Continuing with the script..."
}
mkdir /opt/Tools/DIE
cd /opt/Tools/DIE || {
    echo "Failed to change directory. Continuing with the script..."
}
wget https://github.com/horsicq/DIE-engine/releases/download/3.08/Detect_It_Easy-3.08-x86_64.AppImage
sudo chmod +x Detect_It_Easy-3.08-x86_64.AppImage

# OSINT Notebook
cd /opt/Tools || {
    echo "Failed to change directory. Continuing with the script..."
}
mkdir /opt/Tools/OSINTnotebook
cd /opt/Tools/OSINTnotebook || {
    echo "Failed to change directory. Continuing with the script..."
}
git clone https://github.com/ryd3v/fork-of-TJ-OSINT-Notebook.git .

# Gallery-DL installation
cd /opt/Tools || {
    echo "Failed to change directory. Continuing with the script..."
}
mkdir /opt/Tools/Gallery-DL
cd /opt/Tools/Gallery-DL || {
    echo "Failed to change directory. Continuing with the script..."
}
python3 -m venv venv
source venv/bin/activate
pip install -U gallery-dl
deactivate

# RipMe installation
cd /opt/Tools || {
    echo "Failed to change directory. Continuing with the script..."
}
mkdir /opt/Tools/RipMe
cd /opt/Tools/RipMe || {
    echo "Failed to change directory. Continuing with the script..."
}
wget https://github.com/ripmeapp/ripme/releases/latest/download/ripme.jar
chmod +x ripme.jar

# Sherlock installation
cd /opt/Tools || {
    echo "Failed to change directory. Continuing with the script..."
}
mkdir /opt/Tools/Sherlock
cd /opt/Tools/Sherlock || {
    echo "Failed to change directory. Continuing with the script..."
}
git clone https://github.com/sherlock-project/sherlock.git .
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
deactivate

# Socialscan installation
cd /opt/Tools || {
    echo "Failed to change directory. Continuing with the script..."
}
mkdir /opt/Tools/Socialscan
cd /opt/Tools/Socialscan || {
    echo "Failed to change directory. Continuing with the script..."
}
git clone https://github.com/iojw/socialscan.git .
python3 -m venv venv
source venv/bin/activate
pip install .
deactivate

# WhatsMyName installation
cd /opt/Tools || {
    echo "Failed to change directory. Continuing with the script..."
}
mkdir /opt/Tools/WhatsMyName
cd /opt/Tools/WhatsMyName || {
    echo "Failed to change directory. Continuing with the script..."
}
git clone https://github.com/WebBreacher/WhatsMyName.git .

# Sublist3r installation
cd /opt/Tools || {
    echo "Failed to change directory. Continuing with the script..."
}
mkdir /opt/Tools/Sublist3r
cd /opt/Tools/Sublist3r || {
    echo "Failed to change directory. Continuing with the script..."
}
git clone https://github.com/aboul3la/Sublist3r.git .
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
deactivate

# Photon installation
cd /opt/Tools || {
    echo "Failed to change directory. Continuing with the script..."
}
mkdir /opt/Tools/Photon
cd /opt/Tools/Photon || {
    echo "Failed to change directory. Continuing with the script..."
}
git clone https://github.com/s0md3v/Photon.git .
python3 -m venv PhotonEnvironment
source PhotonEnvironment/bin/activate
pip install -r requirements.txt
deactivate

# TheHarvester installation
cd /opt/Tools || {
    echo "Failed to change directory. Continuing with the script..."
}
mkdir /opt/Tools/TheHarvester
cd /opt/Tools/TheHarvester || {
    echo "Failed to change directory. Continuing with the script..."
}
git clone https://github.com/laramies/theHarvester.git .
python3 -m venv venv
source venv/bin/activate
pip install -r requirements/base.txt
deactivate

# Xeuledoc installation
cd /opt/Tools || {
    echo "Failed to change directory. Continuing with the script..."
}
mkdir /opt/Tools/Xeuledoc
cd /opt/Tools/Xeuledoc || {
    echo "Failed to change directory. Continuing with the script..."
}
git clone https://github.com/Malfrats/xeuledoc.git .
python3 setup.py install

# Metagoofil installation
cd /opt/Tools || {
    echo "Failed to change directory. Continuing with the script..."
}
mkdir /opt/Tools/Metagoofil
cd /opt/Tools/Metagoofil || {
    echo "Failed to change directory. Continuing with the script..."
}
git clone https://github.com/opsdisk/metagoofil .
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
deactivate

# Bulk Download For Reddit
mkdir /opt/Tools/bdfr
cd /opt/Tools/bdfr || {
    echo "Failed to change directory. Continuing with the script..."
}
git clone https://github.com/aliparlakci/bulk-downloader-for-reddit.git .
python3 -m venv venv
source venv/bin/activate
python3 -m pip install bdfr --upgrade
deactivate

# Downloader for Reddit
cd /opt/Tools || {
    echo "Failed to change directory. Continuing with the script..."
}
mkdir DownloaderForReddit
cd /opt/Tools/DownloaderForReddit || {
    echo "Failed to change directory. Continuing with the script..."
}
wget https://github.com/MalloyDelacroix/DownloaderForReddit/releases/download/v3.16.0/DownloaderForReddit_v3.16.0.zip

# ReconNG
cd /opt/Tools || {
    echo "Failed to change directory. Continuing with the script..."
}
mkdir /opt/Tools/recon-ng
cd /opt/Tools/recon-ng || {
    echo "Failed to change directory. Continuing with the script..."
}
git clone https://github.com/lanmaster53/recon-ng.git .
python3 -m venv venv
source venv/bin/activate
pip install -r REQUIREMENTS
deactivate

# ElasticSearchCrawler
cd /opt/Tools || {
    echo "Failed to change directory. Continuing with the script..."
}
mkdir /opt/Tools/Elasticsearch-Crawler
cd /opt/Tools/Elasticsearch-Crawler || {
    echo "Failed to change directory. Continuing with the script..."
}
git clone https://github.com/AmIJesse/Elasticsearch-Crawler.git .

# maltego
wget https://downloads.maltego.com/maltego-v4/linux/Maltego.v4.5.0.deb
sudo apt install ./Maltego.v4.5.0.deb -y
sudo rm -rf Maltego.v4.5.0.deb

# misc dev tools
cd /opt/Tools || {
    echo "Failed to change directory. Continuing with the script..."
}
sudo apt -y install \
        openjdk-17-jdk openjdk-17-jre \
        build-essential autoconf libtool automake git zip wget ant \
        libde265-dev libheif-dev \
        libpq-dev \
        testdisk libafflib-dev libewf-dev libvhdi-dev libvmdk-dev \
        libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad \
        gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x \
        gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio

# Autopsy
cd /opt/Tools || {
    echo "Failed to change directory. Continuing with the script..."
}
sudo wget https://github.com/sleuthkit/autopsy/releases/download/autopsy-4.21.0/autopsy_4.21.0_amd64.snap
sudo snap install --dangerous ./autopsy_4.21.0_amd64.snap
sudo snap connections autopsy | sed -nE 's/^[^ ]* *([^ ]*) *- *- *$/\1/p' | xargs -I{} sudo snap connect {}
sudo rm -rf autopsy_4.21.0_amd64.snap

# Common Forensics Tools
sudo apt install forensics-all -y

# Miscellaneous setup
sudo apt --fix-broken install
sudo apt update --fix-missing
sudo apt -y upgrade
sudo apt autoremove -y

# Flatpak
sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Misc Flathubs
sudo flatpak install flathub com.discordapp.Discord -y
sudo flatpak install flathub io.github.bytezz.IPLookup -y
flatpak install flathub org.gtkhash.gtkhash -y
sudo flatpak install flathub org.mozilla.Thunderbird -y
sudo flatpak install flathub md.obsidian.Obsidian -y
sudo flatpak install flathub org.kde.tokodon -y
sudo flatpak install flathub org.remmina.Remmina -y
flatpak install flathub com.belmoussaoui.Obfuscate -y
sudo flatpak install flathub com.mattjakeman.ExtensionManager -y
sudo flatpak install flathub org.gabmus.whatip -y
sudo flatpak install flathub com.obsproject.Studio -y
sudo flatpak install flathub io.exodus.Exodus -y

echo "All tools installed. Please reboot."
exit 0
