import 'package:flutter/material.dart';

import 'animated_number_widget.dart';

class AnimatedPriceWidget extends StatefulWidget {

  final double price;
  final String currency;

  const AnimatedPriceWidget({
    super.key,
    required this.price,
    required this.currency
  }) : assert(price >= 0);

  @override
  State<AnimatedPriceWidget> createState() => _AnimatedPriceWidgetState();
}

class _AnimatedPriceWidgetState extends State<AnimatedPriceWidget> {

  late List<dynamic> numbers;

  List priceModifier(double price) {
    String priceStr = price.toStringAsFixed(2);

    List<String> parts = priceStr.split('.');
    String integerPart = parts[0];

    for (int i = integerPart.length - 3; i > 0; i -= 3) {
      integerPart = '${integerPart.substring(0, i)},${integerPart.substring(i)}';
    }

    List<String> splitList = ('$integerPart.${parts[1]}').split('');
    List<dynamic> formattedList = [];

    for(int i = 0; i < splitList.length; i++) {
      splitList[i] == '.' || splitList[i] == ',' ? formattedList.add(splitList[i]) : formattedList.add(int.parse(splitList[i]));
    }

    return formattedList;
  }

  @override
  void initState() {
    super.initState();

    numbers = priceModifier(widget.price);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.currency,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w300,
            height: 0,
          ),
        ),
        ...List.generate(
          numbers.length,
          (index) => numbers[index] == '.' || numbers[index] == ',' ?
          Text(
            numbers[index].toString(),
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w300,
              height: 0,
            ),
          )
          :
          AnimatedNumberWidget(number: numbers[index])
        ),
      ]
    );
  }
}
