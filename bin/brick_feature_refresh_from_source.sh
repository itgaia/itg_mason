SRC=~/dev/flutter/_itg_tutorials/dev_framework_tutorial
SRCF=$SRC/lib/src/features
SRCT=$SRC/test
SRCTF=$SRCT/features
TGT=~/dev/tools/itg_mason/bricks/feature/__brick__
TGTF=$TGT/lib/src/features
TGTT=$TGT/test
TGTTF=$TGTT/features
NMP={{#snakeCase}}{{name_plural}}{{/snakeCase}}
NMPF={{#snakeCase}}{{name_plural}}{{

rm -rf $TGT
mkdir -p $TGT

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
cp $SRCT/fixtures/notes_response_fixture.json $TGTT/fixtures/$NMP\_response_fixture.json
cp $SRCTF/notes/data/notes_model_test.dart $TGTTF/$NMP/data/$NMP\_model_test.dart
cp $SRCTF/notes/data/notes_remote_datasource_test.dart $TGTTF/$NMP/data/$NMP\_remote_datasource_test.dart
cp $SRCTF/notes/data/notes_repository_impl_test.dart $TGTTF/$NMP/data/$NMP\_repository_impl_test.dart
cp $SRCTF/notes/domain/notes_support_test.dart $TGTTF/$NMP/domain/$NMP\_support_test.dart
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
