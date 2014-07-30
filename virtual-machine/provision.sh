# See README.md
set -e
set -x

apt-get update
apt-get upgrade -yq

apt-get install -y \
  lubuntu-core \
  virtualbox-guest-x11 \
  lxterminal \
  vim-gtk \
  emacs \
  opam \
  ocaml-native-compilers \
  wireshark \
  python-networkx \
  m4 \
  mininet \
  git \
  libappindicator1 \
  libcurl3

 # Install Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# Install Sublime Text (for Mark Lentczner and Arjun)
wget http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3059_amd64.deb
dpkg -i sublime-text_build-3059_amd64.deb
rm sublime-text_build-3059_amd64.deb

# Create Frenetic account
adduser --disabled-password --gecos frenetic
usermod -a -G sudo frenetic

# Allow sudo without password (for "sudo mn")
cat << EOF > /etc/sudoers
Defaults  env_reset
Defaults  mail_badpass
Defaults  secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

root  ALL=(ALL:ALL) ALL
%admin ALL=(ALL) ALL
%sudo ALL= NOPASSWD:ALL
EOF

# Remove junk
apt-get remove -y xterm
rm -rf /home/frenetic/Templates
rm /var/cache/apt/archives/*.deb

# Auto-Login
cat << EOF > /etc/lightdm/lightdm.conf
[SeatDefaults]
autologin-user=frenetic
autologin-user-timeout=0
user-session=Lubuntu
greeter-session=lightdm-gtk-greeter
EOF

# Setup Frenetic
su frenetic -c "opam init -y"
su frenetic -c "opam repository add frenetic https://github.com/frenetic-lang/opam-bleeding.git"
su frenetic -c "opam install -y frenetic ox"

# Stop OVS Controller so we can run Frenetic
service openvswitch-controller stop
update-rc.d openvswitch-controller disable

# Download and install build scripts
pushd /usr/local/bin
wget https://raw.githubusercontent.com/frenetic-lang/tutorials/master/virtual-machine/scripts/ox-build
wget https://raw.githubusercontent.com/frenetic-lang/tutorials/master/virtual-machine/scripts/netkat-build
chmod a+x ox-build
chmod a+x netkat-build
popd

# Zero free space
cat /dev/zero > zero.fill; sync; sleep 1; sync; rm -f zero.fill
shutdown -h now
