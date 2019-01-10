# Audio is kind of broken by default for Intel chipsets on Ubuntu
# https://wiki.ubuntu.com/Audio/UpgradingAlsa/DKMS
sudo apt-add-repository ppa:ubuntu-audio-dev/alsa-daily
sudo apt-get update
#sudo apt-get install -y --install-suggests build-essential dkms alsa-tools libasound2 alsa-utils
sudo apt-get install -y build-essential dkms alsa-tools libasound2-dev libasound2 alsa-base alsa-utils git automake ncurses-dev pkg-config libsndfile-dev libmp3lame-dev unattended-upgrades
sudo apt-get install -y linux-image-extra-`uname -r`
sudo apt-get install -y --reinstall linux-image-extra-`uname -r`
sudo apt-get install -y oem-audio-hda-daily-dkms
sudo apt-get autoremove -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

sudo usermod -a -G audio vagrant

# Boost 1.69
wget -q https://dl.bintray.com/boostorg/release/1.69.0/source/boost_1_69_0.tar.gz
tar -xzf boost_1_69_0.tar.gz
cd boost_1_69_0
chmod +x bootstrap.sh
./bootstrap.sh && sudo ./b2 install
cd ~

# RtAudio
wget -q http://www.music.mcgill.ca/~gary/rtaudio/release/rtaudio-5.0.0.tar.gz
tar -xzf rtaudio-5.0.0.tar.gz
cd rtaudio-5.0.0
chmod +x configure
./configure && make && sudo make install
cd ~

# Chronicle
git clone http://github.com/calmcl1/chronicle
cd chronicle
chmod +x autogen.sh
./autogen.sh && ./configure && make && sudo make install

sudo ldconfig