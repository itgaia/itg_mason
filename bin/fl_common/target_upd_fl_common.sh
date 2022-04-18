APP_FOLDER="$TGT_PARENT_FOLDER/$APP_NAME"
echo -e "\nWarning! All bellow variables must exist and be valid!"
echo "  APP_NAME: $APP_NAME"
echo "  TGT_PARENT_FOLDER: $TGT_PARENT_FOLDER"
echo ""

echo -e "\n***\n*** Run mason make...\n***"
mason make fl_common --on-conflict overwrite \
  -o "$APP_FOLDER" \
  --app_path $APP_FOLDER \
  --app_name $APP_NAME
