import 'package:flutter/material.dart';
import 'package:work_manager_client/work_manager_client.dart';

Widget _widget(Widget err) => Center(child: err);

class CustomFutureBuilder<T> extends StatelessWidget {
  final Future<T> future;
  final Widget Function(T e) success;
  final Widget Function(Widget err) error;
  final Widget Function(Widget loading) loading;

  const CustomFutureBuilder({
    super.key,
    required this.future,
    this.error = _widget,
    this.loading = _widget,
    required this.success,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, s) {
          if (s.hasError) print(s.error);
          return AnimatedSwitcher(
            duration: Duration(seconds: 1),
            child: s.hasError
                ? error(
                    Text(
                      s.error is CustomException
                          ? (s.error as CustomException).message
                          : s.error.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                : !s.hasData
                    ? loading(CircularProgressIndicator())
                    : success(s.data as T),
          );
        });
  }
}
