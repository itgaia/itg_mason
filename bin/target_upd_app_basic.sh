# shellcheck disable=SC2088

MSG="WARNING! Folder '$TARGET' will be destroyed and rebuild from template!\nAre you sure that you wish to continue with the install?"

while true; do
    read -p "$MSG" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) echo "Abort installation..."; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

#echo "WARNING! Folder '$TARGET' will be destroyed and rebuild from template!\nAre you sure that you wish to continue with the install?"
#select yn in "Yes" "No"; do
#    case $yn in
#        Yes ) break;;
#        No ) echo "Abort installation..."; exit;;
#    esac
#done

echo "Continue with the installation..."
rm -rf $TGT
rm $TGT/lib/main.dart
rm $TGT/lib/src/app.dart
rm -rf $TGT/lib/src/settings
rm -rf $TGT/lib/src/sample_feature

#mason make app_basic --on-conflict overwrite \
#  -o "$TARGET" \
#  -c bricks/app_basic/config.json

