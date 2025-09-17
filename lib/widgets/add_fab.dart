import 'package:flutter/material.dart';

class AddFab extends StatelessWidget {
  final VoidCallback onPressed;
  final String? tooltip;

  const AddFab({
    super.key,
    required this.onPressed,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(), 
      tooltip: tooltip ?? "Add",
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}