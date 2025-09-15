import 'package:flutter/material.dart';
import 'widgets/navigation.dart';
import 'utils/date_format_options.dart';

void main() {
  runApp(const MoodTrackerApp());
}

class MoodTrackerApp extends StatefulWidget {
  const MoodTrackerApp({super.key});

  @override
  State<MoodTrackerApp> createState() => _MoodTrackerAppState();
}

class _MoodTrackerAppState extends State<MoodTrackerApp> {

  /// Dark Mode
  bool _darkMode = false;

  void toggleDarkMode(bool value) {
    setState(() {
      _darkMode = value;
    });
  }

  /// Date Format
  DateFormatOption dateFormat = DateFormatOption.dayMonthYear;

  void setDateFormat(DateFormatOption format) {
    setState(() {
      dateFormat = format;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Tracker',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
      home: Navigation(
        darkMode: _darkMode,
        onToggleDarkMode: toggleDarkMode,
        dateFormat: dateFormat,
        onSetDateFormat: setDateFormat,
      ),
    );
  }
}
