mason make feature --on-conflict overwrite \
  -o "$TARGET" \
  --name_singular link \
  --name_plural links \
  --abbreviation ln

# temp solution until issue solved with mason and not replace vars in links_repository_impl.dart
sed -i '' "s%{{#snakeCase}}{{name_plural}}{{/snakeCase}}%links%g" \
  "$TARGET"/lib/src/features/links/data/links_repository_impl.dart
sed -i '' "s%{{#pascalCase}}{{name_plural}}{{/pascalCase}}%Links%g" \
  "$TARGET"/lib/src/features/links/data/links_repository_impl.dart
