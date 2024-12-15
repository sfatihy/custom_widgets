import 'package:flutter/material.dart';

import 'package:custom_widgets/widgets/calendar/calendar_widget.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: const CalendarWidget(),
    );
  }
}
