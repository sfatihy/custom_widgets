import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {

  final Color? lineColor;
  final double? lineWidth;
  final Color? circleBorderColor;
  final EdgeInsets? dividerPadding;

  const CustomDivider({
    super.key,
    this.lineColor,
    this.lineWidth,
    this.circleBorderColor,
    this.dividerPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: dividerPadding ?? const EdgeInsets.symmetric(
        vertical: 12
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: lineWidth ?? MediaQuery.of(context).size.width * 0.35,
            height: (lineWidth ?? MediaQuery.of(context).size.width * 0.35) * 0.005,
            decoration: BoxDecoration(
              color: lineColor ?? Theme.of(context).colorScheme.primary,
            ),
          ),
          Center(
            child: Container(
              width: (lineWidth ?? MediaQuery.of(context).size.width * 0.35) * 0.04,
              height: (lineWidth ?? MediaQuery.of(context).size.width * 0.35) * 0.04,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle,
                border: Border.all(
                  color: circleBorderColor ?? Theme.of(context).colorScheme.primary
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}
