SRCAPPNAME=dev_framework_tutorial
SRC=~/dev/flutter/_itg_tutorials/$SRCAPPNAME
SRCF=$SRC/lib/src/features
SRCT=$SRC/test
SRCTF=$SRCT/features

TGTP=~/dev/tools/itg_mason/bricks/fl_feature
TGTBT=$TGTP/backup-temp

TGT=$TGTP/__brick__
TGTF=$TGT/lib/src/features
TGTT=$TGT/test
TGTTF=$TGTT/features
NMP={{#snakeCase}}{{name_plural}}{{/snakeCase}}
NMPF={{#snakeCase}}{{name_plural}}{{

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

echo "use as source the cultivation_chambers"
exit

echo "Continue with the installation..."

# Manual update files - Not auto update!
#mkdir -p $TGT/.idea/runConfigurations/app_$NMPF
#cp /Users/aaon/dev/flutter/itg/itg_client/.idea/runConfigurations/app_tasks_integration_tests.xml $TGT/.idea/runConfigurations/app_$NMPF/snakeCase}}_integration_tests.xml

#mkdir -p $TGT/integration_test/app_$NMPF
#cp $SRC/integration_test/app_test.dart $TGT/integration_test/app_$NMP\snakeCase}}_test.dart
# Replace all
#   Task -> {{#pascalCase}}{{name_singular}}{{/pascalCase}}
#   Tasks -> {{#pascalCase}}{{name_plural}}{{/pascalCase}}
#   task -> {{name_singular}}
#   tasks -> {{#snakeCase}}{{name_plural}}{{/snakeCase}}
#   itg_client -> {{app_name}}
#   description -> {{test_field_1}}
#   notes -> {{test_field_2}}

echo "Keep manual update files..."
mkdir -p "$TGTBT/.idea/runConfigurations/app_$NMPF"
mkdir -p "$TGTBT/integration_test/app_$NMPF"
cp -p "$TGT/integration_test/app_$NMPF/snakeCase}}_test.dart" "$TGTBT/integration_test/app_$NMPF"
cp -p "$TGT/.idea/runConfigurations/app_$NMPF/snakeCase}}_integration_tests.xml" "$TGTBT/.idea/runConfigurations/app_$NMPF"

echo "Delete target folder '$TGT'"
rm -rf "$TGT"
mkdir -p "$TGT"

mkdir -p $TGTTF/$NMP/data/$NMPF
mkdir -p $TGTTF/$NMP/$NMPF
mkdir -p $TGTT/fixtures/$NMPF
mkdir -p $TGTTF/$NMP/domain/$NMPF
mkdir -p $TGTTF/$NMP/domain/get_$NMPF
mkdir -p $TGTTF/$NMP/domain/save_$NMPF
mkdir -p $TGTTF/$NMP/domain/delete_$NMPF
mkdir -p $TGTTF/$NMP/presentation/add_edit/bloc/$NMPF
mkdir -p $TGTTF/$NMP/presentation/add_edit/$NMPF
mkdir -p $TGTTF/$NMP/presentation/main/bloc/$NMPF
mkdir -p $TGTTF/$NMP/presentation/main/$NMPF
mkdir -p $TGTTF/$NMP/presentation/show/$NMPF

cp $SRCTF/notes/notes_test_helper.dart $TGTTF/$NMP/$NMP\_test_helper.dart
cp $SRCT/fixtures/notes_fixture.json $TGTT/fixtures/$NMP\_fixture.json
cp $SRCT/fixtures/notes_response_fixture.json $TGTT/fixtures/$NMP\_response_fixture.json
cp $SRCTF/notes/data/notes_model_test.dart $TGTTF/$NMP/data/$NMP\_model_test.dart
cp $SRCTF/notes/data/notes_remote_datasource_test.dart $TGTTF/$NMP/data/$NMP\_remote_datasource_test.dart
cp $SRCTF/notes/data/notes_repository_impl_test.dart $TGTTF/$NMP/data/$NMP\_repository_impl_test.dart
cp $SRCTF/notes/domain/notes_support_test.dart $TGTTF/$NMP/domain/$NMP\_support_test.dart
cp $SRCTF/notes/domain/notes_helper_test.dart $TGTTF/$NMP/domain/$NMP\_helper_test.dart
cp $SRCTF/notes/domain/get_notes_usecase_test.dart $TGTTF/$NMP/domain/get_$NMP\_usecase_test.dart
cp $SRCTF/notes/domain/delete_notes_item_usecase_test.dart $TGTTF/$NMP/domain/delete_$NMP\_item_usecase_test.dart
cp $SRCTF/notes/domain/save_notes_item_usecase_test.dart $TGTTF/$NMP/domain/save_$NMP\_item_usecase_test.dart
cp $SRCTF/notes/presentation/add_edit/bloc/notes_item_add_edit_bloc_test.dart $TGTTF/$NMP/presentation/add_edit/bloc/$NMP\_item_add_edit_bloc_test.dart
cp $SRCTF/notes/presentation/add_edit/bloc/notes_item_add_edit_event_test.dart $TGTTF/$NMP/presentation/add_edit/bloc/$NMP\_item_add_edit_event_test.dart
cp $SRCTF/notes/presentation/add_edit/bloc/notes_item_add_edit_state_test.dart $TGTTF/$NMP/presentation/add_edit/bloc/$NMP\_item_add_edit_state_test.dart
cp $SRCTF/notes/presentation/add_edit/notes_item_add_edit_page_test.dart $TGTTF/$NMP/presentation/add_edit/$NMP\_item_add_edit_page_test.dart
cp $SRCTF/notes/presentation/add_edit/notes_item_add_edit_view_test.dart $TGTTF/$NMP/presentation/add_edit/$NMP\_item_add_edit_view_test.dart
cp $SRCTF/notes/presentation/main/bloc/notes_bloc_test.dart $TGTTF/$NMP/presentation/main/bloc/$NMP\_bloc_test.dart
cp $SRCTF/notes/presentation/main/bloc/notes_event_test.dart $TGTTF/$NMP/presentation/main/bloc/$NMP\_event_test.dart
cp $SRCTF/notes/presentation/main/bloc/notes_state_test.dart $TGTTF/$NMP/presentation/main/bloc/$NMP\_state_test.dart
cp $SRCTF/notes/presentation/main/notes_page_test.dart $TGTTF/$NMP/presentation/main/$NMP\_page_test.dart
cp $SRCTF/notes/presentation/main/notes_list_test.dart $TGTTF/$NMP/presentation/main/$NMP\_list_test.dart
cp $SRCTF/notes/presentation/show/notes_item_show_page_test.dart $TGTTF/$NMP/presentation/show/$NMP\_item_show_page_test.dart
cp $SRCTF/notes/presentation/show/notes_item_screen_test.dart $TGTTF/$NMP/presentation/show/$NMP\_item_screen_test.dart

mkdir -p $TGTF/$NMP/data/$NMPF
mkdir -p $TGTF/$NMP/domain/$NMPF
mkdir -p $TGTF/$NMP/domain/get_$NMPF
mkdir -p $TGTF/$NMP/domain/save_$NMPF
mkdir -p $TGTF/$NMP/domain/delete_$NMPF
mkdir -p $TGTF/$NMP/presentation/add_edit/bloc/$NMPF
mkdir -p $TGTF/$NMP/presentation/add_edit/$NMPF
mkdir -p $TGTF/$NMP/presentation/main/bloc/$NMPF
mkdir -p $TGTF/$NMP/presentation/main/$NMPF
mkdir -p $TGTF/$NMP/presentation/show/$NMPF

cp $SRCF/notes/data/notes_model.dart $TGTF/$NMP/data/$NMP\_model.dart
cp $SRCF/notes/data/notes_local_datasource.dart $TGTF/$NMP/data/$NMP\_local_datasource.dart
cp $SRCF/notes/data/notes_remote_datasource.dart $TGTF/$NMP/data/$NMP\_remote_datasource.dart
cp $SRCF/notes/data/notes_repository_impl.dart $TGTF/$NMP/data/$NMP\_repository_impl.dart
cp $SRCF/notes/domain/notes_repository.dart $TGTF/$NMP/domain/$NMP\_repository.dart
cp $SRCF/notes/domain/notes_support.dart $TGTF/$NMP/domain/$NMP\_support.dart
cp $SRCF/notes/domain/notes_helper.dart $TGTF/$NMP/domain/$NMP\_helper.dart
cp $SRCF/notes/domain/get_notes_usecase.dart $TGTF/$NMP/domain/get_$NMP\_usecase.dart
cp $SRCF/notes/domain/delete_notes_item_usecase.dart $TGTF/$NMP/domain/delete_$NMP\_item_usecase.dart
cp $SRCF/notes/domain/save_notes_item_usecase.dart $TGTF/$NMP/domain/save_$NMP\_item_usecase.dart
cp $SRCF/notes/presentation/add_edit/bloc/notes_item_add_edit_bloc.dart $TGTF/$NMP/presentation/add_edit/bloc/$NMP\_item_add_edit_bloc.dart
cp $SRCF/notes/presentation/add_edit/bloc/notes_item_add_edit_event.dart $TGTF/$NMP/presentation/add_edit/bloc/$NMP\_item_add_edit_event.dart
cp $SRCF/notes/presentation/add_edit/bloc/notes_item_add_edit_state.dart $TGTF/$NMP/presentation/add_edit/bloc/$NMP\_item_add_edit_state.dart
cp $SRCF/notes/presentation/add_edit/notes_item_add_edit_page.dart $TGTF/$NMP/presentation/add_edit/$NMP\_item_add_edit_page.dart
cp $SRCF/notes/presentation/add_edit/notes_item_add_edit_view.dart $TGTF/$NMP/presentation/add_edit/$NMP\_item_add_edit_view.dart
cp $SRCF/notes/presentation/main/bloc/notes_bloc.dart $TGTF/$NMP/presentation/main/bloc/$NMP\_bloc.dart
cp $SRCF/notes/presentation/main/bloc/notes_event.dart $TGTF/$NMP/presentation/main/bloc/$NMP\_event.dart
cp $SRCF/notes/presentation/main/bloc/notes_state.dart $TGTF/$NMP/presentation/main/bloc/$NMP\_state.dart
cp $SRCF/notes/presentation/main/notes_page.dart $TGTF/$NMP/presentation/main/$NMP\_page.dart
cp $SRCF/notes/presentation/main/notes_list_item.dart $TGTF/$NMP/presentation/main/$NMP\_list_item.dart
cp $SRCF/notes/presentation/main/notes_list_filter.dart $TGTF/$NMP/presentation/main/$NMP\_list_filter.dart
cp $SRCF/notes/presentation/show/notes_item_show_page.dart $TGTF/$NMP/presentation/show/$NMP\_item_show_page.dart
cp $SRCF/notes/presentation/show/notes_item_screen.dart $TGTF/$NMP/presentation/show/$NMP\_item_screen.dart

#find $TGT -type f -name '*.dart' -exec sed -i '' s%$SRCAPPNAME/src%{{#snakeCase}}{{app_name}}{{/snakeCase}}/lib/src%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%$SRCAPPNAME%{{#snakeCase}}{{app_name}}{{/snakeCase}}%g {} +

find $TGT -type f -name '*.dart' -exec sed -i '' s%notes%$NMP%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%Notes%{{#pascalCase}}{{name_plural}}{{/pascalCase}}%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%note%{{#snakeCase}}{{name_singular}}{{/snakeCase}}%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%Note%{{#pascalCase}}{{name_singular}}{{/pascalCase}}%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%NOTE%{{#upperCase}}{{name_singular}}{{/upperCase}}%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%CCB%{{#upperCase}}{{abbreviation}}{{/upperCase}}B%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%CCRDS%{{#upperCase}}{{abbreviation}}{{/upperCase}}RDS%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%CCRI%{{#upperCase}}{{abbreviation}}{{/upperCase}}RI%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%CCS%{{#upperCase}}{{abbreviation}}{{/upperCase}}S%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%CCI%{{#upperCase}}{{abbreviation}}{{/upperCase}}I%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%CCFCE%{{#upperCase}}{{abbreviation}}{{/upperCase}}FCE%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%\'nt\'%\'{{#lowerCase}}{{abbreviation}}{{/lowerCase}}\'%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%NTP%{{#upperCase}}{{abbreviation}}{{/upperCase}}P%g {} +
find $TGT -type f -name '*.dart' -exec sed -i '' s%NTLI%{{#upperCase}}{{abbreviation}}{{/upperCase}}LI%g {} +

TGTFF=$TGT/lib/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}
TGTTFF=$TGT/test/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}

LOOK_FOR_1='"description": "test description (\d)",'
LOOK_FOR_2='"content": "test content \d"'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH='{{#fields}}"{{#camelCase}}{{field_name}}{{\/camelCase}}": "test {{#camelCase}}{{field_name}}{{\/camelCase}} $1"{{^is_last}},{{\/is_last}}{{^is_last}}\n    {{\/is_last}}{{\/fields}}'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTT/fixtures/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_fixture.json

LOOK_FOR='"description":"Description-(\d\d)","content":"Sample content",'
LOOK_FOR="$LOOK_FOR"
REPLACE_WITH='{{#fields}}"{{#camelCase}}{{field_name}}{{\/camelCase}}": "{{#pascalCase}}{{field_name}}{{\/pascalCase}}-$1",{{\/fields}}'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTT/fixtures/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_response_fixture.json

LOOK_FOR="description"
REPLACE_WITH="{{test_field_1}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_support.dart

LOOK_FOR_1='description: {{#snakeCase}}{{name_singular}}{{\/snakeCase}}.description,'
LOOK_FOR_2='content: {{#snakeCase}}{{name_singular}}{{\/snakeCase}}.content'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH="{{#fields}}{{#camelCase}}{{field_name}}{{\/camelCase}}: {{#snakeCase}}{{name_singular}}{{\/snakeCase}}.{{#camelCase}}{{field_name}}{{\/camelCase}},{{^is_last}}\n            {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_support_test.dart

LOOK_FOR_1="'description': {'kind': 'field', 'type': 'string', 'label': 'Description', 'required': true},"
LOOK_FOR_2="'content': {'kind': 'field', 'type': 'string', 'label': 'Content', 'required': true},"
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH="{{#fields}}'{{#camelCase}}{{field_name}}{{\/camelCase}}': {'kind': '{{kind}}', 'type': '{{type}}', 'label': '{{label}}', 'required': {{required}}},{{^is_last}}\n  {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_helper.dart

LOOK_FOR="description: 'test description \\$\{i\+1}', content: 'test content \\$\{i\+1}'"
REPLACE_WITH="{{#fields}}{{#camelCase}}{{field_name}}{{\/camelCase}}: 'test {{#camelCase}}{{field_name}}{{\/camelCase}} \\$\{i+1}'{{^is_last}}, {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_helper.dart
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_test_helper.dart

LOOK_FOR="description: 'description-sample', content: 'sample content'"
REPLACE_WITH="{{#fields}}{{#camelCase}}{{field_name}}{{\/camelCase}}: '{{#camelCase}}{{field_name}}{{\/camelCase}}-sample'{{^is_last}}, {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_test_helper.dart

LOOK_FOR_1='"description": "test description (\d)",'
LOOK_FOR_2='"content": "test content \d"'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH="{{#fields}}\"{{#camelCase}}{{field_name}}{{\/camelCase}}\": \"test {{#camelCase}}{{field_name}}{{\/camelCase}} \$1\", {{^is_last}}\n    {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_test_helper.dart

LOOK_FOR="'description': 'test description \\$\{i\+1}', 'content': 'test content \\$\{i\+1}'"
# TODO: why the following is not working?
#LOOK_FOR='\x27description\x27: \x27test description \$\{i\+1}\x27, \x27content\x27: \x27test content \\$\{i\+1}\x27'
REPLACE_WITH="{{#fields}}'{{#camelCase}}{{field_name}}{{\/camelCase}}': 'test {{#camelCase}}{{field_name}}{{\/camelCase}} \\$\{i+1}'{{^is_last}}, {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_test_helper.dart

LOOK_FOR_1='description: \x27description 1\x27,'
LOOK_FOR_2='content: \x27content 1\x27,'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH="{{#fields}}{{#camelCase}}{{field_name}}{{\/camelCase}}: '{{#camelCase}}{{field_name}}{{\/camelCase}} 1',{{^is_last}}\n  {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_test_helper.dart

LOOK_FOR_1='\x27\x27,\n.\s*\x27description\x27,'
LOOK_FOR_2='\x27content\x27,'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH="'',\n  {{#fields}}'{{#camelCase}}{{field_name}}{{\/camelCase}}',{{^is_last}}\n  {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_test_helper.dart

LOOK_FOR_1='description: \x27description\x27,'
LOOK_FOR_2='content: \x27content\x27,'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH="{{#fields}}{{#camelCase}}{{field_name}}{{\/camelCase}}: '{{#camelCase}}{{field_name}}{{\/camelCase}}',{{^is_last}}\n    {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_test_helper.dart

LOOK_FOR='description: \x27sample description 1\x27, content: \x27sample content 1\x27'
REPLACE_WITH="{{#fields}}{{#camelCase}}{{field_name}}{{\/camelCase}}: 'sample {{#camelCase}}{{field_name}}{{\/camelCase}} 1'{{^is_last}}, {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_helper_test.dart

LOOK_FOR_1='\x27description\x27: \x27sample description 1\x27,'
LOOK_FOR_2='\x27content\x27: \x27sample content 1\x27,'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH="{{#fields}}'{{#camelCase}}{{field_name}}{{\/camelCase}}': 'sample {{#camelCase}}{{field_name}}{{\/camelCase}} 1',{{^is_last}}\n      {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_helper_test.dart

LOOK_FOR="expect\(find.byType\({{#pascalCase}}{{name_plural}}{{\/pascalCase}}ListItem\), findsNWidgets\(4\)\);"
REPLACE_WITH="expect(find.byType({{#pascalCase}}{{name_plural}}{{\/pascalCase}}ListItem), findsNWidgets({{show_items_in_screen}}));"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/presentation/main/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_list_test.dart

LOOK_FOR_1="    \@JsonKey\(toJson: omitEmpty\) required String description,"
LOOK_FOR_2="\@Default\(''\) \@JsonKey\(toJson: omitEmpty, includeIfNull: false\) String content,"
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
perl -i -p0e "s/$LOOK_FOR/`cat bin\/fl_feature\/template_model_fields.txt`/g" \
  $TGTFF/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart

LOOK_FOR="String get title => description;"
REPLACE_WITH="String get title => [{{#fields}}{{#is_title}}{{#camelCase}}{{field_name}}{{\/camelCase}},{{\/is_title}}{{\/fields}}].join(',');"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart

LOOK_FOR='\x27id\x27, \x27description\x27, \x27content\x27, \x27createdAt\x27, \x27updatedAt\x27'
REPLACE_WITH="'id', {{#fields}}'{{#camelCase}}{{field_name}}{{\/camelCase}}', {{\/fields}} 'createdAt', 'updatedAt'"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart

LOOK_FOR_1='\x27description\x27: description,'
LOOK_FOR_2='\x27content\x27: content,'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH="{{#fields}}'{{#camelCase}}{{field_name}}{{\/camelCase}}': {{#camelCase}}{{field_name}}{{\/camelCase}},{{^is_last}}\n    {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart

LOOK_FOR_1='else if \(prop == \"description\"\) { return description; }'
LOOK_FOR_2='else if \(prop == \"content\"\) { return content; }'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH='{{#fields}}else if (prop == "{{#camelCase}}{{field_name}}{{\/camelCase}}") { return {{#camelCase}}{{field_name}}{{\/camelCase}}; }{{^is_last}}\n    {{\/is_last}}{{\/fields}}'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart

LOOK_FOR_1='description: initialData\?\.description \?\? \x27\x27,'
LOOK_FOR_2='content: initialData\?\.content \?\? \x27\x27,'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH="{{#fields}}{{#camelCase}}{{field_name}}{{\/camelCase}}: initialData?.{{#camelCase}}{{field_name}}{{\/camelCase}} ?? '',{{^is_last}}\n            {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/presentation/add_edit/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_bloc.dart

LOOK_FOR_1='on<{{#pascalCase}}{{name_plural}}{{\/pascalCase}}ItemAddEditDescriptionChangedEvent>\(_onDescriptionChanged\);'
LOOK_FOR_2='on<{{#pascalCase}}{{name_plural}}{{\/pascalCase}}ItemAddEditContentChangedEvent>\(_onContentChanged\);'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH='{{#fields}}on<{{#pascalCase}}{{name_plural}}{{\/pascalCase}}ItemAddEdit{{#pascalCase}}{{field_name}}{{\/pascalCase}}ChangedEvent>\(_on{{#pascalCase}}{{field_name}}{{\/pascalCase}}Changed\);{{^is_last}}\n    {{\/is_last}}{{\/fields}}'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/presentation/add_edit/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_bloc.dart

LOOK_FOR_START='  \/\/\*\* fields start \*\*\/\/'
LOOK_FOR_END='\/\/\*\* fields end \*\*\/\/'
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR/`cat bin\/fl_feature\/template_add_edit_bloc_fields.txt`/s" \
  $TGTFF/presentation/add_edit/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_bloc.dart

LOOK_FOR='const {{#pascalCase}}{{name_plural}}{{\/pascalCase}}Model\(description: \x27\x27\)'
REPLACE_WITH="const {{#pascalCase}}{{name_plural}}{{\/pascalCase}}Model\({{#fields}}{{#required}}{{#camelCase}}{{field_name}}{{\/camelCase}}: {{empty_value}}{{^is_last_required}}, {{\/is_last_required}}{{\/required}}{{\/fields}}\)"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/presentation/add_edit/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_bloc.dart

LOOK_FOR_1='description: state.description,'
LOOK_FOR_2='content: state.content,'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH='{{#fields}}{{#camelCase}}{{field_name}}{{\/camelCase}}: state.{{#camelCase}}{{field_name}}{{\/camelCase}},{{^is_last}}\n      {{\/is_last}}{{\/fields}}'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/presentation/add_edit/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_bloc.dart

LOOK_FOR_START='    \/\/\*\* fields start \*\*\/\/'
LOOK_FOR_END='\/\/\*\* fields end \*\*\/\/'
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR/`cat bin\/fl_feature\/template_add_edit_bloc_test_fields.txt`/s" \
  $TGTTFF/presentation/add_edit/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_bloc_test.dart

LOOK_FOR_1=".having\(\(t\) => t.description, 'description', equals\('description'\)\)"
LOOK_FOR_2=".having\(\(t\) => t.content, 'content', equals\('content'\)\)"
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH="{{#fields}}.having((t) => t.{{#camelCase}}{{field_name}}{{\/camelCase}}, '{{#camelCase}}{{field_name}}{{\/camelCase}}', equals('{{#camelCase}}{{field_name}}{{\/camelCase}}')){{^is_last}}\n                    {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/presentation/add_edit/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_bloc_test.dart

LOOK_FOR_START='\/\/\*\* fields start \*\*\/\/'
LOOK_FOR_END='\/\/\*\* fields end \*\*\/\/'
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR/`cat bin\/fl_feature\/template_add_edit_event_fields.txt`/s" \
  $TGTFF/presentation/add_edit/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_event.dart

LOOK_FOR_START='    \/\/\*\* fields start \*\*\/\/'
LOOK_FOR_END='\/\/\*\* fields end \*\*\/\/'
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR/`cat bin\/fl_feature\/template_add_edit_event_test_fields.txt`/s" \
  $TGTTFF/presentation/add_edit/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_event_test.dart

LOOK_FOR_1="this.description = '',"
LOOK_FOR_2="this.content = '',"
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH='{{#fields}}this.{{#camelCase}}{{field_name}}{{\/camelCase}} = {{empty_value}},{{^is_last}}\n    {{\/is_last}}{{\/fields}}'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/presentation/add_edit/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_state.dart

LOOK_FOR_1="final String description;"
LOOK_FOR_2="final String content;"
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH='{{#fields}}final String {{#camelCase}}{{field_name}}{{\/camelCase}};{{^is_last}}\n  {{\/is_last}}{{\/fields}}'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/presentation/add_edit/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_state.dart

LOOK_FOR_1="String\? description,"
LOOK_FOR_2="String\? content,"
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH='{{#fields}}String? {{#camelCase}}{{field_name}}{{\/camelCase}},{{^is_last}}\n    {{\/is_last}}{{\/fields}}'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/presentation/add_edit/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_state.dart

LOOK_FOR_1="description: description \?\? this.description,"
LOOK_FOR_2="content: content \?\? this.content,"
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH='{{#fields}}{{#camelCase}}{{field_name}}{{\/camelCase}}: {{#camelCase}}{{field_name}}{{\/camelCase}} ?? this.{{#camelCase}}{{field_name}}{{\/camelCase}},{{^is_last}}\n      {{\/is_last}}{{\/fields}}'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/presentation/add_edit/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_state.dart

LOOK_FOR='status, initialData, id, description, content'
REPLACE_WITH='status, initialData, id{{#fields}}, {{#camelCase}}{{field_name}}{{\/camelCase}}{{\/fields}}'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/presentation/add_edit/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_state.dart

LOOK_FOR_1='description: null,'
LOOK_FOR_2='content: null,'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH="{{#fields}}{{#camelCase}}{{field_name}}{{\/camelCase}}: null,{{^is_last}}\n            {{\/is_last}}{{\/fields}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/presentation/add_edit/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_state_test.dart

LOOK_FOR='description'
REPLACE_WITH='{{test_field_1}}'
sed -i '' "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/presentation/add_edit/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_page_test.dart

LOOK_FOR='children: const \[_DescriptionField\(\), _ContentField\(\)\],'
REPLACE_WITH='children: const [{{#fields}}_{{#pascalCase}}{{field_name}}{{\/pascalCase}}Field\(\){{^is_last}}, {{\/is_last}}{{\/fields}}],'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTFF/presentation/add_edit/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_view.dart

LOOK_FOR_START='\/\/\*\* fields start \*\*\/\/'
LOOK_FOR_END='\/\/\*\* fields end \*\*\/\/'
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR/`cat bin\/fl_feature\/template_add_edit_view_fields.txt`/s" \
  $TGTFF/presentation/add_edit/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_view.dart

# TODO: This is not working! Why? It is almost identical with sed version bellow
#LOOK_FOR_START='expect(find.byKey(const Key(\x27\$key{{#pascalCase}}{{name_plural}}{{\/pascalCase}}WidgetItemAddEditBase-col1-description\x27)), findsOneWidget);'
#LOOK_FOR_END='expect(find.byKey(const Key(\x27$key{{#pascalCase}}{{name_plural}}{{\/pascalCase}}WidgetItemAddEditBase-col1-content\x27)), findsOneWidget);'
#perl -i -p0e 's/$LOOK_FOR_START.*\n.*$LOOK_FOR_END/aaaaaaa/s' \
#  $TGTTFF/presentation/add_edit/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_view_test.dart

LOOK_FOR_START='expect(find.byKey(const Key(\x27\$key{{#pascalCase}}{{name_plural}}{{\/pascalCase}}WidgetItemAddEditBase-col1-description\x27)), findsOneWidget);'
LOOK_FOR_END='expect(find.byKey(const Key(\x27$key{{#pascalCase}}{{name_plural}}{{\/pascalCase}}WidgetItemAddEditBase-col1-content\x27)), findsOneWidget);'
REPLACE_WITH='{{#fields}}expect(find.byKey(const Key(\x27$key{{#pascalCase}}{{name_plural}}{{\/pascalCase}}WidgetItemAddEditBase-col1-{{#paramCase}}{{field_name}}{{\/paramCase}}\x27)), findsOneWidget);{{^is_last}}\n      {{\/is_last}}{{\/fields}}'
sed -i '' "
/$LOOK_FOR_START/ {
	N
	/\n.*$LOOK_FOR_END/ {
		s/$LOOK_FOR_START.*\n.*$LOOK_FOR_END/$REPLACE_WITH/
	}
}" $TGTTFF/presentation/add_edit/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_view_test.dart

LOOK_FOR='expect(find.byType(TextFormField), findsNWidgets(2));'
REPLACE_WITH='expect(find.byType(TextFormField), findsNWidgets({{fields_length}}));'
sed -i '' "s/$LOOK_FOR/$REPLACE_WITH/" \
  $TGTTFF/presentation/add_edit/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_view_test.dart

LOOK_FOR_START='    \/\/\*\* fields start \*\*\/\/'
LOOK_FOR_END='\/\/\*\* fields end \*\*\/\/'
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR/`cat bin\/fl_feature\/template_add_edit_view_test_fields.txt`/s" \
  $TGTTFF/presentation/add_edit/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_view_test.dart

LOOK_FOR_START='_Title(item: item),'
LOOK_FOR_END='_Content(item: item),'
REPLACE_WITH='_Title(item: item),\n                {{#fields}}{{^is_title}}_{{#pascalCase}}{{field_name}}{{\/pascalCase}}\(item: item\),{{\/is_title}}{{\/fields}}'
sed -i '' "
/$LOOK_FOR_START/ {
	N
	/\n.*$LOOK_FOR_END/ {
		s/$LOOK_FOR_START.*\n.*$LOOK_FOR_END/$REPLACE_WITH/
	}
}" $TGTFF/presentation/main/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_list_item.dart

LOOK_FOR_START='subtitle: Column\('
LOOK_FOR_END='_Content\(item: item\),'
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
REPLACE_WITH='subtitle: Column(\n          children: [\n            {{#fields}}{{^is_title}}_{{#pascalCase}}{{field_name}}{{\/pascalCase}}\(item: item\),{{\/is_title}}{{\/fields}}'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/s" \
  $TGTFF/presentation/main/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_list_item.dart

LOOK_FOR_START='\/\/\*\* fields except title start \*\*\/\/'
LOOK_FOR_END='\/\/\*\* fields except title end \*\*\/\/'
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR/`cat bin\/fl_feature\/template_list_item_fields.txt`/s" \
  $TGTFF/presentation/main/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_list_item.dart

LOOK_FOR_START='            \/\/\*\* fields start \*\*\/\/'
LOOK_FOR_END='\/\/\*\* fields end \*\*\/\/'
LOOK_FOR="$LOOK_FOR_START(.*)$LOOK_FOR_END"
perl -i -p0e "s/$LOOK_FOR/`cat bin\/fl_feature\/template_item_screen_fields.txt`/s" \
  $TGTFF/presentation/show/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_screen.dart

LOOK_FOR_1='expect\(find.byKey\(const Key\(\x27\$key{{#pascalCase}}{{name_plural}}{{\/pascalCase}}WidgetItemShowBase-col1-description\x27\)\), findsOneWidget\);'
LOOK_FOR_2='expect\(find.byKey\(const Key\(\x27\$key{{#pascalCase}}{{name_plural}}{{\/pascalCase}}WidgetItemShowBase-col1-content\x27\)\), findsOneWidget\);'
LOOK_FOR="$LOOK_FOR_1\n.*$LOOK_FOR_2"
REPLACE_WITH='{{#fields}}expect(find.byKey(const Key(\x27\$key{{#pascalCase}}{{name_plural}}{{\/pascalCase}}WidgetItemShowBase-col1-{{#paramCase}}{{field_name}}{{\/paramCase}}\x27)), findsOneWidget);{{^is_last}}\n      {{\/is_last}}{{\/fields}}'
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/presentation/show/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_screen_test.dart

LOOK_FOR="description"
REPLACE_WITH="{{test_field_1}}"
perl -i -p0e "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/presentation/show/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_show_page_test.dart

LOOK_FOR='-description'
REPLACE_WITH='-{{test_field_1}}'
sed -i '' "s/$LOOK_FOR/$REPLACE_WITH/g" \
  $TGTTFF/presentation/main/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_page_test.dart

# do this after search and replaces, for some reason some files change updated time even if no changes made!
# bricks/fl_feature/__brick__/integration_test/app_{{#snakeCase}}{{name_plural}}{{/snakeCase}}_test.dart:4
echo "Restore manual update files..."
mkdir -p "$TGT/.idea/runConfigurations/app_$NMPF"
mkdir -p "$TGT/integration_test/app_$NMPF"
mv "$TGTBT/.idea/runConfigurations/app_$NMPF/snakeCase}}_integration_tests.xml" "$TGT/.idea/runConfigurations/app_$NMPF"
mv "$TGTBT/integration_test/app_$NMPF/snakeCase}}_test.dart" "$TGT/integration_test/app_$NMPF"

echo "Delete backup folder (only if it is empty!"
#rmdir $TGTBT
rmdir "$TGTBT/.idea/runConfigurations/app_$NMPF"
rmdir "$TGTBT/.idea/runConfigurations"
rmdir "$TGTBT/.idea"
rmdir "$TGTBT/integration_test/app_$NMPF"
rmdir "$TGTBT/integration_test"
rmdir "$TGTBT"

