import 'package:flutter/material.dart';
import '../models/mood.dart';

class MoodSquare extends StatelessWidget {
  final Mood mood;
  final VoidCallback onTap;

  const MoodSquare({super.key, required this.mood, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: mood.color,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
