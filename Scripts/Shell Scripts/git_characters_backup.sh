git checkout master

git add TC_Play_Auth.sql
git add TC_Play_Characters.sql

NOW=$(date +"%Y%m%d")
git commit -m "Backup characters $NOW"

git push
psychobilli