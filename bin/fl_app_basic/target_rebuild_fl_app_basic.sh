# shellcheck disable=SC2088

APP_FOLDER="$TGT_PARENT_FOLDER/$APP_NAME"
echo -e "\nWarning! All bellow variables must exist and be valid!"
echo "  APP_NAME: $APP_NAME"
echo "  TGT_PARENT_FOLDER: $TGT_PARENT_FOLDER"
echo ""

echo -e "\n\nArguments: $*"

#MSG="WARNING! Folder '$APP_FOLDER' will be destroyed and rebuild from template!\n Are you sure that you wish to continue with the install?"
#while true; do
#    read -p "$MSG" answer
#    case $answer in
#        [Yy]* ) break;;
#        [Nn]* ) echo "Abort installation..."; exit;;
#        * ) echo "Please answer yes or no.";;
#    esac
#done

echo "Continue with the installation..."
rm -rf "$APP_FOLDER"

echo -e "\n***\n*** Create new flutter app...\n***"
flutter create -t skeleton "$APP_FOLDER"

rm "$APP_FOLDER"/lib/main.dart
rm "$APP_FOLDER"/lib/src/app.dart
rm -rf "$APP_FOLDER"/lib/src/settings
rm -rf "$APP_FOLDER"/lib/src/sample_feature
rm "$APP_FOLDER"/l10n.yaml
rm -rf "$APP_FOLDER"/lib/src/localization
mkdir -p "$APP_FOLDER"/assets/files

LOOK_FOR_START='  flutter_localizations:'
LOOK_FOR_END='sdk: flutter'
REPLACE_WITH=' \
  intl: ^0.17.0 \
  equatable: ^2.0.3 \
  flutter_bloc: ^8.0.1 \
  http: ^0.13.4 \
  dartz: ^0.10.0 \
  get_it: ^7.2.0 \
  json_serializable: ^6.1.1 \
  freezed: ^1.1.0 \
  freezed_annotation: ^1.1.0 \
  build_runner: ^2.1.5 \
  json_annotation: ^4.4.0 \
  mockingjay: ^0.2.0 \
  confirm_dialog: ^1.0.1 \
  shared_preferences: ^2.0.13'
sed -i '' "
/$LOOK_FOR_START/ {
	N
	/\n.*$LOOK_FOR_END/ {
		s/$LOOK_FOR_START.*\n.*$LOOK_FOR_END/$REPLACE_WITH/
	}
}" "$APP_FOLDER"/pubspec.yaml

LOOK_FOR='dev_dependencies:'
REPLACE_WITH='dev_dependencies: \
  integration_test: \
    sdk: flutter'
sed -i '' s%"$LOOK_FOR"%"$REPLACE_WITH"%g "$APP_FOLDER"/pubspec.yaml

LOOK_FOR='flutter_lints: ^1.0.0'
REPLACE_WITH='flutter_lints: ^1.0.4 \
  mocktail: ^0.2.0 \
  bloc_test: ^9.0.3'
sed -i '' s%"$LOOK_FOR"%"$REPLACE_WITH"%g "$APP_FOLDER"/pubspec.yaml

LOOK_FOR_START='uses-material-design: true'
LOOK_FOR_END='- assets\/images\/'
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
REPLACE_WITH='uses-material-design: true

  assets:
    # Add assets from the images directory to the application.
    - assets\/images\/
    - assets\/files\/'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/s" "$APP_FOLDER"/pubspec.yaml

cd "$APP_FOLDER" || exit
pwd

echo -e "\n***\n*** Git commit...\n***"
git init; git add .; git commit -m "initial (flutter template)"; git status

echo -e "\n***\n*** Run mason make...\n***"
cd - || exit
pwd
mason make fl_app_basic --on-conflict overwrite \
  -o "$APP_FOLDER" \
  -c bricks/fl_app_basic/config_"$APP_NAME".json

echo -e "\n***\n*** Run mason make (common) ...\n***"
mason make fl_common --on-conflict overwrite \
  -o "$APP_FOLDER" \
  --app_path $APP_FOLDER \
  --app_name $APP_NAME

cd "$APP_FOLDER" || exit
pwd

echo -e "\n****\n*** add to .gitignore file...\n***"
echo "
# ITG additions
.notes
.idea
/.iTGTFetup.log
.mason/

## Private info....!
secrets.dart
app_private_config.dart" >> .gitignore

echo -e "\n***\n*** Run flutter pub get...\n***"
flutter pub get

echo -e "\n***\n*** Other...\n***"
rm "$APP_FOLDER"/.idea/runConfigurations/main_dart.xml

if [ $# -gt 0 ]
then
  echo -e "\n***\n*** Build features...\n***"
  for fname in "$@"; do
    echo -e "  *** build feature: $fname ***\n"
    cd - || exit
    pwd
    FEATURE=$fname
    source bin/fl_feature/target_upd_fl_feature.sh
  done
fi

echo -e "\n***\n*** Git commit...\n***"
git add .; git commit -m "initial (itg template)"; git status
