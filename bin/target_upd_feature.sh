mason make feature --on-conflict overwrite \
  -o "$TARGET" \
  -c bricks/feature/config.json

# temp solution until issue solved with mason and not replace vars in links_repository_impl.dart
sed -i '' "s%{{#snakeCase}}{{name_plural}}{{/snakeCase}}%links%g" \
  "$TARGET"/lib/src/features/links/data/links_repository_impl.dart
sed -i '' "s%{{#snakeCase}}{{name_singular}}{{/snakeCase}}%link%g" \
  "$TARGET"/lib/src/features/links/data/links_repository_impl.dart
sed -i '' "s%{{#pascalCase}}{{name_plural}}{{/pascalCase}}%Links%g" \
  "$TARGET"/lib/src/features/links/data/links_repository_impl.dart
sed -i '' "s%{{#pascalCase}}{{name_singular}}{{/pascalCase}}%Link%g" \
  "$TARGET"/lib/src/features/links/data/links_repository_impl.dart
sed -i '' "s%&#x27;&#x27;%''%g" \
  "$TARGET"/lib/src/features/links/presentation/add_edit/bloc/links_item_add_edit_bloc.dart
sed -i '' "s%&#x27;&#x27;%''%g" \
  "$TARGET"/lib/src/features/links/presentation/add_edit/bloc/links_item_add_edit_state.dart
# Temp fix empty lines
sed -i '' "N;N;N;s%\*\*\/\/\n.*\nclass%**//\nclass%g" \
  "$TARGET"/lib/src/features/links/presentation/main/links_list_item.dart
# Temp fix empty lines - TODO: Why sed is not working?
#sed -i '' "N;N;N;s%description,\n\s{4}%description,%g" \
perl -i -p0e "s/,\n\s{4}\n{2}/,/g" \
  "$TARGET"/lib/src/features/links/data/links_model.dart
