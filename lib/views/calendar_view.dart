import 'package:flutter/material.dart';

import '../widgets/buttons/only_corner_button.dart';
import '../widgets/calendar/calendar_widget.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: Column(
        spacing: 24,
        children: [
          const CalendarWidget(),

          OnlyCornerButton(
            child: const Text('Save'),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
