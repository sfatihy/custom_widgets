import 'package:flutter/material.dart';

import 'package:custom_widgets/widgets/animated_price/animated_price_widget.dart';
import 'package:custom_widgets/widgets/animated_price_wheel/animated_price_wheel_widget.dart';
import 'package:custom_widgets/widgets/buttons/only_corner_button.dart';
import 'package:custom_widgets/widgets/column/custom_column_widget.dart';
import 'package:custom_widgets/widgets/divider/custom_divider_widget.dart';
import 'package:custom_widgets/widgets/price/price_widget.dart';

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
          children: [

            OnlyCornerButton(
              child: Text('Login'),
              onTap: () {

              },
            ),

            const PriceWidget(
              price: 129.99,
              discountedPrice: 119.99,
              currency: '\u0024',
            ),

            const AnimatedPriceWidget(
              price: 10119.99,
              currency: '\u0024',
            ),

            const AnimatedPriceWheelWidget(
              price: 10119.99,
              currency: '\u0024',
            ),

          ]
        ),
      )
    );
  }
}
