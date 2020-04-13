#!/bin/bash
# Author: Charlie BROMBERG (Shutdown - @_nwodtuhs)

function colorecho() {
  BG='\033[1;32m'
  NC='\033[0m'
  echo -e "${BG}$@${NC}"
  sleep 2
}

function update() {
  colorecho "[+] Updating, upgrading, cleaning"
  apt -y update && apt -y install apt-utils && apt -y upgrade && apt -y autoremove && apt clean
}

function apt_packages() {
  colorecho "[+] Installing APT packages"
  apt install -y --no-install-recommends aircrack-ng crunch curl dirb dirbuster dnsenum dnsrecon dnsutils dos2unix enum4linux exploitdb ftp git gobuster hashcat hping3 hydra john joomscan masscan metasploit-framework mimikatz nasm ncat netcat-traditional nikto nmap patator php powersploit proxychains python-pip python2 python3 recon-ng samba samdump2 seclists smbclient smbmap snmp socat sqlmap sslscan testssl.sh theharvester tree vim nano weevely wfuzz wget whois wordlists seclists wpscan zsh golang ssh iproute2 iputils-ping python3-pip python-dev python3-dev sudo tcpdump gem tidy passing-the-hash proxychains ssh-audit whatweb smtp-user-enum onesixtyone cewl radare2 nbtscan amap
}

function filesystem() {
  colorecho "[+] Preparing filesystem"
  mkdir -p /opt/tools/ /opt/tools/bin/ /opt/resources/ /opt/resources/windows/ /opt/resources/linux/
}

function ohmyzsh() {
  colorecho "[+] Installing oh-my-zsh, config, history, aliases"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  sed -i 's/robbyrussell/gentoo/g' ~/.zshrc
  sed -i 's/plugins=(git)/plugins=(git sudo docker docker-compose)/g' ~/.zshrc
  echo 'TIME_="%{$fg[white]%}[%{$fg[red]%}%D %T%{$fg[white]%}]%{$reset_color%}"' >> ~/.zshrc
  echo 'PROMPT="$TIME_%{$FX[bold]$FG[013]%} Exegol %{$fg_bold[blue]%}%(!.%1~.%c) $(prompt_char)%{$reset_color%} "' >> ~/.zshrc
  echo 'export GOPATH=/root/go/bin' >> ~/.zshrc
  echo 'export GO111MODULE=on' >> ~/.zshrc
  echo 'export PATH=$GOPATH:$PATH' >> ~/.zshrc
  wget -O ~/.zsh_history https://raw.githubusercontent.com/ShutdownRepo/Exegol/master/confs/zsh/history
  echo 'source /opt/aliases' >> ~/.zshrc
  wget -O /opt/aliases https://raw.githubusercontent.com/ShutdownRepo/Exegol/master/confs/zsh/aliases
  echo 'export PATH=/opt/tools/bin:$PATH' >> ~/.zshrc
}

function banners() {
  colorecho "[+] Installing lolcat and figlet (it is essential here)"
  wget https://github.com/busyloop/lolcat/archive/master.zip
  unzip master.zip
  cd lolcat-master/bin
  gem install lolcat
  cd ../../ && rm -r lolcat-master master.zip
  apt -y install figlet
  wget -O /usr/share/figlet/Bloody.flf https://raw.githubusercontent.com/xero/figlet-fonts/master/Bloody.flf
  echo '#echo ""' >> ~/.zshrc
  echo '#figlet -f Bloody "Exegol" -w 10000 | lolcat' >> ~/.zshrc
  echo '#echo ""' >> ~/.zshrc
}

function dependencies() {
  colorecho "[+] Installing most required dependencies"
  apt -y install python-setuptools python3-setuptools
  pip3 install wheel
  pip install wheel
}

function Responder() {
  colorecho "[+] Installing Responder"
  git -C /opt/tools/ clone https://github.com/lgandx/Responder
  sed -i 's/ Random/ 1122334455667788/g' /opt/tools/Responder/Responder.conf
  sed -i 's/files\/AccessDenied.html/\/opt\/tools\/Responder\/files\/AccessDenied.html/g' /opt/tools/Responder/Responder.conf
  sed -i 's/files\/BindShell.exe/\/opt\/tools\/Responder\/files\/BindShell.exe/g' /opt/tools/Responder/Responder.conf
  sed -i 's/certs\/responder.crt/\/opt\/tools\/Responder\/certs\/responder.crt/g' /opt/tools/Responder/Responder.conf
  sed -i 's/certs\/responder.key/\/opt\/tools\/Responder\/certs\/responder.key/g' /opt/tools/Responder/Responder.conf
}

function Sublist3r() {
  colorecho "[+] Installing Sublist3r"
  git -C /opt/tools/ clone https://github.com/aboul3la/Sublist3r.git
  pip3 install -r /opt/tools/Sublist3r/requirements.txt
}

function ReconDog() {
  colorecho "[+] Installing ReconDog"
  git -C /opt/tools/ clone https://github.com/s0md3v/ReconDog
  pip3 install -r /opt/tools/ReconDog/requirements.txt
}

function CloudFail() {
  colorecho "[+] Installing CloudFail"
  git -C /opt/tools/ clone https://github.com/m0rtem/CloudFail
  pip3 install -r /opt/tools/CloudFail/requirements.txt
}

function OneForAll() {
  colorecho "[+] Installing OneForAll"
  git -C /opt/tools/ clone https://github.com/shmilylty/OneForAll.git
  pip3 install -r /opt/tools/OneForAll/requirements.txt
}

function EyeWitness() {
  colorecho "[+] Installing EyeWitness"
  git -C /opt/tools/ clone https://github.com/FortyNorthSecurity/EyeWitness
  cd /opt/tools/EyeWitness/setup
  ./setup.sh
}

function wafw00f() {
  colorecho "[+] Installing wafw00f"
  git -C /opt/tools/ clone https://github.com/EnableSecurity/wafw00f
  cd /opt/tools/wafw00f
  python setup.py install
}

function JSParser() {
  colorecho "[+] Installing JSParser"
  git -C /opt/tools/ clone https://github.com/nahamsec/JSParser
  cd /opt/tools/JSParser
  python setup.py install
}

function LinkFinder() {
  colorecho "[+] Installing LinkFinder"
  git -C /opt/tools/ clone https://github.com/GerbenJavado/LinkFinder.git
  cd /opt/tools/LinkFinder
  pip3 install -r requirements.txt
  python3 setup.py install
}

function SSRFmap() {
  colorecho "[+] Installing SSRFmap"
  git -C /opt/tools/ clone https://github.com/swisskyrepo/SSRFmap
  cd /opt/tools/SSRFmap
  pip3 install -r requirements.txt
}

function fuxploider() {
  colorecho "[+] Installing fuxploider"
  git -C /opt/tools/ clone https://github.com/almandin/fuxploider.git
  cd /opt/tools/fuxploider
  pip3 install -r requirements.txt
}

function CORScanner() {
  colorecho "[+] Installing CORScanner"
  git -C /opt/tools/ clone https://github.com/chenjj/CORScanner.git
  cd /opt/tools/CORScanner
  pip install -r requirements.txt
}

function Blazy() {
  colorecho "[+] Installing Blazy"
  git -C /opt/tools/ clone https://github.com/UltimateHackers/Blazy
  cd /opt/tools/Blazy
  pip install -r requirements.txt
}

function XSStrike() {
  colorecho "[+] Installing XSStrike"
  git -C /opt/tools/ clone https://github.com/s0md3v/XSStrike.git
}

function Bolt() {
  colorecho "[+] Installing Bolt"
  git -C /opt/tools/ clone https://github.com/s0md3v/Bolt.git
}

function CrackMapExec() {
  colorecho "[+] Downloading CrackMapExec"
  apt -y install libssl-dev libffi-dev python-dev build-essential python3-winrm
  git -C /opt/tools/ clone --recursive https://github.com/mpgn/CrackMapExec
  cd /opt/tools/CrackMapExec
  git submodule update --recursive
  python3 setup.py install
}

function lsassy() {
  colorecho "[+] Installing lsassy with pip, and cme module by reinstalling cme with lsassy in cmd/modules/"
  git -C /opt/tools/ clone https://github.com/Hackndo/lsassy/
  cd /opt/tools/lsassy
  python3 setup.py install
  wget -O /opt/tools/CrackMapExec/cme/modules/lsassy3.py https://raw.githubusercontent.com/Hackndo/lsassy/master/cme/lsassy3.py
  cd /opt/tools/CrackMapExec
  python3 setup.py install
  pip3 install 'asn1crypto>=1.3.0'
}

function sprayhound() {
  colorecho "[+] Installing sprayhound"
  git -C /opt/tools/ clone https://github.com/Hackndo/sprayhound
  cd /opt/tools/sprayhound
  apt -y install libsasl2-dev libldap2-dev
  pip3 install "pyasn1<0.5.0,>=0.4.6"
  python3 setup.py install
}

function Impacket() {
  colorecho "[+] Installing Impacket scripts"
  #git -C /opt/tools/ clone https://github.com/SecureAuthCorp/impacket
  # fetching files from ShutdownRepo while Pull Request isn't accepted
  git -C /opt/tools/ clone https://github.com/ShutdownRepo/impacket
  cd /opt/tools/impacket/
  pip3 install .
  wget -O /usr/share/grc/conf.ntlmrelayx https://raw.githubusercontent.com/ShutdownRepo/Exegol/master/confs/grc/conf.ntlmrelayx
  wget -O /usr/share/grc/conf.secretsdump https://raw.githubusercontent.com/ShutdownRepo/Exegol/master/confs/grc/conf.secretsdump
}

function BloodHound() {
  colorecho "[+] Installing neo4j and Python ingestor for BloodHound"
  git -C /opt/tools/ clone https://github.com/fox-it/BloodHound.py
  cd /opt/tools/BloodHound.py/
  python setup.py install
  apt -y install neo4j
}

function mitm6_sources() {
  colorecho "[+] Installing mitm6 from sources"
  git -C /opt/tools/ clone https://github.com/fox-it/mitm6
  cd /opt/tools/mitm6/
  pip3 install --user -r requirements.txt
  python3 setup.py install
}

function mitm6() {
  colorecho "[+] Installing mitm6 with pip"
  pip3 install mitm6
}

function aclpwn() {
  colorecho "[+] Installing aclpwn with pip"
  pip3 install aclpwn
}

function IceBreaker() {
  colorecho "[+] Installing IceBreaker"
  apt -y install lsb-release python3-libtmux python3-libnmap python3-ipython
  pip install pipenva
  git -C /opt/tools/ clone https://github.com/DanMcInerney/icebreaker
  cd /opt/tools/icebreaker/
  ./setup.sh
  pipenv --three install
}

function Empire() {
  colorecho "[+] Installing Empire"
  export STAGING_KEY='123Soleil'
  pip install pefile
  git -C /opt/tools/ clone https://github.com/BC-SECURITY/Empire
  cd /opt/tools/Empire/setup
  ./install.sh
}

function DeathStar() {
  colorecho "[+] Installing DeathStar"
  git -C /opt/tools/ clone https://github.com/byt3bl33d3r/DeathStar
  cd /opt/tools/DeathStar
  pip3 install -r requirements.txt
}

function Sn1per() {
  colorecho "[+] Installing Sn1per"
  git -C /opt/tools/ clone https://github.com/1N3/Sn1per
  sed -i 's/read answer/echo no answer to give/' /opt/tools/Sn1per/install.sh
  sed -i 's/cp/cp -v/g' /opt/tools/Sn1per/install.sh
  sed -i 's/mkdir/mkdir -v/g' /opt/tools/Sn1per/install.sh
  sed -i 's/rm/rm -v/g' /opt/tools/Sn1per/install.sh
  sed -i 's/mv/mv -v/g' /opt/tools/Sn1per/install.sh
  sed -i 's/wget/wget -v/g' /opt/tools/Sn1per/install.sh
  sed -i 's/2> \/dev\/null//g' /opt/tools/Sn1per/install.sh
  cd /opt/tools/Sn1per/
  bash install.sh
}

function dementor(){
  colorecho "[+] Installing dementor"
  mkdir /opt/tools/dementor
  wget -O /opt/tools/dementor/dementor.py https://gist.githubusercontent.com/3xocyte/cfaf8a34f76569a8251bde65fe69dccc/raw/7c7f09ea46eff4ede636f69c00c6dfef0541cd14/dementor.py
  wget -O /usr/share/grc/conf.dementor https://raw.githubusercontent.com/ShutdownRepo/Exegol/master/confs/grc/conf.dementor
}

function ntlmscanner(){
  colorecho "[+] Installing ntlm-scanner"
  git -C /opt/tools/ clone https://github.com/preempt/ntlm-scanner
}

function subjack(){
  colorecho "[+] Installing subjack"
  go get -u -v github.com/haccer/subjack
}

function assetfinder(){
  colorecho "[+] Installing assetfinder"
  go get -u -v github.com/tomnomnom/assetfinder
}

function subfinder(){
  colorecho "[+] Installing subfinder"
  go get -u -v github.com/projectdiscovery/subfinder/cmd/subfinder
}

function gobuster(){
  colorecho "[+] Installing gobuster"
  go get -u -v github.com/OJ/gobuster
}

function amass(){
  colorecho "[+] Installing amass"
  go get -v -u github.com/OWASP/Amass/v3/...
}

function ffuf(){
  colorecho "[+] Installing ffuf"
  go get -v -u github.com/ffuf/ffuf
}

function gitrob(){
  colorecho "[+] Installing gitrob"
  go get -v -u github.com/michenriksen/gitrob
}

function shhgit(){
  colorecho "[+] Installing shhgit"
  go get -v -u github.com/eth0izzle/shhgit
}

function waybackurls(){
  colorecho "[+] Installing waybackurls"
  go get -v -u github.com/tomnomnom/waybackurls
}

function subover(){
  colorecho "[+] Installing SubOver"
  go get -v -u github.com/Ice3man543/SubOver
}

function subzy(){
  colorecho "[+] Installing subzy"
  go get -u -v github.com/lukasikic/subzy
  go install -v github.com/lukasikic/subzy
}

function gron(){
  colorecho "[+] Installing gron"
  go get -u -v github.com/tomnomnom/gron
}

function timing_attack() {
  colorecho "[+] Installing timing_attack"
  gem install timing_attack
}

function updog() {
  colorecho "[+] Installing updog"
  pip3 install updog
}

function findomain() {
  colorecho "[+] Installing findomain"
  wget -O /opt/tools/bin/findomain https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux
  chmod +x /opt/tools/bin/findomain
}

function proxychains(){
  colorecho "[+] Editing /etc/proxychains.conf for ntlmrelayx.py"
  sed -i 's/9050/1080/g' /etc/proxychains.conf
}

function grc(){
  colorecho "[+] Installing and configuring grc"
  apt -y install grc
  wget -O /etc/grc.conf https://raw.githubusercontent.com/ShutdownRepo/Exegol/master/confs/grc/grc.conf
}

function pykek(){
  colorecho "[+] Installing Python Kernel Exploit Kit (pykek) for MS14-068"
  git -C /opt/tools/ clone https://github.com/preempt/pykek
}

function autorecon(){
  colorecho "[+] Installing autorecon"
  git -C /opt/tools/ clone https://github.com/Tib3rius/AutoRecon
  cd /opt/tools/AutoRecon/
  pip3 install -r requirements.txt
}

function privexchange(){
  colorecho "[+] Installing privexchange"
  git -C /opt/tools/ clone https://github.com/dirkjanm/PrivExchange
}

function LNKUp(){
  colorecho "[+] Installing LNKUp"
  git -C /opt/tools/ clone https://github.com/Plazmaz/LNKUp
  cd /opt/tools/LNKUp
  pip install -r requirements.txt
}

function pwntools(){
  colorecho "[+] Installing pwntools"
  pip install pwntools
  pip3 install pwntools
}

function pwndbg(){
  colorecho "[+] Installing pwndbg"
  apt -y install python3.8 python3.8-dev
  git -C /opt/tools/ clone https://github.com/pwndbg/pwndbg
  cd /opt/tools/pwndbg
  ./setup.sh
  echo 'set disassembly-flavor intel' >> ~/.gdbinit
}

function darkarmour(){
  colorecho "[+] Installing darkarmour"
  git -C /opt/tools/ clone https://github.com/bats3c/darkarmour
  cd /opt/tools/darkarmour
  apt -y install mingw-w64-tools mingw-w64-common g++-mingw-w64 gcc-mingw-w64 upx-ucl osslsigncode
}

function powershell() {
  colorecho "[+] Installing powershell"
  apt -y install powershell
  mv /opt/microsoft /opt/tools/microsoft
  rm /usr/bin/pwsh
  ln -s /opt/tools/microsoft/powershell/7/pwsh /usr/bin/pwsh
}

function fzf() {
  colorecho "[+] Installing fzf"
  git -C /opt/tools/ clone --depth 1 https://github.com/junegunn/fzf.git
  cd /opt/tools/fzf
  ./install --all
}

function shellerator() {
  colorecho "[+] Installing shellerator"
  git -C /opt/tools clone https://github.com/ShutdownRepo/shellerator
}

function resources() {
  colorecho "[+] Fetching useful resources (sysinternals, LinEnum, Rubeus...)"
  # SysInternals
  wget -O /opt/resources/windows/sysinternals.zip "https://download.sysinternals.com/files/SysinternalsSuite.zip"
  unzip -d /opt/resources/windows/sysinternals /opt/resources/windows/sysinternals.zip
  rm /opt/resources/windows/sysinternals.zip
  # WinEnum.bat
  git -C /opt/resources/windows/ clone https://github.com/mattiareggiani/WinEnum
  # pspy
  mkdir -p /opt/resources/linux/pspy
  wget -O /opt/resources/linux/pspy/pspy32 "https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32"
  wget -O /opt/resources/linux/pspy/pspy64 "https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64"
  wget -O /opt/resources/linux/pspy/pspy32s "https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32s"
  wget -O /opt/resources/linux/pspy/pspy64s "https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64s"
  # linPEAS, winPEAS
  git -C /opt/resources/ clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite
  mv /opt/resources/privilege-escalation-awesome-scripts-suite/linPEAS /opt/resources/linux
  mv /opt/resources/privilege-escalation-awesome-scripts-suite/winPEAS /opt/resources/windows
  rm -r /opt/resources/privilege-escalation-awesome-scripts-suite
  # linux smart enumeration (lse.sh)
  wget -O /opt/resources/linux/linux-smart-enumeration.sh "https://github.com/diego-treitos/linux-smart-enumeration/raw/master/lse.sh"
  # LinEnum.sh
  wget -O /opt/resources/linux/LinEnum.sh "https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh"
  # linux exploit suggester (les.sh)
  wget -O /opt/resources/linux/linux-exploit-suggester.sh "https://raw.githubusercontent.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh"
  # mimikatz
  wget -O /opt/resources/windows/mimikatz.zip "https://github.com/gentilkiwi/mimikatz/releases/download/2.2.0-20200308/mimikatz_trunk.zip"
  unzip -d /opt/resources/windows/mimikatz /opt/resources/windows/mimikatz.zip
  rm /opt/resources/windows/mimikatz.zip
  # PowerSploit
  git -C /opt/resources/windows/ https://github.com/PowerShellMafia/PowerSploit
  # PrivescCheck (Windows)
  git -C /opt/resources/windows/ https://github.com/itm4n/PrivescCheck
}

function end_message() {
  colorecho "[+] Installation is done..."
  colorecho "You can use the following aliases on your host to build, run, open a shell, stop the container"
  colorecho "\talias exegol-build='docker build --tag exegol /PATH/TO/Exegol/'"
  colorecho "\talias exegol-run='docker run --interactive --tty --detach --network host --volume /PATH/TO/Exegol/shared-volume:/share --name exegol exegol'"
  colorecho "\talias exegol-shell='docker exec -it exegol zsh'"
  colorecho "\talias exegol-stop='docker stop exegol && docker rm exegol'"
}

function main(){
  update
  apt_packages
  filesystem
  ohmyzsh
  banners
  aliases
  dependencies
  grc
  Responder
  Sublist3r
  ReconDog
  CloudFail
  OneForAll
  EyeWitness
  wafw00f
  #JSParser
  LinkFinder
  SSRFmap
  fuxploider
  CORScanner
  Blazy
  XSStrike
  Bolt
  CrackMapExec
  sprayhound
  BloodHound
  #mitm6_sources
  mitm6
  aclpwn
  IceBreaker
  Empire
  DeathStar
  Sn1per
  dementor
  ntlmscanner
  Impacket
  proxychains
  pykek
  lsassy
  subjack
  assetfinder
  subfinder
  gobuster
  amass
  ffuf
  gitrob
  shhgit
  waybackurls
  subover
  subzy
  gron
  timing_attack
  updog
  findomain
  autorecon
  privexchange
  pwntools
  pwndbg
  darkarmour
  powershell
  fzf
  shellerator
  resources
  end_message
}

if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user" 2>&1
  exit 1
else
  echo "[!] Careful : this script is supposed to be run inside a docker/VM, do not run this on your host. You are warned :)"
  echo "[*] Sleeping 10 seconds, just in case... You can still stop this"
  sleep 10
  main "$@"
fi
