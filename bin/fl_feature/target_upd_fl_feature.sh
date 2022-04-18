# TODO: refactor ot - now just remove last char
singular_form_for() {
  var1=$(sed 's/.\{1\}$//' <<< "$1")
  echo $var1
}

echo -e "\n***\n*** Build feature $FEATURE for $APP_FOLDER...\n***"
APP_FOLDER="$TGT_PARENT_FOLDER/$APP_NAME"
echo -e "\nWarning! All bellow variables must exist and be valid!"
echo "  APP_NAME: $APP_NAME"
echo "  TGT_PARENT_FOLDER: $TGT_PARENT_FOLDER"
echo ""
#FEATURE_PC=${FEATURE}
#FEATURE_PC=$(echo "$FEATURE" | tr '[:lower:]' '[:upper:]')
FEATURE_PC=$(echo "$FEATURE" | perl -ne 'print ucfirst')
FEATURE_CC_SINGULAR=$(singular_form_for "$FEATURE")
FEATURE_PC_SINGULAR=$(singular_form_for $FEATURE_PC)
echo "CamelCase Feature name: $FEATURE"
echo "PascalCase Feature name: $FEATURE_PC"
echo "CamelCase Singular Feature name: $FEATURE_CC_SINGULAR"
echo "PascalCase Singular Feature name: $FEATURE_PC_SINGULAR"

echo "use as source the cultivation_chambers"
exit

echo -e "\n***\n*** Run mason make...\n***"
mason make fl_feature --on-conflict overwrite \
  -o "$APP_FOLDER" \
  -c bricks/fl_feature/config_"$FEATURE".json \
  --app_name "$APP_NAME"

echo -e "\n***\n*** Do replacements...\n***"
# temp solution until issue solved with mason and not replace vars in $FEATURE_repository_impl.dart
sed -i '' "s%{{#snakeCase}}{{name_plural}}{{/snakeCase}}%$FEATURE%g" \
  "$APP_FOLDER"/lib/src/features/$FEATURE/data/$FEATURE\_repository_impl.dart
sed -i '' "s%{{#snakeCase}}{{name_singular}}{{/snakeCase}}%$FEATURE_CC_SINGULAR%g" \
  "$APP_FOLDER"/lib/src/features/$FEATURE/data/$FEATURE\_repository_impl.dart
sed -i '' "s%{{#pascalCase}}{{name_plural}}{{/pascalCase}}%$FEATURE_PC%g" \
  "$APP_FOLDER"/lib/src/features/$FEATURE/data/$FEATURE\_repository_impl.dart
sed -i '' "s%{{#pascalCase}}{{name_singular}}{{/pascalCase}}%$FEATURE_PC_SINGULAR%g" \
  "$APP_FOLDER"/lib/src/features/$FEATURE/data/$FEATURE\_repository_impl.dart
sed -i '' "s%&#x27;&#x27;%''%g" \
  "$APP_FOLDER"/lib/src/features/$FEATURE/presentation/add_edit/bloc/$FEATURE\_item_add_edit_bloc.dart
sed -i '' "s%&#x27;&#x27;%''%g" \
  "$APP_FOLDER"/lib/src/features/$FEATURE/presentation/add_edit/bloc/$FEATURE\_item_add_edit_state.dart
# Temp fix empty lines
sed -i '' "N;N;N;s%\*\*\/\/\n.*\nclass%**//\nclass%g" \
  "$APP_FOLDER"/lib/src/features/$FEATURE/presentation/main/$FEATURE\_list_item.dart
# Temp fix empty lines - TODO: Why sed is not working?
#sed -i '' "N;N;N;s%description,\n\s{4}%description,%g" \
perl -i -p0e "s/,\n\s{4}\n{2}/,/g" \
  "$APP_FOLDER"/lib/src/features/$FEATURE/data/$FEATURE\_model.dart

echo -e "\n***\n*** Update .idea...\n***"
#LOOK_FOR_START="      <item itemvalue=\x22Flutter Test.app basic integration tests\x22 \/>"
#LOOK_FOR_END="<item itemvalue=\x22Flutter Test.tests in test folder\x22 \/>"
#LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
#REPLACE_WITH=$(cat bin\/fl_feature\/template_idea_integration_tests.txt)
#perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/s" \
#  "$APP_FOLDER"/.idea/workspace.xml

echo -e "  *** Run Configuration - delete if already exist..."
LOOK_FOR="\n      <item itemvalue=\x22Flutter Test.app $FEATURE integration tests\x22 \/>"
perl -i -p0e "s/$LOOK_FOR//" \
  "$APP_FOLDER"/.idea/workspace.xml

echo -e "  *** Run Configuration - add..."
LOOK_FOR="      <item itemvalue=\x22Flutter Test.app basic integration tests\x22 \/>"
REPLACE_WITH=$(cat bin\/fl_feature\/template_idea_integration_tests.txt)
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/" \
  "$APP_FOLDER"/.idea/workspace.xml

echo -e "  *** Replace feature name occurrences..."
perl -i -p0e "s/{feature_name}/$FEATURE/g" \
  "$APP_FOLDER"/.idea/workspace.xml

echo -e "\n***\n*** Update injection_container.dart...\n***"

echo -e "  *** Imports - delete if already exist..."
LOOK_FOR_START="\n\/\/\*\* $FEATURE_PC feature - imports start \*\*\/\/"
LOOK_FOR_END="\/\/\*\* $FEATURE_PC feature - imports end \*\*\/\/\n"
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR//s" \
  "$APP_FOLDER"/lib/src/app/injection_container.dart

echo -e "  *** Imports - add..."
LOOK_FOR='\/\/\*\* imports \*\*\/\/'
REPLACE_WITH=$(cat bin\/fl_feature\/template_injection_imports.txt)
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  "$APP_FOLDER"/lib/src/app/injection_container.dart

echo -e "  *** Registrations - delete if already exist..."
LOOK_FOR_START="\n  \/\/\*\* $FEATURE_PC feature - registrations start \*\*\/\/"
LOOK_FOR_END="\/\/\*\* $FEATURE_PC feature - registrations end \*\*\/\/\n"
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR//s" \
  "$APP_FOLDER"/lib/src/app/injection_container.dart

echo -e "  *** Registrations - add..."
LOOK_FOR='  \/\/\*\* registrations \*\*\/\/'
REPLACE_WITH=$(cat bin\/fl_feature\/template_injection_registrations.txt)
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  "$APP_FOLDER"/lib/src/app/injection_container.dart

echo -e "  *** Replace feature name occurrences..."
perl -i -p0e "s/{feature_name}/$FEATURE/g" \
  "$APP_FOLDER"/lib/src/app/injection_container.dart
perl -i -p0e "s/{feature_name_pc}/$FEATURE_PC/g" \
  "$APP_FOLDER"/lib/src/app/injection_container.dart

echo -e "\n***\n*** Update home_page_test.dart...\n***"

echo -e "  *** Imports - feature test - delete if already exist..."
LOOK_FOR_START="\n\/\/\*\* $FEATURE_PC feature test - imports start \*\*\/\/"
LOOK_FOR_END="\/\/\*\* $FEATURE_PC feature test - imports end \*\*\/\/\n"
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR//s" \
  "$APP_FOLDER"/test/features/home/home_page_test.dart

echo -e "  *** Imports - feature test - add..."
LOOK_FOR='\/\/\*\* imports \*\*\/\/'
REPLACE_WITH=$(cat bin\/fl_feature\/template_home_page_test_imports.txt)
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  "$APP_FOLDER"/test/features/home/home_page_test.dart

echo -e "  *** Imports - common test - delete if already exist..."
LOOK_FOR_START="\n\/\/\*\* common imports start \*\*\/\/"
LOOK_FOR_END="\/\/\*\* common imports end \*\*\/\/\n"
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR//s" \
  "$APP_FOLDER"/test/features/home/home_page_test.dart

echo -e "  *** Imports - common test - add..."
LOOK_FOR='\/\/\*\* imports \*\*\/\/'
REPLACE_WITH=$(cat bin\/fl_feature\/template_home_page_test_imports_common.txt)
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  "$APP_FOLDER"/test/features/home/home_page_test.dart

echo -e "  *** Button test - delete if already exist..."
LOOK_FOR_START="\n    \/\/\*\* $FEATURE_PC feature - button test start \*\*\/\/"
LOOK_FOR_END="\/\/\*\* $FEATURE_PC feature - button test end \*\*\/\/\n"
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR//s" \
  "$APP_FOLDER"/test/features/home/home_page_test.dart

echo -e "  *** Button test - add..."
LOOK_FOR='    \/\/\*\* feature buttons tests \*\*\/\/'
REPLACE_WITH=$(cat bin\/fl_feature\/template_home_page_test_button.txt)
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  "$APP_FOLDER"/test/features/home/home_page_test.dart

echo -e "  *** Replace feature name occurrences..."
perl -i -p0e "s/{feature_name}/$FEATURE/g" \
  "$APP_FOLDER"/test/features/home/home_page_test.dart
perl -i -p0e "s/{feature_name_pc}/$FEATURE_PC/g" \
  "$APP_FOLDER"/test/features/home/home_page_test.dart
perl -i -p0e "s/{app_name_cc}/$APP_NAME/g" \
  "$APP_FOLDER"/test/features/home/home_page_test.dart

echo -e "\n***\n*** Update home_page.dart...\n***"

echo -e "  *** Imports - feature - delete if already exist..."
LOOK_FOR_START="\n\/\/\*\* $FEATURE_PC feature - imports start \*\*\/\/"
LOOK_FOR_END="\/\/\*\* $FEATURE_PC feature - imports end \*\*\/\/\n"
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR//s" \
  "$APP_FOLDER"/lib/src/features/home/home_page.dart

echo -e "  *** Imports - feature - add..."
LOOK_FOR='\/\/\*\* imports \*\*\/\/'
REPLACE_WITH=$(cat bin\/fl_feature\/template_home_page_imports.txt)
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  "$APP_FOLDER"/lib/src/features/home/home_page.dart

echo -e "  *** Imports - common - delete if already exist..."
LOOK_FOR_START="\n\/\/\*\* common imports start \*\*\/\/"
LOOK_FOR_END="\/\/\*\* common imports end \*\*\/\/\n"
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR//s" \
  "$APP_FOLDER"/lib/src/features/home/home_page.dart

echo -e "  *** Imports - common - add..."
LOOK_FOR='\/\/\*\* imports \*\*\/\/'
REPLACE_WITH=$(cat bin\/fl_feature\/template_home_page_imports_common.txt)
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  "$APP_FOLDER"/lib/src/features/home/home_page.dart

echo -e "  *** Button - delete if already exist..."
LOOK_FOR_START="\n                \/\/\*\* $FEATURE_PC feature - button start \*\*\/\/"
LOOK_FOR_END="\/\/\*\* $FEATURE_PC feature - button end \*\*\/\/\n"
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR//s" \
  "$APP_FOLDER"/lib/src/features/home/home_page.dart

echo -e "  *** Button - add..."
LOOK_FOR='                \/\/\*\* feature buttons \*\*\/\/'
REPLACE_WITH=$(cat bin\/fl_feature\/template_home_page_button.txt)
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  "$APP_FOLDER"/lib/src/features/home/home_page.dart

echo -e "  *** Replace feature name occurrences..."
perl -i -p0e "s/{feature_name}/$FEATURE/g" \
  "$APP_FOLDER"/lib/src/features/home/home_page.dart
perl -i -p0e "s/{feature_name_pc}/$FEATURE_PC/g" \
  "$APP_FOLDER"/lib/src/features/home/home_page.dart

echo -e "  *** Fix const..."
perl -i -p0e "s/children: const \[/children: \[/g" \
  "$APP_FOLDER"/lib/src/features/home/home_page.dart

echo -e "\n***\n*** Update itg_app_custom.dart...\n***"

echo -e "  *** Translations en - feature - delete if already exist..."
LOOK_FOR_START="\n    \/\/\*\* $FEATURE_PC feature translations en start \*\*\/\/"
LOOK_FOR_END="\/\/\*\* $FEATURE_PC feature translations en end \*\*\/\/\n"
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR//s" \
  "$APP_FOLDER"/lib/src/app/itg_app_custom.dart

echo -e "  *** Translations en - feature - add..."
LOOK_FOR='    \/\/\*\* translations en \*\*\/\/'
REPLACE_WITH=$(cat bin\/fl_feature\/template_translations_en.txt)
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  "$APP_FOLDER"/lib/src/app/itg_app_custom.dart

echo -e "  *** Translations el - feature - delete if already exist..."
LOOK_FOR_START="\n    \/\/\*\* $FEATURE_PC feature translations el start \*\*\/\/"
LOOK_FOR_END="\/\/\*\* $FEATURE_PC feature translations el end \*\*\/\/\n"
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR//s" \
  "$APP_FOLDER"/lib/src/app/itg_app_custom.dart

echo -e "  *** Translations el - feature - add..."
LOOK_FOR='    \/\/\*\* translations el \*\*\/\/'
REPLACE_WITH=$(cat bin\/fl_feature\/template_translations_el.txt)
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  "$APP_FOLDER"/lib/src/app/itg_app_custom.dart

echo -e "  *** Replace feature name occurrences..."
perl -i -p0e "s/{feature_name}/$FEATURE/g" \
  "$APP_FOLDER"/lib/src/app/itg_app_custom.dart
perl -i -p0e "s/{feature_name_pc}/$FEATURE_PC/g" \
  "$APP_FOLDER"/lib/src/app/itg_app_custom.dart
perl -i -p0e "s/{feature_name_pc_singular}/$FEATURE_PC_SINGULAR/g" \
  "$APP_FOLDER"/lib/src/app/itg_app_custom.dart

echo -e "\n***\n*** Run build_runner...\n***"
cd "$APP_FOLDER" || exit
pwd
flutter pub run build_runner build
