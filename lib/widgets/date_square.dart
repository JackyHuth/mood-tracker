import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mood_tracker/utils/date_getter.dart';

class DateSquare extends StatefulWidget {
  const DateSquare({super.key});

  @override
  _DateSquareState createState() => _DateSquareState();
}

class _DateSquareState extends State<DateSquare> {
  late DateTime today;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    today = getToday();

    // Calculate duration until next midnight
    final tomorrow = today.add(const Duration(days: 1));
    final durationUntilMidnight = tomorrow.difference(DateTime.now());

    // Schedule update at midnight
    _timer = Timer(durationUntilMidnight, () {
      setState(() {
        today = getToday();
      });

      // After first update, repeat every 24 hours
      _timer = Timer.periodic(const Duration(days: 1), (_) {
        setState(() {
          today = getToday();
        });
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formatted = "${today.day.toString().padLeft(2,'0')}/"
                      "${today.month.toString().padLeft(2,'0')}/"
                      "${today.year}";

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        formatted,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
