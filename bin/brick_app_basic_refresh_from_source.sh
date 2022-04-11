SRC=~/dev/flutter/_itg_tutorials/dev_framework_tutorial
SRCF=$SRC/lib/src/features
SRCT=$SRC/test
SRCTF=$SRCT/features
TGT=~/dev/tools/itg_mason/bricks/app_basic/__brick__
TGTF=$TGT/lib/src/features
TGTT=$TGT/test
TGTTF=$TGTT/features

cp $SRC/.gitignore $TGT/
cp $SRC/analysis_options.yaml $TGT/

mkdir -p $TGT/test/app
mkdir -p $TGT/test/common
mkdir -p $TGT/test/features/home

cp $SRC/test/common/test_helper.dart $TGT/test/common/
cp $SRC/test/features/home/home_page_test.dart $TGT/test/features/home/

mkdir -p $TGT/lib/src/app
mkdir -p $TGT/lib/src/common/etc
mkdir -p $TGT/lib/src/features/home

cp $SRC/lib/main_development.dart $TGT/lib/main_development.dart
cp $SRC/lib/src/bootstrap.dart $TGT/lib/src/

cp $SRC/lib/src/app/app.dart $TGT/lib/src/app/
cp $SRC/lib/src/app/app_bloc_observer.dart $TGT/lib/src/app/
cp $SRC/lib/src/app/app_config.dart $TGT/lib/src/app/
cp $SRC/lib/src/app/app_private_config.dart $TGT/lib/src/app/
cp $SRC/lib/src/app/constants.dart $TGT/lib/src/app/
cp $SRC/lib/src/app/custom_button.dart $TGT/lib/src/app/
cp $SRC/lib/src/app/injection_container.dart $TGT/lib/src/app/
cp $SRC/lib/src/app/itg_app_custom.dart $TGT/lib/src/app/

cp -r $SRC/lib/src/features/settings $TGT/lib/src/features/
cp $SRC/lib/src/features/home/home_page.dart $TGT/lib/src/features/home/

cp $SRC/lib/src/common/helper.dart $TGT/lib/src/common/
cp $SRC/lib/src/common/itg_custom.dart $TGT/lib/src/common/
cp $SRC/lib/src/common/itg_localization.dart $TGT/lib/src/common/
cp $SRC/lib/src/common/etc/itg_map.dart $TGT/lib/src/common/etc/

