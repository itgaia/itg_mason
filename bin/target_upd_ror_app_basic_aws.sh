# shellcheck disable=SC2088
# shellcheck disable=SC2164

APP_FOLDER="$TGT_PARENT_FOLDER/$APP_NAME"
TGT_RAILS_VER="6.0.4.4"
TGT_RUBY_VER="3.0.3"

MSG="WARNING! Folder '$APP_FOLDER' will be destroyed and rebuild from template!\nAre you sure that you wish to continue with the install?"

while true; do
    read -p "$MSG" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) echo "Abort installation..."; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo "Continue with the installation..."
rm -rf $APP_FOLDER

echo -e "\n***\n*** Create new rails app...\n***"
rails _"$TGT_RAILS_VER"_ new $APP_FOLDER --webpack --skip-test --skip-bundle --database=postgresql --skip-turbolinks --skip-active-storage
#rails _"$TGT_RAILS_VER"_ new $APP_FOLDER --skip-test --skip-bundle --database=postgresql --skip-turbolinks --skip-active-storage
#rails _"$TGT_RAILS_VER"_ new $APP_FOLDER --skip-webpack-install --skip-test --skip-bundle --database=postgresql --skip-turbolinks --skip-active-storage
#rails _"$TGT_RAILS_VER"_ new $APP_FOLDER --skip-test --skip-bundle --skip-turbolinks --skip-active-storage
#rails new $APP_FOLDER --skip-test --skip-bundle --skip-turbolinks --skip-active-storage

echo -e "\n***\n*** Git commit...\n***"
pwd
cd $APP_FOLDER
pwd
git add .; git commit -m "initial (rails template)"; git status
cd -

echo -e "\n***\n*** Run mason make...\n***"
mason make ror_app_basic_aws --on-conflict overwrite \
  -o "$APP_FOLDER" \
  -c bricks/ror_app_basic_aws/config.json

cd $APP_FOLDER
pwd

echo -e "\n***\n*** Rails generate credentials..\n***"
EDITOR="code --wait" bin/rails credentials:edit

#echo -e "\n***\n*** Rails webpacker...\n***"
#yarn add webpack@4.37.0
#yarn add -D webpack@^4.37.0
yarn add -D webpack@^4.46.0
yarn add webpack-cli@4.9.2
yarn add node-sass
yarn add babel-loader
yarn add schema-utils

echo -e "\n***\n*** Rails generate home...\n***"
rails generate controller home index
sed -i '' "s%get 'home/index'%get 'home/index'\n  root 'home#index'%g" "$APP_FOLDER"/config/routes.rb

echo -e "\n****\n*** add to .gitignore file...\n***"
echo "
# ITG additions
.notes
.idea
/.iTGTFetup.log
.mason/

## Private info
secrets.dart
app_private_config.dart" >> .gitignore

echo -e "\n***\n*** Add platform Ruby to lock file...\n***"
bundle lock --add-platform ruby

echo -e "\n***\n*** Select Ruby version...\n***"
rbenv local
rbenv install $TGT_RUBY_VER -s
rbenv local $TGT_RUBY_VER
rbenv local

echo -e "\n***\n*** Gemfile set Ruby version...\n***"
sed -i '' "s%ruby '3.0.3'%ruby '$TGT_RUBY_VER'%g" "$APP_FOLDER"/Gemfile
sed -i '' "s%ruby \"3.0.3\"%ruby \"$TGT_RUBY_VER\"%g" "$APP_FOLDER"/Gemfile

echo -e "\n***\n*** bundle add platforms...\n***"
bundle lock --add-platform x86_64-linux

echo -e "\n***\n*** Run bundle install...\n***"
bundle install --without production

echo -e "\n***\n*** AWS EB commands...\n***"
#eb init test -r eu-central-1 -p Ruby -k aws-eb
eb init test -r eu-central-1 -p "arn:aws:elasticbeanstalk:eu-central-1::platform/Ruby 3.0 running on 64bit Amazon Linux 2/3.4.4" -k aws-eb
eb use sample-env-ruby
eb status

echo -e "\n***\n*** Git commit...\n***"
git add .; git commit -m "initial (itg template)"; git status
