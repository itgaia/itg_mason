SRC=~/dev/ror/_examples/sample-new-app-rails
SRCF=$SRC/lib/src/features
SRCT=$SRC/test
SRCTF=$SRCT/features
TGT=~/dev/tools/itg_mason/bricks/ror_app_basic_aws/__brick__
TGTF=$TGT/lib/src/features
TGTT=$TGT/test
TGTTF=$TGTT/features

#cp $SRC/.gitignore $TGT/

mkdir -p $TGT/.ebextensions
mkdir -p $TGT/config

cp /Users/aaon/dev/ror/keeper/.ebextensions/01_ruby.config $TGT/.ebextensions
#cp /Users/aaon/dev/ror/keeper/.ebextensions/02_yarn.config $TGT/.ebextensions
#cp /Users/aaon/dev/ror/keeper/.ebextensions/03_nginx.config $TGT/.ebextensions

cp /Users/aaon/dev/ror/keeper/config/database.yml $TGT/config

sed -i '' "s%keeper_dev%sample_dev%g" $TGT/config/database.yml
