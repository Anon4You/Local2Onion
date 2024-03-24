#!/bin/bash

pkgs=(php tor pv curl)
for p in "${pkgs[@]}"; do 
  if ! hash ${p} > /dev/null 2>&1; then
    printf "\n\e[32m${p} not found installing....\n\e[0m"
    apt install ${p} -y > /dev/null 2>&1
  fi 
done
echo instaling local2onion...

curl -sLO https://github.com/Anon4You/Local2Onion/raw/main/files/torrc
curl -sLO https://github.com/Anon4You/Local2Onion/raw/main/files/l2o

mv torrc $PREFIX/etc/tor/torrc
mv l2o $PATH/local2onion

chmod +x $PATH/local2onion
if [[ -d $PREFIX/var/lib/tor/hidden_service/ ]];then 
  printf "\n 
now you can launch this script by typing \e[31mlocal2onion\e[0m from any directory
"
else
  echo tor hidden hidden_service directory not found creating...
  mkdir -p $PREFIX/var/lib/tor/hidden_service/ 
  printf "\nnow you can launch this script by typing \e[31mlocal2onion\e[0m from any directory"
fi 

