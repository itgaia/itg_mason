SRCAPPNAME=itg_mush_manager
SRC=~/dev/flutter/md/$SRCAPPNAME
SRCF=$SRC/lib/src/features
SRCT=$SRC/test
SRCTF=$SRCT/features

TGT=~/dev/tools/itg_mason/bricks/fl_app_basic/__brick__
TGTF=$TGT/lib/src/features
TGTT=$TGT/test
TGTTF=$TGTT/features

cp $SRC/analysis_options.yaml $TGT/

mkdir -p $TGT/test/app
mkdir -p $TGT/test/features/home
mkdir -p $TGT/integration_test
mkdir -p $TGT/test_driver

cp $SRC/integration_test/driver.dart $TGT/integration_test/
cp $SRC/test_driver/integration_test.dart $TGT/test_driver/

mkdir -p $TGT/lib/src/app
mkdir -p $TGT/lib/src/features/home

cp $SRC/lib/main_development.dart $TGT/lib/main_development.dart
cp $SRC/lib/main_production.dart $TGT/lib/main_production.dart
cp $SRC/lib/src/bootstrap.dart $TGT/lib/src/

cp $SRC/lib/src/app/app.dart $TGT/lib/src/app/
cp $SRC/lib/src/app/app_bloc_observer.dart $TGT/lib/src/app/
cp $SRC/lib/src/app/app_config.dart $TGT/lib/src/app/
cp $SRC/lib/src/app/app_private_config.dart $TGT/lib/src/app/
cp $SRC/lib/src/app/constants.dart $TGT/lib/src/app/
cp $SRC/lib/src/app/custom_button.dart $TGT/lib/src/app/

cp -r $SRC/lib/src/features/settings $TGT/lib/src/features/

# *** do not copy those files - synch manually ... ***
#cp $SRC/test/features/home/home_page_test.dart $TGT/test/features/home/
#cp $SRC/integration_test/app_test.dart $TGT/integration_test/
#cp $SRC/lib/src/app/injection_container.dart $TGT/lib/src/app/
#cp $SRC/lib/src/app/itg_app_custom.dart $TGT/lib/src/app/
#cp $SRC/lib/src/features/home/home_page.dart $TGT/lib/src/features/home/
#sed -i '' s%DEVFWRK_TUT_P1%{{#pascalCase}}{{app_name}}{{/pascalCase}}%g \
#  bricks/fl_app_basic/__brick__/lib/src/app/itg_app_custom.dart
#sed -i '' s%"Dev Framework Tutorial (part 1)"%{{app_descr}}%g \
#  bricks/fl_app_basic/__brick__/lib/src/app/itg_app_custom.dart

find $TGT -type f -name '*.dart' -exec sed -i '' s%$SRCAPPNAME%{{#snakeCase}}{{app_name}}{{/snakeCase}}%g {} +