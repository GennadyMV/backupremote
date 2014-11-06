#!/bash/sh
# Скрипт обновляет репозиторий из бекапа

DIR="/var/backup/marilari/*"
BACKUP=`ls -d $DIR -t | head -1`
echo $BACKUP
rm -rvf /tmp/marilari/*
rm -rvf /tmp/marilari/.git
rm -rvf /tmp/marilari/.gitignore
cd /tmp/marilari/
git init
git remote add origin $MARILARI_GIT
git pull origin master
tar -xvf $BACKUP -C /tmp/marilari
cd /tmp/marilari
git add .
git commit -m backup2repo
git push origin master