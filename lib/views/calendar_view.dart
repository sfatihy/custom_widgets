import 'package:custom_widgets/widgets/buttons/colorful_button.dart';
import 'package:custom_widgets/widgets/buttons/only_corner_button.dart';
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
      body: Column(
        spacing: 24,
        children: [
          const CalendarWidget(),

          OnlyCornerButton(
            child: const Text('Kaydet'),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
