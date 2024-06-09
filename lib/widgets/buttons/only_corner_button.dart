import 'package:flutter/material.dart';

class OnlyCornerButton extends StatelessWidget {

  final Widget child;
  final Function() onTap;
  final List<Widget>? corners;
  final EdgeInsets? padding;
  final ShapeBorder? buttonShape;
  
  const OnlyCornerButton({
    super.key,
    required this.child,
    required this.onTap,
    this.corners,
    this.padding,
    this.buttonShape,
  }) : assert(corners == null || corners.length == 4);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: IntrinsicWidth(
        child: MaterialButton(
          shape: buttonShape ?? ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          padding: EdgeInsets.zero,
          onPressed: onTap,
          child: Stack(
            alignment: Alignment.center,
            children: [

              Padding(
                padding: padding ?? const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12
                ),
                child: child,
              ),

              ...List.generate(
                4,
                (index) => Align(
                  alignment: [Alignment.topRight, Alignment.bottomRight, Alignment.bottomLeft, Alignment.topLeft][index],
                  child: (corners != null && corners!.length == 4) ? corners![index]
                  :
                  RotatedBox(
                    quarterTurns: List.generate(4, (index) => index)[index],
                    child: List.generate(
                      4,
                      (index) => Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(50),
                          ),
                          border: Border(
                            right: BorderSide(
                              color: [Colors.yellow, Colors.greenAccent, Colors.green, Colors.blue][index],
                              width: 5
                            ),
                            top: BorderSide(
                              color: [Colors.yellow, Colors.greenAccent, Colors.green, Colors.blue][index],
                              width: 5
                            )
                          )
                        ),
                      ),
                    )[index],
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
