import 'package:flutter/material.dart';

void back<T>(BuildContext context, [T? x]) => Navigator.pop(context, x);

Future<T> nav<T>(BuildContext context, Widget page, [replace = false]) async {
  final mpr = MaterialPageRoute(builder: (context) => page);
  return replace
      ? await Navigator.pushReplacement(context, mpr)
      : await Navigator.push(context, mpr);
}
