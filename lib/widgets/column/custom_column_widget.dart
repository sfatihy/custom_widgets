import 'package:flutter/material.dart';

class CustomColumn extends StatelessWidget {

  final EdgeInsets? padding;
  final ScrollPhysics? physics;
  final Axis scrollDirection;
  final List<Widget> children;
  /// It helps to adjust the space between children widgets.
  final Widget gap;

  const CustomColumn({
    super.key,
    this.padding,
    this.physics,
    this.scrollDirection = Axis.vertical,
    required this.children,
    required this.gap
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: padding ?? EdgeInsets.zero,
      physics: physics,
      scrollDirection: scrollDirection,
      child: Column(
        children: List.generate(
          children.length,
          (index) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              children[index],
              index != children.length - 1 ? gap : const SizedBox()
            ],
          )
        ),
      ),
    );
  }
}
