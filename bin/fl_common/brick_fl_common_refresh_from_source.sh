SRCAPPNAME=dev_framework_tutorial
SRC=~/dev/flutter/_itg_tutorials/$SRCAPPNAME
TGT=~/dev/tools/itg_mason/bricks/fl_common/__brick__

mkdir -p $TGT/test/common
mkdir -p $TGT/test/fixtures

cp $SRC/test/common/app_test_helper.dart $TGT/test/common/
cp $SRC/test/common/test_helper.dart $TGT/test/common/
cp $SRC/test/fixtures/fixture_helper.dart $TGT/test/fixtures/

mkdir -p $TGT/lib/src/common/etc
mkdir -p $TGT/lib/src/core/error
mkdir -p $TGT/lib/src/core/support
mkdir -p $TGT/lib/src/core/usecase

cp $SRC/lib/src/common/helper.dart $TGT/lib/src/common/
cp $SRC/lib/src/common/itg_custom.dart $TGT/lib/src/common/
cp $SRC/lib/src/common/itg_localization.dart $TGT/lib/src/common/
cp $SRC/lib/src/common/etc/itg_map.dart $TGT/lib/src/common/etc/
cp $SRC/lib/src/common/etc/itg_text.dart $TGT/lib/src/common/etc/
cp $SRC/lib/src/core/error/exception.dart $TGT/lib/src/core/error/
cp $SRC/lib/src/core/error/failures.dart $TGT/lib/src/core/error/
cp $SRC/lib/src/core/support/support_base.dart $TGT/lib/src/core/support/
cp $SRC/lib/src/core/usecase/usecase.dart $TGT/lib/src/core/usecase/

find $TGT -type f -name '*.dart' -exec sed -i '' s%$SRCAPPNAME%{{#snakeCase}}{{app_name}}{{/snakeCase}}%g {} +