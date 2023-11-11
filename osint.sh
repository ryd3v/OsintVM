#!/usr/bin/env bash

# Remove unnecessary packages
sudo apt purge -y apport apport-symptoms popularity-contest ubuntu-report whoopsie
sudo apt autoremove -y

# Update and install basic tools
sudo apt update
sudo apt install -y build-essential dkms gcc make perl curl wget vlc ffmpeg python3-pip git default-jre mediainfo-gui libimage-exiftool-perl mat2 subversion ripgrep jq libncurses5-dev libffi-dev open-vm-tools

# Install and configure specific tools
sudo snap remove --purge firefox
sudo add-apt-repository -y ppa:mozillateam/ppa
echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox
sudo apt install -y firefox
sudo snap install chromium
sudo pip install -U youtube-dl yt-dlp
sudo apt install -y mediainfo-gui
sudo apt install -y libimage-exiftool-perl
sudo apt install -y mat2
sudo pip install testresources 2>/dev/null
sudo pip install webscreenshot 2>/dev/null
sudo apt install -y httrack webhttrack
sudo apt install -y libcanberra-gtk-module
sudo apt install -y kazam
sudo apt install bleachbit
sudo apt install -y ripgrep
sudo apt install yarn -y
sudo apt install openvpn -y
sudo apt install nmap -y
echo "wireshark-common wireshark-common/install-setuid boolean true" | sudo debconf-set-selections
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install wireshark
sudo apt install tor -y
sudo apt install proxychains -y

# Environment setup for Node.js and other dependencies
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install --lts

# Create Tools directory in user's home
mkdir -p /opt/Tools
sudo chown $USER:$USER /opt/Tools

# Streamlink installation
mkdir /opt/Tools/Streamlink
cd /opt/Tools/Streamlink
python3 -m venv streamlinkEnvironment
source streamlinkEnvironment/bin/activate
pip install streamlink
deactivate

# Instalooter installation
mkdir /opt/Tools/Instalooter
cd /opt/Tools/Instalooter
python3 -m venv instalooterEnvironment
source instalooterEnvironment/bin/activate
pip install instalooter
deactivate

# Instaloader installation
mkdir /opt/Tools/Instaloader
cd /opt/Tools/Instaloader
python3 -m venv instaloaderEnvironment
source instaloaderEnvironment/bin/activate
pip install instaloader
deactivate

# Toutatis installation
mkdir /opt/Tools/Toutatis
cd /opt/Tools/Toutatis
python3 -m venv toutatisEnvironment
source toutatisEnvironment/bin/activate
pip install toutatis
deactivate

# Osintgram installation
mkdir /opt/Tools/Osintgram
cd /opt/Tools/Osintgram
git clone https://github.com/Datalux/Osintgram.git .
python3 -m venv OsintgramEnvironment
source OsintgramEnvironment/bin/activate
pip install -r requirements.txt
deactivate

# Gallery-DL installation
mkdir /opt/Tools/Gallery-DL
cd /opt/Tools/Gallery-DL
python3 -m venv gallerydlEnvironment
source gallerydlEnvironment/bin/activate
pip install -U gallery-dl
deactivate

# RipMe installation
mkdir /opt/Tools/RipMe
cd /opt/Tools/RipMe
wget https://github.com/ripmeapp/ripme/releases/latest/download/ripme.jar
chmod +x ripme.jar

# Sherlock installation
mkdir /opt/Tools/Sherlock
cd /opt/Tools/Sherlock
git clone https://github.com/sherlock-project/sherlock.git .
python3 -m venv SherlockEnvironment
source SherlockEnvironment/bin/activate
pip install -r requirements.txt
deactivate

# Socialscan installation
mkdir /opt/Tools/Socialscan
cd /opt/Tools/Socialscan
python3 -m venv socialscanEnvironment
source socialscanEnvironment/bin/activate
pip install -U socialscan
deactivate

# Holehe installation
mkdir /opt/Tools/Holehe
cd /opt/Tools/Holehe
python3 -m venv holeheEnvironment
source holeheEnvironment/bin/activate
pip install -U holehe
deactivate

# WhatsMyName installation
mkdir /opt/Tools/WhatsMyName
cd /opt/Tools/WhatsMyName
git clone https://github.com/WebBreacher/WhatsMyName.git .
python3 -m venv WhatsMyNameEnvironment
source WhatsMyNameEnvironment/bin/activate
pip install -r requirements.txt
deactivate

# Blackbird installation
mkdir /opt/Tools/Blackbird
cd /opt/Tools/Blackbird
git clone https://github.com/p1ngul1n0/blackbird .
python3 -m venv BlackbirdEnvironment
source BlackbirdEnvironment/bin/activate
pip install -r requirements.txt
deactivate

# Maigret installation
mkdir /opt/Tools/Maigret
cd /opt/Tools/Maigret
python3 -m venv maigretEnvironment
source maigretEnvironment/bin/activate
pip install maigret
deactivate

# Email2phonenumber installation
mkdir /opt/Tools/Email2phonenumber
cd /opt/Tools/Email2phonenumber
git clone https://github.com/martinvigo/email2phonenumber.git .
python3 -m venv Email2phonenumberEnvironment
source Email2phonenumberEnvironment/bin/activate
pip install -r requirements.txt
deactivate

# Ghunt installation
sudo pip install pipx
pipx ensurepath
pipx install ghunt
pipx ensurepath

# EyeWitness installation
mkdir /opt/Tools/EyeWitness
cd /opt/Tools/EyeWitness
git clone https://github.com/FortyNorthSecurity/EyeWitness.git .
cd Python/setup
sudo ./setup.sh

# Geckodriver installation
cd /opt/Tools
wget https://github.com/mozilla/geckodriver/releases/download/v0.32.0/geckodriver-v0.32.0-linux-aarch64.tar.gz
tar -xvzf geckodriver*
chmod +x geckodriver
sudo mv geckodriver /usr/local/bin
sudo rm -rf geckodriver-v0.32.0-linux-aarch64.tar.gz

# Amass installation
sudo snap install amass

# Sublist3r installation
mkdir /opt/Tools/Sublist3r
cd /opt/Tools/Sublist3r
git clone https://github.com/aboul3la/Sublist3r.git .
python3 -m venv Sublist3rEnvironment
source Sublist3rEnvironment/bin/activate
pip install -r requirements.txt
deactivate

# Photon installation
mkdir /opt/Tools/Photon
cd /opt/Tools/Photon
git clone https://github.com/s0md3v/Photon.git .
python3 -m venv PhotonEnvironment
source PhotonEnvironment/bin/activate
pip install -r requirements.txt
deactivate

# TheHarvester installation
mkdir /opt/Tools/TheHarvester
cd /opt/Tools/TheHarvester
git clone https://github.com/laramies/theHarvester.git .
python3 -m venv TheHarvesterEnvironment
source TheHarvesterEnvironment/bin/activate
pip install -r requirements.txt
deactivate

# Carbon14 installation
mkdir /opt/Tools/Carbon14
cd /opt/Tools/Carbon14
git clone https://github.com/Lazza/Carbon14 .
python3 -m venv Carbon14Environment
source Carbon14Environment/bin/activate
pip install -r requirements.txt
deactivate

# Xeuledoc installation
mkdir /opt/Tools/Xeuledoc
cd /opt/Tools/Xeuledoc
python3 -m venv XeuledocEnvironment
source XeuledocEnvironment/bin/activate
pip install -U xeuledoc
deactivate

# Sherloq installation
mkdir /opt/Tools/Sherloq
cd /opt/Tools/Sherloq
git clone https://github.com/GuidoBartoli/sherloq.git gui
cd gui
python3 -m venv SherloqEnvironment
source SherloqEnvironment/bin/activate
pip install -r requirements.txt
deactivate

# Metagoofil installation
mkdir /opt/Tools/Metagoofil
cd /opt/Tools/Metagoofil
git clone https://github.com/opsdisk/metagoofil.git .
python3 -m venv MetagoofilEnvironment
source MetagoofilEnvironment/bin/activate
pip install -r requirements.txt
deactivate

# BDFR
mkdir /opt/Tools/bdfr
cd /opt/Tools/bdfr
python3 -m venv bdfrEnvironment
source bdfrEnvironment/bin/activate
sudo pip install -U bdfr 2>/dev/null
deactivate

# Redis Finder
mkdir /opt/Tools/redditsfinder
cd /opt/Tools/redditsfinder
python3 -m venv redditsfinderEnvironment
source redditsfinderEnvironment/bin/activate
sudo pip install -U redditsfinder 2>/dev/null
deactivate

# Downloader for Reddit
cd /opt/Tools
git clone https://github.com/MalloyDelacroix/DownloaderForReddit.git
cd /opt/Tools/DownloaderForReddit
python3 -m venv DownloaderForRedditEnvironment
source DownloaderForRedditEnvironment/bin/activate
sudo pip install -r requirements.txt 2>/dev/null
deactivate

# WayBackPy
mkdir /opt/Tools/waybackpy
cd /opt/Tools/waybackpy
python3 -m venv waybackpyEnvironment
source waybackpyEnvironment/bin/activate
sudo pip install -U waybackpy 2>/dev/null
deactivate

# ChangeDetection
mkdir /opt/Tools/changedetection
cd /opt/Tools/changedetection
python3 -m venv changedetectionEnvironment
source changedetectionEnvironment/bin/activate
sudo pip install changedetection.io 2>/dev/null
deactivate

# ArchiveBox
mkdir /opt/Tools/archivebox
cd /opt/Tools/archivebox
python3 -m venv archiveboxEnvironment
source archiveboxEnvironment/bin/activate
sudo pip install archivebox
deactivate
mkdir /opt/Tools/archivebox
cd /opt/Tools/archivebox
archivebox init

# SpiderFoot
cd /opt/Tools
git clone https://github.com/smicallef/spiderfoot.git
cd /opt/Tools/spiderfoot
python3 -m venv spiderfootEnvironment
source spiderfootEnvironment/bin/activate
sudo pip install -r requirements.txt 2>/dev/null
deactivate

# ReconNG
cd /opt/Tools
git clone https://github.com/lanmaster53/recon-ng.git
cd /opt/Tools/recon-ng
python3 -m venv recon-ngEnvironment
source recon-ngEnvironment/bin/activate
sudo pip install -r REQUIREMENTS 2>/dev/null
deactivate

# OpenAI Whisper
sudo pip install -U openai-whisper
mkdir /opt/Tools/whisper
cd /opt/Tools/whisper
wget https://openaipublic.azureedge.net/main/whisper/models/9ecf779972d90ba49c06d968637d720dd632c55bbf19d441fb42bf17a411e794/small.pt

# InternetArchive
mkdir /opt/Tools/internetarchive
cd /opt/Tools/internetarchive
python3 -m venv internetarchiveEnvironment
source internetarchiveEnvironment/bin/activate
sudo pip install -U internetarchive 2>/dev/null
deactivate

# ElasticSearchCrawler
cd /opt/Tools
git clone https://github.com/AmIJesse/Elasticsearch-Crawler.git

sudo pip install nested-lookup 2>/dev/null

# Search that Hash
mkdir /opt/Tools/search-that-hash
cd /opt/Tools/search-that-hash
python3 -m venv search-that-hashEnvironment
source search-that-hashEnvironment/bin/activate
sudo pip install -U search-that-hash 2>/dev/null
deactivate

# Name That Hash
mkdir /opt/Tools/name-that-hash
cd /opt/Tools/name-that-hash
python3 -m venv name-that-hashEnvironment
source name-that-hashEnvironment/bin/activate
sudo pip install -U name-that-hash 2>/dev/null
deactivate

# Detect it easy
mkdir /opt/Tools/DIE
cd /opt/Tools/DIE
wget https://github.com/horsicq/DIE-engine/releases/download/3.08/Detect_It_Easy-3.08-x86_64.AppImage

cd /opt/tools
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && ./msfinstall
./msfconsole
cd /opt/Tools
sudo cp /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d
sudo apt update -y

wget https://downloads.maltego.com/maltego-v4/linux/Maltego.v4.5.0.deb
sudo apt install ./Maltego.v4.5.0.deb -y
sudo rm -rf Maltego.v4.5.0.deb

cd /opt/Tools
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
cd /opt/Tools
sudo wget https://github.com/sleuthkit/autopsy/releases/download/autopsy-4.21.0/autopsy_4.21.0_amd64.snap
sudo snap install --dangerous ./autopsy_4.21.0_amd64.snap
sudo rm -rf autopsy_4.21.0_amd64.snap

# Common Forensics Tools
sudo apt install forensics-all -y

# Miscellaneous setup
sudo apt --fix-broken install
sudo apt update --fix-missing
sudo apt -y upgrade
sudo apt autoremove -y

echo "All tools installed. Please reboot."
