#!/bin/sh

scriptname=$0

usage () {
	cat <<EOF
Useage: $scriptname [-s] [-r] appDirectory userName remoteHost
	-s  starts the app after sync
	-r  restarts currently running app after sync
EOF
	exit 0
}

appdir=$2
user=$3
remote=$4

if [ "$1" = "-r" ]
then
	sr="restart"
elif [ "$1" = "-s" ]
then 
	sr="start"
else
	usage
fi


rsync -av ${appdir} ${remote}:/home/${user} && 

echo \
"
#!/bin/sh\n
rsync -av /home/${user}/${appdir} /home/pool && \n
chown -R pool:pool /home/pool/${appdir} && \n
rm -rf /home/${user}/${appdir}"\
> ./dep.sh &&

echo \
"
#!/bin/sh\n
export NVM_DIR="/home/pool/.nvm" && \n
[ -s \"\$NVM_DIR/nvm.sh\" ] && . \"\$NVM_DIR/nvm.sh\" && \n
nvm use 8 && \n
forever ${sr} init.js"\
> ./frvr.sh &&

scp ./dep.sh ${remote}:/home/${user}/ &&
scp ./frvr.sh ${remote}:/home/${user}/ &&

sudoDep='
sudo chmod +x /home/'"'${user}'"'/dep.sh && \ 
sudo chmod +x /home/'"'${user}'"'/frvr.sh && \ 
sudo mv /home/'"'${user}'"'/frvr.sh /home/pool/'"'${appdir}'"'/frvr.sh && \ 
sudo /home/'"'${user}'"'/dep.sh && \
sudo rm /home/'"'${user}'"'/dep.sh
cd /home/pool/'"'${appdir}'"' &&
sudo -H -u pool "./frvr.sh"
'


ssh -t ${remote} "${sudoDep}" &&


rm dep.sh frvr.sh
