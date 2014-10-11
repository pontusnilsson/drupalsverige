#!/bin/bash
echo "This script will set shit up"
echo "Building vagrant environtment"

vagrant up

echo "Cloning Drupal"
while true; do
	read -p "Clone drupal from github? [y/n] " yn
		case $yn in
			[Yy]* )  git clone git@github.com:drupal/drupal.git drupal8/. ; break;;
				[Nn]* ) break;;
					* ) echo "Please answer yes or no.";;
						esac
					done


while true; do
	read -p "Add this site to your hostfile? (sudo access will be required). It's generally not recommended to input your root password into random scripts you find on the internet. [y/n] " yn
	        case $yn in
			        [Yy]* ) echo '192.168.50.101 drupalsverige.dev' | sudo tee -a /etc/hosts; break;;
				        [Nn]* ) break;;
					        * ) echo "Please answer yes or no.";;
						    esac
					    done

while true; do
	        read -p "Install site? [y/n] " yn
			case $yn in
				[Yy]* ) vagrant ssh -c "cd /srv/www/drupalsverige && drush site-install standard --account-mail="admin@example.com" --site-mail="admin@example.com" --account-name="admin" --account-pass="admin" --db-url=mysql://drupal:drupal@localhost/drupal --site-name=drupalsverige -y"; break;;
					[Nn]* ) break;;
						* ) echo "Please answer yes or no.";;
					esac
				done
