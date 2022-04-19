import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/constants.dart';
import '../../../../common/helper.dart';
import '../../../../common/itg_localization.dart';
import '../../domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_helper.dart';
import 'bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_bloc.dart';

class {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditView extends StatelessWidget {
  const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final status = context.select(({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc bloc) => bloc.state.status);
    // final isNew = context.select(({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc bloc) => bloc.state.isNew);
    final theme = Theme.of(context);
    final floatingActionButtonTheme = theme.floatingActionButtonTheme;
    final fabBackgroundColor = floatingActionButtonTheme.backgroundColor ?? theme.colorScheme.secondary;
    // final String title = isNew
    //     ? ItgLocalization.tr(appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddPage)
    //     : ItgLocalization.tr(appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemEditPage);
    const String baseMsgSource = '[{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditView.build]';
    itgLogVerbose('$baseMsgSource title: $title');

    return Scaffold(
      appBar: AppBar(title: Text(title, key: keyTextPageTitle)),
      floatingActionButton: FloatingActionButton(
        tooltip: ItgLocalization.tr('Save changes'),
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        backgroundColor: status.isSubmittingOrSuccess
            ? fabBackgroundColor.withOpacity(0.5)
            : fabBackgroundColor,
        onPressed: status.isSubmittingOrSuccess
            ? null
            // : () => context.read<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc>().add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditSubmittedEvent()),
            : () {
          itgLogVerbose('$baseMsgSource save - clicked - add {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditSubmittedEvent...');
          context.read<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc>().add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditSubmittedEvent());
          // sl<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc>().add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditSubmittedEvent());
        },
        child: status.isSubmittingOrSuccess
            ? const CupertinoActivityIndicator()
            : const Icon(Icons.check_rounded),
        key: keyButtonSaveItemAddEditPage,
      ),
      body: CupertinoScrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: const [{{#fields}}_{{#pascalCase}}{{field_name}}{{/pascalCase}}Field(){{^is_last}}, {{/is_last}}{{/fields}}],
            ),
          ),
          key: keyItemAddEditViewWidget
        ),
      ),
    );
  }
}

//** fields start **//
{{#fields}}class _{{#pascalCase}}{{field_name}}{{/pascalCase}}Field extends StatelessWidget {
  const _{{#pascalCase}}{{field_name}}{{/pascalCase}}Field({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc>().state;
    final hintText = state.initialData?.{{#camelCase}}{{field_name}}{{/camelCase}} ?? '';
    itgLogVerbose('[{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditView._{{#pascalCase}}{{field_name}}{{/pascalCase}}Field.build] text: $hintText, label: ${ItgLocalization.tr('{{#camelCase}}{{field_name}}{{/camelCase}}')}');

    return TextFormField(
      key: const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-{{#paramCase}}{{field_name}}{{/paramCase}}'),
      initialValue: state.{{#camelCase}}{{field_name}}{{/camelCase}},
      decoration: InputDecoration(
        enabled: !state.status.isSubmittingOrSuccess,
        labelText: ItgLocalization.tr('{{#camelCase}}{{field_name}}{{/camelCase}}'),
        hintText: hintText,
      ),
      maxLength: {{max_length}},
      {{#is_ml}}maxLines: 7,{{/is_ml}}
      inputFormatters: [
        LengthLimitingTextInputFormatter({{max_length}}),
      ],
      onChanged: (value) {
        itgLogVerbose('{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditView._{{#pascalCase}}{{field_name}}{{/pascalCase}}Field - TextFormField - onChange - value: $value');
        context.read<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc>().add({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEdit{{#pascalCase}}{{field_name}}{{/pascalCase}}ChangedEvent(value));
        // sl<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc>().add({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditCodeChangedEvent(value));
      },
    );
  }
}{{^is_last}}

{{/is_last}}{{/fields}}
//** fields end **//
