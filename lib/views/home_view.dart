import 'package:flutter/material.dart';
import '../widgets/date_card.dart';
import '../utils/date_format_options.dart';

class HomeView extends StatelessWidget {
  final DateFormatOption dateFormat;

  const HomeView({super.key, required this.dateFormat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child: DateSquare(format: dateFormat)),
        ],
      ),
    );
  }
}
