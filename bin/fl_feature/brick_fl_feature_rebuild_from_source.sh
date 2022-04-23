SRCAPPNAME="itg_mush_manager"
SRC="$HOME/dev/flutter/md/$SRCAPPNAME"
SRCF="$SRC/lib/src/features"
SRCT="$SRC/test"
SRCTF="$SRCT/features"

TGTP="$HOME/dev/tools/itg_mason/bricks/fl_feature"
TGTBT="$TGTP/backup-temp"

TGT="$TGTP/__brick__"
TGTF="$TGT/lib/src/features"
TGTT="$TGT/test"
TGTTF="$TGTT/features"
NMP="{{name_plural.snakeCase()}}"

echo -e "*** Variables..."
echo "  SRCAPPNAME: $SRCAPPNAME"
echo "  SRC: $SRC"
echo "  TGT: $TGT"
echo "  TGTBT: $TGTBT"
echo ""


#MSG="WARNING! Folder '$TGT' will be destroyed and rebuild from source!\n Are you sure that you wish to continue with the install?"
#while true; do
#    read -p "$MSG" answer
#    case $answer in
#        [Yy]* ) break;;
#        [Nn]* ) echo "Abort installation..."; exit;;
#        * ) echo "Please answer yes or no.";;
#    esac
#done




echo "Continue with the installation..."

# Manual update files - Not auto update!
#mkdir -p $TGT/.idea/runConfigurations/app_$NMPF
#cp /Users/aaon/dev/flutter/itg/itg_client/.idea/runConfigurations/app_tasks_integration_tests.xml $TGT/.idea/runConfigurations/app_$NMPF/snakeCase}}_integration_tests.xml

#mkdir -p $TGT/integration_test/app_$NMPF
#cp $SRC/integration_test/app_test.dart $TGT/integration_test/app_$NMP\snakeCase}}_test.dart
# Replace all
#   Task -> {{#pascalCase}}{{name_singular}}{{\/pascalCase}}
#   Tasks -> {{#pascalCase}}{{name_plural}}{{\/pascalCase}}
#   task -> {{name_singular}}
#   tasks -> {{name_plural.snakeCase()}}
#   itg_client -> {{app_name}}
#   description -> {{test_field_1}}
#   notes -> {{test_field_2}}

echo "Keep manual update files..."
mkdir -p "$TGTBT/.idea/runConfigurations"
mkdir -p "$TGTBT/integration_test"
cp -p "$TGT"/.idea/runConfigurations/app_"$NMP"_integration_tests.xml "$TGTBT/.idea/runConfigurations"
cp -p "$TGT"/integration_test/app_"$NMP"_test.dart "$TGTBT/integration_test"

echo "Delete target folder '$TGT'"
rm -rf "$TGT"
mkdir -p "$TGT"

mkdir -p $TGTTF/$NMP/data
mkdir -p $TGTT/fixtures
mkdir -p $TGTTF/$NMP/domain
mkdir -p $TGTTF/$NMP/presentation/add_edit/bloc
mkdir -p $TGTTF/$NMP/presentation/main/bloc
mkdir -p $TGTTF/$NMP/presentation/show

cp $SRCTF/cultivation_chambers/cultivation_chambers_test_helper.dart $TGTTF/$NMP/$NMP\_test_helper.dart
cp $SRCT/fixtures/cultivation_chambers_fixture.json $TGTT/fixtures/$NMP\_fixture.json
cp $SRCT/fixtures/cultivation_chambers_mongo_fixture.json $TGTT/fixtures/$NMP\_mongo_fixture.json
cp $SRCT/fixtures/cultivation_chambers_response_fixture.json $TGTT/fixtures/$NMP\_response_fixture.json
cp $SRCTF/cultivation_chambers/data/cultivation_chambers_model_test.dart $TGTTF/$NMP/data/$NMP\_model_test.dart
cp $SRCTF/cultivation_chambers/data/cultivation_chambers_remote_datasource_test.dart $TGTTF/$NMP/data/$NMP\_remote_datasource_test.dart
cp $SRCTF/cultivation_chambers/data/cultivation_chambers_repository_impl_test.dart $TGTTF/$NMP/data/$NMP\_repository_impl_test.dart
cp $SRCTF/cultivation_chambers/domain/cultivation_chambers_support_test.dart $TGTTF/$NMP/domain/$NMP\_support_test.dart
cp $SRCTF/cultivation_chambers/domain/cultivation_chambers_helper_test.dart $TGTTF/$NMP/domain/$NMP\_helper_test.dart
cp $SRCTF/cultivation_chambers/domain/get_cultivation_chambers_usecase_test.dart $TGTTF/$NMP/domain/get_$NMP\_usecase_test.dart
cp $SRCTF/cultivation_chambers/domain/delete_cultivation_chambers_item_usecase_test.dart $TGTTF/$NMP/domain/delete_$NMP\_item_usecase_test.dart
cp $SRCTF/cultivation_chambers/domain/save_cultivation_chambers_item_usecase_test.dart $TGTTF/$NMP/domain/save_$NMP\_item_usecase_test.dart
cp $SRCTF/cultivation_chambers/presentation/add_edit/bloc/cultivation_chambers_item_add_edit_bloc_test.dart $TGTTF/$NMP/presentation/add_edit/bloc/$NMP\_item_add_edit_bloc_test.dart
cp $SRCTF/cultivation_chambers/presentation/add_edit/bloc/cultivation_chambers_item_add_edit_event_test.dart $TGTTF/$NMP/presentation/add_edit/bloc/$NMP\_item_add_edit_event_test.dart
cp $SRCTF/cultivation_chambers/presentation/add_edit/bloc/cultivation_chambers_item_add_edit_state_test.dart $TGTTF/$NMP/presentation/add_edit/bloc/$NMP\_item_add_edit_state_test.dart
cp $SRCTF/cultivation_chambers/presentation/add_edit/cultivation_chambers_item_add_edit_page_test.dart $TGTTF/$NMP/presentation/add_edit/$NMP\_item_add_edit_page_test.dart
cp $SRCTF/cultivation_chambers/presentation/add_edit/cultivation_chambers_item_add_edit_view_test.dart $TGTTF/$NMP/presentation/add_edit/$NMP\_item_add_edit_view_test.dart
cp $SRCTF/cultivation_chambers/presentation/main/bloc/cultivation_chambers_bloc_test.dart $TGTTF/$NMP/presentation/main/bloc/$NMP\_bloc_test.dart
cp $SRCTF/cultivation_chambers/presentation/main/bloc/cultivation_chambers_event_test.dart $TGTTF/$NMP/presentation/main/bloc/$NMP\_event_test.dart
cp $SRCTF/cultivation_chambers/presentation/main/bloc/cultivation_chambers_state_test.dart $TGTTF/$NMP/presentation/main/bloc/$NMP\_state_test.dart
cp $SRCTF/cultivation_chambers/presentation/main/cultivation_chambers_page_test.dart $TGTTF/$NMP/presentation/main/$NMP\_page_test.dart
cp $SRCTF/cultivation_chambers/presentation/main/cultivation_chambers_list_test.dart $TGTTF/$NMP/presentation/main/$NMP\_list_test.dart
cp $SRCTF/cultivation_chambers/presentation/show/cultivation_chambers_item_show_page_test.dart $TGTTF/$NMP/presentation/show/$NMP\_item_show_page_test.dart
cp $SRCTF/cultivation_chambers/presentation/show/cultivation_chambers_item_screen_test.dart $TGTTF/$NMP/presentation/show/$NMP\_item_screen_test.dart

mkdir -p $TGTF/$NMP/data
mkdir -p $TGTF/$NMP/domain
mkdir -p $TGTF/$NMP/presentation/add_edit/bloc
mkdir -p $TGTF/$NMP/presentation/main/bloc
mkdir -p $TGTF/$NMP/presentation/show

cp $SRCF/cultivation_chambers/data/cultivation_chambers_model.dart $TGTF/$NMP/data/$NMP\_model.dart
cp $SRCF/cultivation_chambers/data/cultivation_chambers_local_datasource.dart $TGTF/$NMP/data/$NMP\_local_datasource.dart
cp $SRCF/cultivation_chambers/data/cultivation_chambers_remote_datasource.dart $TGTF/$NMP/data/$NMP\_remote_datasource.dart
cp $SRCF/cultivation_chambers/data/cultivation_chambers_repository_impl.dart $TGTF/$NMP/data/$NMP\_repository_impl.dart
cp $SRCF/cultivation_chambers/domain/cultivation_chambers_repository.dart $TGTF/$NMP/domain/$NMP\_repository.dart
cp $SRCF/cultivation_chambers/domain/cultivation_chambers_support.dart $TGTF/$NMP/domain/$NMP\_support.dart
cp $SRCF/cultivation_chambers/domain/cultivation_chambers_helper.dart $TGTF/$NMP/domain/$NMP\_helper.dart
cp $SRCF/cultivation_chambers/domain/get_cultivation_chambers_usecase.dart $TGTF/$NMP/domain/get_$NMP\_usecase.dart
cp $SRCF/cultivation_chambers/domain/delete_cultivation_chambers_item_usecase.dart $TGTF/$NMP/domain/delete_$NMP\_item_usecase.dart
cp $SRCF/cultivation_chambers/domain/save_cultivation_chambers_item_usecase.dart $TGTF/$NMP/domain/save_$NMP\_item_usecase.dart
cp $SRCF/cultivation_chambers/presentation/add_edit/bloc/cultivation_chambers_item_add_edit_bloc.dart $TGTF/$NMP/presentation/add_edit/bloc/$NMP\_item_add_edit_bloc.dart
cp $SRCF/cultivation_chambers/presentation/add_edit/bloc/cultivation_chambers_item_add_edit_event.dart $TGTF/$NMP/presentation/add_edit/bloc/$NMP\_item_add_edit_event.dart
cp $SRCF/cultivation_chambers/presentation/add_edit/bloc/cultivation_chambers_item_add_edit_state.dart $TGTF/$NMP/presentation/add_edit/bloc/$NMP\_item_add_edit_state.dart
cp $SRCF/cultivation_chambers/presentation/add_edit/cultivation_chambers_item_add_edit_page.dart $TGTF/$NMP/presentation/add_edit/$NMP\_item_add_edit_page.dart
cp $SRCF/cultivation_chambers/presentation/add_edit/cultivation_chambers_item_add_edit_view.dart $TGTF/$NMP/presentation/add_edit/$NMP\_item_add_edit_view.dart
cp $SRCF/cultivation_chambers/presentation/main/bloc/cultivation_chambers_bloc.dart $TGTF/$NMP/presentation/main/bloc/$NMP\_bloc.dart
cp $SRCF/cultivation_chambers/presentation/main/bloc/cultivation_chambers_event.dart $TGTF/$NMP/presentation/main/bloc/$NMP\_event.dart
cp $SRCF/cultivation_chambers/presentation/main/bloc/cultivation_chambers_state.dart $TGTF/$NMP/presentation/main/bloc/$NMP\_state.dart
cp $SRCF/cultivation_chambers/presentation/main/cultivation_chambers_page.dart $TGTF/$NMP/presentation/main/$NMP\_page.dart
cp $SRCF/cultivation_chambers/presentation/main/cultivation_chambers_list_item.dart $TGTF/$NMP/presentation/main/$NMP\_list_item.dart
cp $SRCF/cultivation_chambers/presentation/main/cultivation_chambers_list_filter.dart $TGTF/$NMP/presentation/main/$NMP\_list_filter.dart
cp $SRCF/cultivation_chambers/presentation/show/cultivation_chambers_item_show_page.dart $TGTF/$NMP/presentation/show/$NMP\_item_show_page.dart
cp $SRCF/cultivation_chambers/presentation/show/cultivation_chambers_item_screen.dart $TGTF/$NMP/presentation/show/$NMP\_item_screen.dart

find $TGT -type f -name '*.dart' -exec sed -i '' s%$SRCAPPNAME%"{{#snakeCase}}{{app_name}}{{/snakeCase}}"%g {} +

find $TGT -type f -name '*.dart' -exec sed -i '' s%"cultivation_chambers"%"{{#snakeCase}}{{name_plural}}{{/snakeCase}}"%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%"cultivation-chambers"%"{{#paramCase}}{{name_plural}}{{\/paramCase}}"%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%"cultivationChambers"%"{{#camelCase}}{{name_plural}}{{\/camelCase}}"%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%"Cultivation Chambers"%"{{#titleCase}}{{name_plural}}{{\/titleCase}}"%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%"CultivationChambers"%"{{#pascalCase}}{{name_plural}}{{\/pascalCase}}"%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%"cultivation_chamber"%"{{#snakeCase}}{{name_singular}}{{\/snakeCase}}"%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%"cultivationChamber"%"{{#camelCase}}{{name_singular}}{{\/camelCase}}"%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%"Cultivation Chamber"%"{{#titleCase}}{{name_singular}}{{\/titleCase}}"%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%"CultivationChamber"%"{{#pascalCase}}{{name_singular}}{{\/pascalCase}}"%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%"CULTIVATION_CHAMBER"%"{{#upperCase}}{{name_singular}}{{\/upperCase}}"%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%"CULTIVATION_CHAMBERS"%"{{#upperCase}}{{name_plural}}{{\/upperCase}}"%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%CCB%"{{#upperCase}}{{abbreviation}}{{/upperCase}}B"%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%CCRDS%"{{#upperCase}}{{abbreviation}}{{/upperCase}}RDS"%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%CCRI%"{{#upperCase}}{{abbreviation}}{{/upperCase}}RI"%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%CCS%"{{#upperCase}}{{abbreviation}}{{/upperCase}}S"%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%CCI%"{{#upperCase}}{{abbreviation}}{{/upperCase}}I"%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%CCFCE%"{{#upperCase}}{{abbreviation}}{{/upperCase}}FCE"%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%CCP%"{{#upperCase}}{{abbreviation}}{{/upperCase}}P"%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%CCLI%"{{#upperCase}}{{abbreviation}}{{/upperCase}}LI"%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%"\'cc\'"%"\'{{#lowerCase}}{{abbreviation}}{{/lowerCase}}\'"%g {} +

TGTFF="$TGT/lib/src/features/{{name_plural.snakeCase()}}"
TGTTFF="$TGT/test/features/{{name_plural.snakeCase()}}"

LOOK_FOR_1='"code": "test code (\d)",'
LOOK_FOR_2='"notes": "test notes \d"'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH='{{#fields}}"{{#camelCase}}{{field_name}}{{\/camelCase}}": "test {{#camelCase}}{{field_name}}{{\/camelCase}} $1"{{^is_last}},{{\/is_last}}{{^is_last}}\n    {{\/is_last}}{{\/fields}}'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTT/fixtures/"{{name_plural.snakeCase()}}"_fixture.json

LOOK_FOR_1='"code": "test code (\d)",'
LOOK_FOR_2='"notes": "test notes \d"'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH='{{#fields}}"{{#camelCase}}{{field_name}}{{\/camelCase}}": "test {{#camelCase}}{{field_name}}{{\/camelCase}} $1"{{^is_last}},{{\/is_last}}{{^is_last}}\n    {{\/is_last}}{{\/fields}}'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTT/fixtures/"{{name_plural.snakeCase()}}"_mongo_fixture.json

LOOK_FOR='"code": "Code-(\d\d)","notes": "Notes-(\d\d)",'
REPLACE_WITH='{{#fields}}"{{#camelCase}}{{field_name}}{{\/camelCase}}": "{{#pascalCase}}{{field_name}}{{\/pascalCase}}-$1",{{\/fields}}'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTT/fixtures/"{{name_plural.snakeCase()}}"_response_fixture.json

LOOK_FOR="code"
REPLACE_WITH="{{test_field_1}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/domain/"{{name_plural.snakeCase()}}"_support.dart

LOOK_FOR_1='code: {{#camelCase}}{{name_singular}}{{\/camelCase}}.code,'
LOOK_FOR_2='notes: {{#camelCase}}{{name_singular}}{{\/camelCase}}.notes,'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH="{{#fields}}{{#camelCase}}{{field_name}}{{\/camelCase}}: {{#camelCase}}{{name_singular}}{{\/camelCase}}.{{#camelCase}}{{field_name}}{{\/camelCase}},{{^is_last}}\n            {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/domain/"{{name_plural.snakeCase()}}"_support_test.dart

LOOK_FOR_1="'code': {'kind': 'field', 'type': 'string', 'label': 'code', 'required': true},"
LOOK_FOR_2="'notes': {'kind': 'field', 'type': 'string', 'label': 'notes', 'required': true},"
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH="{{#fields}}'{{#camelCase}}{{field_name}}{{\/camelCase}}': {'kind': '{{kind}}', 'type': '{{type}}', 'label': '{{label}}', 'required': {{required}}},{{^is_last}}\n  {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/domain/"{{name_plural.snakeCase()}}"_helper.dart

LOOK_FOR="code: 'test code \\$\{i\+1}', notes: 'test notes \\$\{i\+1}'"
REPLACE_WITH="{{#fields}}{{#camelCase}}{{field_name}}{{\/camelCase}}: 'test {{#camelCase}}{{field_name}}{{\/camelCase}} \\$\{i+1}'{{^is_last}}, {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/domain/"{{name_plural.snakeCase()}}"_helper.dart
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/"{{name_plural.snakeCase()}}"_test_helper.dart

LOOK_FOR="code: 'code-sample', notes: 'notes-sample'"
REPLACE_WITH="{{#fields}}{{#camelCase}}{{field_name}}{{\/camelCase}}: '{{#camelCase}}{{field_name}}{{\/camelCase}}-sample'{{^is_last}}, {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/"{{name_plural.snakeCase()}}"_test_helper.dart

LOOK_FOR_1='"code": "test code (\d)",'
LOOK_FOR_2='"notes": "test notes \d"'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH="{{#fields}}\"{{#camelCase}}{{field_name}}{{\/camelCase}}\": \"test {{#camelCase}}{{field_name}}{{\/camelCase}} \$1\", {{^is_last}}\n    {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/"{{name_plural.snakeCase()}}"_test_helper.dart

LOOK_FOR="'code': 'test code \\$\{i\+1}', 'notes': 'test notes \\$\{i\+1}'"
# TODO: why the following is not working?
#LOOK_FOR='\x27code\x27: \x27test code \$\{i\+1}\x27, \x27notes\x27: \x27test notes \\$\{i\+1}\x27'
REPLACE_WITH="{{#fields}}'{{#camelCase}}{{field_name}}{{\/camelCase}}': 'test {{#camelCase}}{{field_name}}{{\/camelCase}} \\$\{i+1}'{{^is_last}}, {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/"{{name_plural.snakeCase()}}"_test_helper.dart

LOOK_FOR_1='code: \x27code 1\x27,'
LOOK_FOR_2='notes: \x27notes 1\x27,'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH="{{#fields}}{{#camelCase}}{{field_name}}{{\/camelCase}}: '{{#camelCase}}{{field_name}}{{\/camelCase}} 1',{{^is_last}}\n  {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/"{{name_plural.snakeCase()}}"_test_helper.dart

LOOK_FOR_1='\x27\x27,\n.\s*\x27code\x27,'
LOOK_FOR_2='\x27notes\x27,'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH="'',\n  {{#fields}}'{{#camelCase}}{{field_name}}{{\/camelCase}}',{{^is_last}}\n  {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/"{{name_plural.snakeCase()}}"_test_helper.dart

LOOK_FOR_1='code: \x27code\x27,'
LOOK_FOR_2='notes: \x27notes\x27,'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH="{{#fields}}{{#camelCase}}{{field_name}}{{\/camelCase}}: '{{#camelCase}}{{field_name}}{{\/camelCase}}',{{^is_last}}\n    {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/"{{name_plural.snakeCase()}}"_test_helper.dart

LOOK_FOR='code: \x27sample code 1\x27, notes: \x27sample notes 1\x27'
REPLACE_WITH="{{#fields}}{{#camelCase}}{{field_name}}{{\/camelCase}}: 'sample {{#camelCase}}{{field_name}}{{\/camelCase}} 1'{{^is_last}}, {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/domain/"{{name_plural.snakeCase()}}"_helper_test.dart

LOOK_FOR_1='\x27code\x27: \x27sample code 1\x27,'
LOOK_FOR_2='\x27notes\x27: \x27sample notes 1\x27,'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH="{{#fields}}'{{#camelCase}}{{field_name}}{{\/camelCase}}': 'sample {{#camelCase}}{{field_name}}{{\/camelCase}} 1',{{^is_last}}\n      {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/domain/"{{name_plural.snakeCase()}}"_helper_test.dart

LOOK_FOR="expect\(find.byType\({{#pascalCase}}{{name_plural}}{{\/pascalCase}}ListItem\), findsNWidgets\(4\)\);"
REPLACE_WITH="expect(find.byType({{#pascalCase}}{{name_plural}}{{\/pascalCase}}ListItem), findsNWidgets({{show_items_in_screen}}));"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/presentation/main/"{{name_plural.snakeCase()}}"_list_test.dart

LOOK_FOR_START='    \/\/\*\* field id start \*\*\/\/'
LOOK_FOR_END='\/\/\*\* field id end \*\*\/\/'
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR/`cat bin\/fl_feature\/template_model_field_id.txt`/s" \
  $TGTFF/data/"{{name_plural.snakeCase()}}"_model.dart

LOOK_FOR_START='    \/\/\*\* fields start \*\*\/\/'
LOOK_FOR_END='\/\/\*\* fields end \*\*\/\/'
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR/`cat bin\/fl_feature\/template_model_fields.txt`/s" \
  $TGTFF/data/"{{name_plural.snakeCase()}}"_model.dart

LOOK_FOR="String get title => \[code\].join\(','\);"
REPLACE_WITH="String get title => [{{#fields}}{{#is_title}}{{#camelCase}}{{field_name}}{{\/camelCase}}{{^is_last_title}},{{\/is_last_title}}{{\/is_title}}{{\/fields}}].join(',');"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/data/"{{name_plural.snakeCase()}}"_model.dart

LOOK_FOR="'id', 'code', 'notes', 'createdAt', 'updatedAt'"
REPLACE_WITH="'id', {{#fields}}'{{#camelCase}}{{field_name}}{{\/camelCase}}', {{\/fields}}'createdAt', 'updatedAt'"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/data/"{{name_plural.snakeCase()}}"_model.dart

LOOK_FOR_1='\x27code\x27: code,'
LOOK_FOR_2='\x27notes\x27: notes,'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH="{{#fields}}'{{#camelCase}}{{field_name}}{{\/camelCase}}': {{#camelCase}}{{field_name}}{{\/camelCase}},{{^is_last}}\n    {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/data/"{{name_plural.snakeCase()}}"_model.dart

LOOK_FOR_1='else if \(prop == \"code\"\) { return code; }'
LOOK_FOR_2='else if \(prop == \"notes\"\) { return notes; }'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH='{{#fields}}else if (prop == "{{#camelCase}}{{field_name}}{{\/camelCase}}") { return {{#camelCase}}{{field_name}}{{\/camelCase}}; }{{^is_last}}\n    {{\/is_last}}{{\/fields}}'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/data/"{{name_plural.snakeCase()}}"_model.dart

LOOK_FOR_1='code: initialData\?\.code \?\? \x27\x27,'
LOOK_FOR_2='notes: initialData\?\.notes \?\? \x27\x27,'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH="{{#fields}}{{#camelCase}}{{field_name}}{{\/camelCase}}: initialData?.{{#camelCase}}{{field_name}}{{\/camelCase}} ?? '',{{^is_last}}\n            {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/presentation/add_edit/bloc/"{{name_plural.snakeCase()}}"_item_add_edit_bloc.dart

LOOK_FOR_1='on<{{#pascalCase}}{{name_plural}}{{\/pascalCase}}ItemAddEditCodeChangedEvent>\(_onCodeChanged\);'
LOOK_FOR_2='on<{{#pascalCase}}{{name_plural}}{{\/pascalCase}}ItemAddEditNotesChangedEvent>\(_onNotesChanged\);'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH='{{#fields}}on<{{#pascalCase}}{{name_plural}}{{\/pascalCase}}ItemAddEdit{{#pascalCase}}{{field_name}}{{\/pascalCase}}ChangedEvent>\(_on{{#pascalCase}}{{field_name}}{{\/pascalCase}}Changed\);{{^is_last}}\n    {{\/is_last}}{{\/fields}}'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/presentation/add_edit/bloc/"{{name_plural.snakeCase()}}"_item_add_edit_bloc.dart

LOOK_FOR_START='  \/\/\*\* fields start \*\*\/\/'
LOOK_FOR_END='\/\/\*\* fields end \*\*\/\/'
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR/`cat bin\/fl_feature\/template_add_edit_bloc_fields.txt`/s" \
  $TGTFF/presentation/add_edit/bloc/"{{name_plural.snakeCase()}}"_item_add_edit_bloc.dart

LOOK_FOR='const {{#pascalCase}}{{name_plural}}{{\/pascalCase}}Model\(code: \x27\x27\)'
REPLACE_WITH="const {{#pascalCase}}{{name_plural}}{{\/pascalCase}}Model\({{#fields}}{{#required}}{{#camelCase}}{{field_name}}{{\/camelCase}}: {{empty_value}}{{^is_last_required}}, {{\/is_last_required}}{{\/required}}{{\/fields}}\)"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/presentation/add_edit/bloc/"{{name_plural.snakeCase()}}"_item_add_edit_bloc.dart

LOOK_FOR_1='code: state.code,'
LOOK_FOR_2='notes: state.notes,'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH='{{#fields}}{{#camelCase}}{{field_name}}{{\/camelCase}}: state.{{#camelCase}}{{field_name}}{{\/camelCase}},{{^is_last}}\n      {{\/is_last}}{{\/fields}}'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/presentation/add_edit/bloc/"{{name_plural.snakeCase()}}"_item_add_edit_bloc.dart

LOOK_FOR_START='    \/\/\*\* fields start \*\*\/\/'
LOOK_FOR_END='\/\/\*\* fields end \*\*\/\/'
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR/`cat bin\/fl_feature\/template_add_edit_bloc_test_fields.txt`/s" \
  $TGTTFF/presentation/add_edit/bloc/"{{name_plural.snakeCase()}}"_item_add_edit_bloc_test.dart

LOOK_FOR_1=".having\(\(t\) => t.code, 'code', equals\('code'\)\)"
LOOK_FOR_2=".having\(\(t\) => t.notes, 'notes', equals\('notes'\)\)"
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH="{{#fields}}.having((t) => t.{{#camelCase}}{{field_name}}{{\/camelCase}}, '{{#camelCase}}{{field_name}}{{\/camelCase}}', equals('{{#camelCase}}{{field_name}}{{\/camelCase}}')){{^is_last}}\n                    {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/presentation/add_edit/bloc/"{{name_plural.snakeCase()}}"_item_add_edit_bloc_test.dart

LOOK_FOR_START='\/\/\*\* fields start \*\*\/\/'
LOOK_FOR_END='\/\/\*\* fields end \*\*\/\/'
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR/`cat bin\/fl_feature\/template_add_edit_event_fields.txt`/s" \
  $TGTFF/presentation/add_edit/bloc/"{{name_plural.snakeCase()}}"_item_add_edit_event.dart

LOOK_FOR_START='    \/\/\*\* fields start \*\*\/\/'
LOOK_FOR_END='\/\/\*\* fields end \*\*\/\/'
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR/`cat bin\/fl_feature\/template_add_edit_event_test_fields.txt`/s" \
  $TGTTFF/presentation/add_edit/bloc/"{{name_plural.snakeCase()}}"_item_add_edit_event_test.dart

LOOK_FOR_1="this.code = '',"
LOOK_FOR_2="this.notes = '',"
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH='{{#fields}}this.{{#camelCase}}{{field_name}}{{\/camelCase}} = {{empty_value}},{{^is_last}}\n    {{\/is_last}}{{\/fields}}'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/presentation/add_edit/bloc/"{{name_plural.snakeCase()}}"_item_add_edit_state.dart

LOOK_FOR_1="final String code;"
LOOK_FOR_2="final String notes;"
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH='{{#fields}}final String {{#camelCase}}{{field_name}}{{\/camelCase}};{{^is_last}}\n  {{\/is_last}}{{\/fields}}'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/presentation/add_edit/bloc/"{{name_plural.snakeCase()}}"_item_add_edit_state.dart

LOOK_FOR_1="String\? code,"
LOOK_FOR_2="String\? notes,"
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH='{{#fields}}String? {{#camelCase}}{{field_name}}{{\/camelCase}},{{^is_last}}\n    {{\/is_last}}{{\/fields}}'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/presentation/add_edit/bloc/"{{name_plural.snakeCase()}}"_item_add_edit_state.dart

LOOK_FOR_1="code: code \?\? this.code,"
LOOK_FOR_2="notes: notes \?\? this.notes,"
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH='{{#fields}}{{#camelCase}}{{field_name}}{{\/camelCase}}: {{#camelCase}}{{field_name}}{{\/camelCase}} ?? this.{{#camelCase}}{{field_name}}{{\/camelCase}},{{^is_last}}\n      {{\/is_last}}{{\/fields}}'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/presentation/add_edit/bloc/"{{name_plural.snakeCase()}}"_item_add_edit_state.dart

LOOK_FOR='status, initialData, id, code, notes'
REPLACE_WITH='status, initialData, id{{#fields}}, {{#camelCase}}{{field_name}}{{\/camelCase}}{{\/fields}}'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/presentation/add_edit/bloc/"{{name_plural.snakeCase()}}"_item_add_edit_state.dart

LOOK_FOR_1='code: null,'
LOOK_FOR_2='notes: null,'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH="{{#fields}}{{#camelCase}}{{field_name}}{{\/camelCase}}: null,{{^is_last}}\n            {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/presentation/add_edit/bloc/"{{name_plural.snakeCase()}}"_item_add_edit_state_test.dart

LOOK_FOR='code'
REPLACE_WITH='{{test_field_1}}'
sed -i '' "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/presentation/add_edit/"{{name_plural.snakeCase()}}"_item_add_edit_page_test.dart

LOOK_FOR='children: const \[_CodeField\(\), _NotesField\(\)\],'
REPLACE_WITH='children: const [{{#fields}}_{{#pascalCase}}{{field_name}}{{\/pascalCase}}Field\(\){{^is_last}}, {{\/is_last}}{{\/fields}}],'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/presentation/add_edit/"{{name_plural.snakeCase()}}"_item_add_edit_view.dart

LOOK_FOR_START='\/\/\*\* fields start \*\*\/\/'
LOOK_FOR_END='\/\/\*\* fields end \*\*\/\/'
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR/`cat bin\/fl_feature\/template_add_edit_view_fields.txt`/s" \
  $TGTFF/presentation/add_edit/"{{name_plural.snakeCase()}}"_item_add_edit_view.dart

# TODO: This is not working! Why? It is almost identical with sed version bellow
#LOOK_FOR_START='expect(find.byKey(const Key(\x27\$key{{#pascalCase}}{{name_plural}}{{\/pascalCase}}WidgetItemAddEditBase-col1-code\x27)), findsOneWidget);'
#LOOK_FOR_END='expect(find.byKey(const Key(\x27$key{{#pascalCase}}{{name_plural}}{{\/pascalCase}}WidgetItemAddEditBase-col1-notes\x27)), findsOneWidget);'
#perl -i -p0e 's/$LOOK_FOR_START.*\n.*$LOOK_FOR_END/aaaaaaa/s' \
#  $TGTTFF/presentation/add_edit/"{{name_plural.snakeCase()}}"_item_add_edit_view_test.dart

LOOK_FOR_START='expect(find.byKey(const Key(\x27\$key{{#pascalCase}}{{name_plural}}{{\/pascalCase}}WidgetItemAddEditBase-col1-code\x27)), findsOneWidget);'
LOOK_FOR_END='expect(find.byKey(const Key(\x27$key{{#pascalCase}}{{name_plural}}{{\/pascalCase}}WidgetItemAddEditBase-col1-notes\x27)), findsOneWidget);'
REPLACE_WITH='{{#fields}}expect(find.byKey(const Key(\x27$key{{#pascalCase}}{{name_plural}}{{\/pascalCase}}WidgetItemAddEditBase-col1-{{#paramCase}}{{field_name}}{{\/paramCase}}\x27)), findsOneWidget);{{^is_last}}\n      {{\/is_last}}{{\/fields}}'
sed -i '' "
/$LOOK_FOR_START/ {
	N
	/\n.*$LOOK_FOR_END/ {
		s/$LOOK_FOR_START.*\n.*$LOOK_FOR_END/$REPLACE_WITH/
	}
}" $TGTTFF/presentation/add_edit/"{{name_plural.snakeCase()}}"_item_add_edit_view_test.dart

LOOK_FOR='expect(find.byType(TextFormField), findsNWidgets(2));'
REPLACE_WITH='expect(find.byType(TextFormField), findsNWidgets({{fields_length}}));'
sed -i '' "s/$LOOK_FOR/$REPLACE_WITH/" \
  $TGTTFF/presentation/add_edit/"{{name_plural.snakeCase()}}"_item_add_edit_view_test.dart

LOOK_FOR_START='    \/\/\*\* fields start \*\*\/\/'
LOOK_FOR_END='\/\/\*\* fields end \*\*\/\/'
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR/`cat bin\/fl_feature\/template_add_edit_view_test_fields.txt`/s" \
  $TGTTFF/presentation/add_edit/"{{name_plural.snakeCase()}}"_item_add_edit_view_test.dart

LOOK_FOR_START='_Title(item: item),'
LOOK_FOR_END='_Notes(item: item),'
REPLACE_WITH='_Title(item: item),\n                {{#fields}}{{^is_title}}_{{#pascalCase}}{{field_name}}{{\/pascalCase}}\(item: item\),{{^is_last}}\n                {{\/is_last}}{{\/is_title}}{{\/fields}}'
sed -i '' "
/$LOOK_FOR_START/ {
	N
	/\n.*$LOOK_FOR_END/ {
		s/$LOOK_FOR_START.*\n.*$LOOK_FOR_END/$REPLACE_WITH/
	}
}" $TGTFF/presentation/main/"{{name_plural.snakeCase()}}"_list_item.dart

LOOK_FOR_START='subtitle: Column\('
LOOK_FOR_END='_Notes\(item: item\),'
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
REPLACE_WITH='subtitle: Column(\n          children: [\n            {{#fields}}{{^is_title}}_{{#pascalCase}}{{field_name}}{{\/pascalCase}}\(item: item\),{{^is_last}}\n            {{\/is_last}}{{\/is_title}}{{\/fields}}'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/s" \
  $TGTFF/presentation/main/"{{name_plural.snakeCase()}}"_list_item.dart

LOOK_FOR_START='\/\/\*\* fields except title start \*\*\/\/'
LOOK_FOR_END='\/\/\*\* fields except title end \*\*\/\/'
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR/`cat bin\/fl_feature\/template_list_item_fields.txt`/s" \
  $TGTFF/presentation/main/"{{name_plural.snakeCase()}}"_list_item.dart

LOOK_FOR_START='            \/\/\*\* fields start \*\*\/\/'
LOOK_FOR_END='\/\/\*\* fields end \*\*\/\/'
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR/`cat bin\/fl_feature\/template_item_screen_fields.txt`/s" \
  $TGTFF/presentation/show/"{{name_plural.snakeCase()}}"_item_screen.dart

LOOK_FOR_1='expect\(find.byKey\(const Key\(\x27\$key{{#pascalCase}}{{name_plural}}{{\/pascalCase}}WidgetItemShowBase-col1-code\x27\)\), findsOneWidget\);'
LOOK_FOR_2='expect\(find.byKey\(const Key\(\x27\$key{{#pascalCase}}{{name_plural}}{{\/pascalCase}}WidgetItemShowBase-col1-notes\x27\)\), findsOneWidget\);'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH='{{#fields}}expect(find.byKey(const Key(\x27\$key{{#pascalCase}}{{name_plural}}{{\/pascalCase}}WidgetItemShowBase-col1-{{#paramCase}}{{field_name}}{{\/paramCase}}\x27)), findsOneWidget);{{^is_last}}\n      {{\/is_last}}{{\/fields}}'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/presentation/show/"{{name_plural.snakeCase()}}"_item_screen_test.dart

LOOK_FOR="code"
REPLACE_WITH="{{test_field_1}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/presentation/show/"{{name_plural.snakeCase()}}"_item_show_page_test.dart

LOOK_FOR='-code'
REPLACE_WITH='-{{test_field_1}}'
sed -i '' "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/presentation/main/"{{name_plural.snakeCase()}}"_page_test.dart

# do this after search and replaces, for some reason some files change updated time even if no changes made!
# bricks/fl_feature/__brick__/integration_test/app_{{name_plural.snakeCase()}}_test.dart:4
echo "Restore manual update files..."
mkdir -p "$TGT/.idea/runConfigurations"
mkdir -p "$TGT/integration_test"
mv "$TGTBT"/.idea/runConfigurations/app_"$NMP"_integration_tests.xml "$TGT/.idea/runConfigurations"
mv "$TGTBT"/integration_test/app_"$NMP"_test.dart "$TGT/integration_test"

echo "Delete backup folder (only if it is empty!"
#rmdir $TGTBT
rmdir "$TGTBT/.idea/runConfigurations"
rmdir "$TGTBT/.idea"
rmdir "$TGTBT/integration_test"
rmdir "$TGTBT"

