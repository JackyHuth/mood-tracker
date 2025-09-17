import 'package:flutter/material.dart';
import '../views/home_view.dart';
import '../views/settings_view.dart';
import '../views/moods_calender_view.dart';
import '../utils/date_format_options.dart';

class Navigation extends StatefulWidget {
  final bool darkMode;
  final ValueChanged<bool> onToggleDarkMode;

  final DateFormatOption dateFormat;
  final ValueChanged<DateFormatOption> onSetDateFormat;

  const Navigation({
    super.key,
    required this.darkMode,
    required this.onToggleDarkMode,
    required this.dateFormat,
    required this.onSetDateFormat,
  });

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;

  void _onTabSelected(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final titles = ['Mood Tracker', 'Calendar', 'Settings'];

    final pages = [
      HomeView(dateFormat: widget.dateFormat),
      MoodsCalenderView(),
      SettingsView(
        darkMode: widget.darkMode,
        onToggleDarkMode: widget.onToggleDarkMode,
        dateFormat: widget.dateFormat,
        onSetDateFormat: widget.onSetDateFormat,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
              titles[_currentIndex],
              style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600, // semi-bold
            ),
          ),
        ),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabSelected,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Calender'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
