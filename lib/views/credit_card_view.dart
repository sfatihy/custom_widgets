import 'package:flutter/material.dart';

import '../widgets/buttons/colorful_button.dart';
import '../widgets/credit_card/credit_card_widget.dart';

class CreditCardView extends StatelessWidget {
  const CreditCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credit Card'),
      ),
      body: Theme(
        data: ThemeData(
          textTheme: TextTheme(
            bodyLarge: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            labelStyle: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 14,
            ),
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 12,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Theme.of(context).colorScheme.primary
          )
        ),
        child: Column(
          spacing: 12,
          children: [
            const CreditCardWidget(
              amount: 15000
            ),

            ColorfulButton(
              child: const Text('Pay'),
              onTap: () {

              }
            )
          ],
        ),
      ),
    );
  }
}
