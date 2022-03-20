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
              children: const [_DescriptionField(), _ContentField()],
            ),
          ),
        ),
      ),
    );
  }
}

class _DescriptionField extends StatelessWidget {
  const _DescriptionField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc>().state;
    final hintText = state.initialData?.description ?? '';
    itgLogVerbose('[{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditView._DescriptionField.build] text: $hintText, label: ${ItgLocalization.tr('description')}');

    return TextFormField(
      key: const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-description'),
      initialValue: state.description,
      decoration: InputDecoration(
        enabled: !state.status.isSubmittingOrSuccess,
        labelText: ItgLocalization.tr('description'),
        hintText: hintText,
      ),
      maxLength: 50,
      inputFormatters: [
        LengthLimitingTextInputFormatter(50),
      ],
      onChanged: (value) {
        itgLogVerbose('{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditView._DescriptionField - TextFormField - onChange - value: $value');
        context.read<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc>().add({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditDescriptionChangedEvent(value));
        // sl<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc>().add({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditCodeChangedEvent(value));
      },
    );
  }
}

class _ContentField extends StatelessWidget {
  const _ContentField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc>().state;
    final hintText = state.initialData?.content ?? '';
    itgLogVerbose('[{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditView._ContentField.build] text: $hintText, label: ${ItgLocalization.tr('content')}');

    return TextFormField(
      key: const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-content'),
      initialValue: state.content,
      decoration: InputDecoration(
        enabled: !state.status.isSubmittingOrSuccess,
        labelText: ItgLocalization.tr('content'),
        hintText: hintText,
      ),
      maxLength: 300,
      maxLines: 7,
      inputFormatters: [
        LengthLimitingTextInputFormatter(300),
      ],
      onChanged: (value) {
        itgLogVerbose('{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditView._ContentField - TextFormField - onChange - value: $value');
        context.read<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc>().add({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditContentChangedEvent(value));
        // sl<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc>().add({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEdit{{#pascalCase}}{{name_plural}}{{/pascalCase}}ChangedEvent(value));
      },
    );
  }
}
