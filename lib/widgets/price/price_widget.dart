import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {

  final double price;
  final double? discountedPrice;
  final String currency;

  const PriceWidget({
    super.key,
    required this.price,
    this.discountedPrice,
    required this.currency
  }) : assert(discountedPrice == null || discountedPrice < price, 'The discountedPrice field cannot be more greater than the price field');

  String priceModifier(double price) {
    String priceStr = price.toStringAsFixed(2);

    List<String> parts = priceStr.split('.');
    String integerPart = parts[0];

    for (int i = integerPart.length - 3; i > 0; i -= 3) {
      integerPart = '${integerPart.substring(0, i)},${integerPart.substring(i)}';
    }

    return '$integerPart.${parts[1]}';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [

        Text(
          '$currency${discountedPrice != null ? priceModifier(discountedPrice ?? 0).split('.').first : priceModifier(price).split('.').first}',
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w300,
            height: 0,
          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            discountedPrice != null ? Text(
              priceModifier(price),
              style: const TextStyle(
                fontSize: 10,
                color: Colors.black45,
                fontWeight: FontWeight.w600,
                decorationColor: Colors.black45,
                decorationStyle: TextDecorationStyle.solid,
                decoration: TextDecoration.lineThrough,
                height: 0
              ),
            ) : const SizedBox(),

            Text(
              '.${discountedPrice != null ? priceModifier(discountedPrice ?? 0).split('.').last : priceModifier(price).split('.').last}',
              style: TextStyle(
                fontSize: discountedPrice != null ? 16 : 20,
                fontWeight: FontWeight.w300,
                height: 0
              ),
            ),

          ],
        )

      ],
    );
  }
}
