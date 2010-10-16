echo "Updating Scarlet"
echo ""

cd /var/scarlet/scarlet 

echo "Stashing changes"

git stash > /dev/null

echo "Pulling from github"

git pull > /dev/null

echo "Getting new gems"
bundle install --deployment --without test development duke > /dev/null

echo "Removing cached files"
echo -n -e '\t'
rm --verbose --force public/javascripts/all.js
echo -n -e '\t'
rm --verbose --force public/stylesheets/all.css

echo "Running database migration"
rake db:migrate RAILS_ENV=production > /dev/null

echo "Restarting server"
touch tmp/restart.txt

wget --no-verbose -O/dev/null http://localhost

