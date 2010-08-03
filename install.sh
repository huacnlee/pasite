cp config/database.yml.default config/database.yml
sudo apt-get install python
sudo apt-get install python-setuptools
sudo easy_install pygments
wget http://www.sphinxsearch.com/downloads/sphinx-0.9.9.tar.gz
tar zxf sphinx-0.9.9.tar.gz
cd sphinx-0.9.9
./configure
make && sudo make install
rm -R sphinx-0.9.9
rm sphinx-0.9.9.tar.gz
sudo mkdir -p /var/db/sphinx/pasite_production
sudo gem install thinking-sphinx
