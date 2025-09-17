import 'package:flutter/material.dart';
import '../utils/date_format_options.dart';

class SettingsView extends StatelessWidget {
  final bool darkMode;
  final ValueChanged<bool> onToggleDarkMode;

  final DateFormatOption dateFormat;
  final ValueChanged<DateFormatOption> onSetDateFormat;

  const SettingsView({
    super.key,
    required this.darkMode,
    required this.onToggleDarkMode,
    required this.dateFormat,
    required this.onSetDateFormat,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SwitchListTile(
          title: const Text('Dark Mode'),
          value: darkMode,
          onChanged: onToggleDarkMode,
        ),
        const SizedBox(height: 16),
        const Text('Date Format', style: TextStyle(fontWeight: FontWeight.bold)),
        
          RadioListTile<DateFormatOption>(
            title: const Text('Year-Month-Day'),
            value: DateFormatOption.yearMonthDay,
            groupValue: dateFormat,
            onChanged: (newFormat) {
              if (newFormat != null) onSetDateFormat(newFormat);
            },
          ),
          RadioListTile<DateFormatOption>(
            title: const Text('Day.Month.Year'),
            value: DateFormatOption.dayMonthYear,
            groupValue: dateFormat,
            onChanged: (newFormat) {
              if (newFormat != null) onSetDateFormat(newFormat);
            },
          ),
          RadioListTile<DateFormatOption>(
            title: const Text('Month Day, Year'),
            value: DateFormatOption.monthDayYear,
            groupValue: dateFormat,
            onChanged: (newFormat) {
              if (newFormat != null) onSetDateFormat(newFormat);
            },
          ),

      ],
    );
  }
}
