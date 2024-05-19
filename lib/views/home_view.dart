import 'package:flutter/material.dart';

import 'package:custom_widgets/widgets/column/custom_column_widget.dart';
import 'package:custom_widgets/widgets/divider/custom_divider_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Custom Widgets by sfatihy",
          style: TextStyle(
            color: Colors.yellowAccent.shade700,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic,
            fontSize: 18
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: CustomColumn(
          padding: const EdgeInsets.symmetric(vertical: 8),
          gap: CustomDivider(
            lineColor: Colors.black,
            lineWidth: MediaQuery.of(context).size.width * 0.5,
            circleBorderColor: Colors.black,
          ),
          children: List.generate(
            50,
            (index) => Center(
              child: Text(index.toString())
            )
          )
        ),
      )
    );
  }
}
