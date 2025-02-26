import 'package:flutter/material.dart';

class FabAdd extends StatelessWidget {
  final String tooltip;
  final void Function() onPressed;
  const FabAdd({
    super.key,
    required this.tooltip,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: tooltip,
      onPressed: onPressed,
      backgroundColor: Color(0xFF121212),
      shape: CircleBorder(),
      child: Icon(
        Icons.add,
        color: Colors.green,
      ),
    );
  }
}
