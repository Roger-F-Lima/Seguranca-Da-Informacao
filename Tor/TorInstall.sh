RELEASE='trusty'
IS_EXIT=false
INSTALL_ARM=true

cat << "EOF"


 _____            ___     _
|_   _|__ _ _ ___| _ \___| |__ _ _  _   __ ___
  | |/ _ \ '_|___|   / -_) / _` | || |_/ _/ _ \
  |_|\___/_|     |_|_\___|_\__,_|\_, (_)__\___/
                                 |__/

              [Relay Setup]
Esse script vai pedir sua senha sudo.
----------------------------------------------------------------------
EOF

echo "Adicionando repositorio apt..."
sudo touch /etc/apt/sources.list.d/tor.list
echo "deb http://deb.torproject.org/torproject.org $RELEASE main" | sudo tee /etc/apt/sources.list.d/tor.list > /dev/null
echo "deb-src http://deb.torproject.org/torproject.org $RELEASE main" | sudo tee --append /etc/apt/sources.list.d/tor.list > /dev/null

echo "Adicionando chave gpg..."
gpg --keyserver keys.gnupg.net --recv A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 > /dev/null
gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add - > /dev/null

echo "Atualizando lista de pacotes..."
sudo apt-get -y update > /dev/null

echo "Instalando NTP..."
sudo apt-get -y install ntpdate > /dev/null
sudo ntpdate pool.ntp.org > /dev/null

if $INSTALL_ARM
then
  echo "Instalando ARM..."
  sudo apt-get -y install tor-arm > /dev/null
fi

echo "Instalando Tor..."
sudo apt-get -y install tor deb.torproject.org-keyring > /dev/null

echo "Setando configuração Tor..."
cat << 'EOF' | sudo tee /etc/tor/torrc > /dev/null
SocksPort 0
RunAsDaemon 1
ORPort 9001
Nickname Cebola
ContactInfo seuemail(at)exeplo(dot)com [tor-relay.co]
DirPort 9030
ExitPolicy reject *:*
DisableDebuggerAttachment 0
ControlPort 9051
CookieAuthentication 1

EOF

if $IS_EXIT
then
  echo "Downloading Exit Notice to /etc/tor/tor-exit-notice.html..."
  echo "Please edit this file and replace FIXME_YOUR_EMAIL_ADDRESS with your e-mail address!"
  echo "Also note that this is the US version. If you are not in the US please edit the file and remove the US-Only sections!"
  sudo wget -q -O /etc/tor/tor-exit-notice.html "https://raw.githubusercontent.com/flxn/tor-relay-configurator/master/misc/tor-exit-notice.html"
fi

sleep 10

echo "Recaregando configuração Tor..."
sudo killall -s SIGHUP tor

echo "Finalizando Setup"
echo "----------------------------------------------------------------------"
echo "Tor vai verificar se suas portas são acessiveis. Isso leve cerca de 20 minutos."
echo "Verificar /var/log/tor/log para qualquer entrada parecida com:"
echo "\"Self-testing indicates your ORPort is reachable from the outside. Excellent.\""
echo "----------------------------------------------------------------------"
#sleep 5
#tail -f /var/log/tor/log
