git checkout master

git add TC_Play_Auth.sql
git add TC_Play_Characters.sql

NOW=$(date +"%Y%m%d")
git commit -m "Backup characters $NOW"

echo "* * * Access the server and run the following command, then follow the prompts."
echo "cd ~/workspace/'Wotlk Characters Backup'/git push"