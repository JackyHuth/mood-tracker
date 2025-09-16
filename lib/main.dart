import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: Brightness.light,
            ),

            textTheme: TextTheme(
              displayLarge: const TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
              ),
              titleLarge: GoogleFonts.sniglet(
                fontSize: 30,
              ),
              bodyMedium: GoogleFonts.sniglet(),
              displaySmall: GoogleFonts.sniglet(),
            ),
          ),
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
