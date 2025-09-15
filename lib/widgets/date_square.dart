import 'dart:async';
import 'package:flutter/material.dart';
import '../utils/date_format_options.dart';

class DateSquare extends StatefulWidget {
  final DateFormatOption format;

  const DateSquare({super.key, this.format = DateFormatOption.dayMonthYear});

  @override
  DateSquareState createState() => DateSquareState();
}

class DateSquareState extends State<DateSquare> {
  late DateTime today;
  Timer? _timer;

  /// Returns a DateTime representing the current day at 00:00:00.
  DateTime getToday() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

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

String formatDate(DateTime date) {
  switch (widget.format) {
    case DateFormatOption.yearMonthDay:
      return "${date.year}-${date.month.toString().padLeft(2,'0')}-${date.day.toString().padLeft(2,'0')}";
    case DateFormatOption.dayMonthYear:
      return "${date.day.toString().padLeft(2,'0')}.${date.month.toString().padLeft(2,'0')}.${date.year}";
    case DateFormatOption.monthDayYear:
      return "${_monthAbbr(date.month)} ${date.day}, ${date.year}";
  }
}

String _monthAbbr(int month) {
  const names = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
  return names[month-1];
}


  @override
  Widget build(BuildContext context) {

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          formatDate(today),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }


}
