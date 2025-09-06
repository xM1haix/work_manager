import "package:flutter/material.dart";

class FabAdd extends StatelessWidget {
  const FabAdd({
    required this.tooltip,
    required this.onPressed,
    super.key,
  });
  final String tooltip;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: tooltip,
      onPressed: onPressed,
      backgroundColor: const Color(0xFF121212),
      shape: const CircleBorder(),
      child: const Icon(
        Icons.add,
        color: Colors.green,
      ),
    );
  }
}
