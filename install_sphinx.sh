cp config/sphinx.yml.example config/sphinx.yml
sudo RAILS_ENV=production rake ts:stop
sudo RAILS_ENV=production rake ts:config
sudo RAILS_ENV=production rake ts:index
sudo RAILS_ENV=production rake ts:start
