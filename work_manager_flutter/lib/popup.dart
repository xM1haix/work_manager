import 'package:flutter/material.dart';

import 'nav.dart';

Future<bool> confirmPopup(BuildContext context, String question) async {
  final x = await showDialog<bool?>(
    context: context,
    builder: (context) => AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      title: Text(
        question,
        textAlign: TextAlign.center,
      ),
      actions: [
        PopupAction('Yes!', true),
        PopupAction('No!', false),
      ].map((e) => e.toWidget(context)).toList(),
    ),
  );
  return x ?? false;
}

Future<void> errorPopup(BuildContext context, dynamic e) async =>
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Something went wrong"),
        content: Text('error: $e'),
        actionsAlignment: MainAxisAlignment.center,
        actions: [PopupAction('Ok!').toWidget(context)],
      ),
    );
Future<void> infoPopup(BuildContext context, String title) async =>
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        actionsAlignment: MainAxisAlignment.center,
        actions: [PopupAction('Ok!').toWidget(context)],
      ),
    );
Future<T?> popup<T>(
        BuildContext context, String title, List<PopupAction<T>> actions,
        {Widget? content}) async =>
    await showDialog<T>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: content,
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: actions.map((e) => e.toWidget(context)).toList(),
      ),
    );

class PopupAction<T> {
  final String text;
  final T? value;
  PopupAction(this.text, [this.value]);
  Widget toWidget(BuildContext context) => TextButton(
        onPressed: () => back(context, value),
        child: Text(text),
      );
}
