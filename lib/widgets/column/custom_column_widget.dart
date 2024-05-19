import 'package:flutter/material.dart';

class CustomColumn extends StatelessWidget {

  final EdgeInsets? padding;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final Axis scrollDirection;
  final List<Widget> children;
  /// It helps to adjust the space between children widgets.
  final Widget gap;

  const CustomColumn({
    super.key,
    this.padding,
    this.physics,
    this.shrinkWrap = false,
    this.scrollDirection = Axis.vertical,
    required this.children,
    required this.gap
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding ?? EdgeInsets.zero,
      physics: physics,
      shrinkWrap: shrinkWrap,
      scrollDirection: scrollDirection,
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
      separatorBuilder: (context, index) => gap,
    );
  }
}
