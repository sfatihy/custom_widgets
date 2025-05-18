import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreditCardWidget extends StatefulWidget {
  final double amount;
  final String? companyLogoAsset;
  final String? nfcIconAsset;
  final String? cardNetworkLogoUrl;

  const CreditCardWidget({
    Key? key,
    required this.amount,
    this.companyLogoAsset,
    this.nfcIconAsset,
    this.cardNetworkLogoUrl,
  }) : super(key: key);

  @override
  State<CreditCardWidget> createState() => _CreditCardWidgetState();
}

class _CreditCardWidgetState extends State<CreditCardWidget> {

  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardHolderController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _cardHolderController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        CreditCardForm(
          cardNumberController: _cardNumberController,
          cardHolderController: _cardHolderController,
          expiryDateController: _expiryDateController,
          cvvController: _cvvController,
          onFormChanged: () => setState(() {}),
        ),

        CreditCardView(
          amount: widget.amount,
          companyLogoAsset: widget.companyLogoAsset,
          nfcIconAsset: widget.nfcIconAsset,
          cardNetworkLogoUrl: widget.cardNetworkLogoUrl,
          cardNumberController: _cardNumberController,
          cardHolderController: _cardHolderController,
          expiryDateController: _expiryDateController,
          cvvController: _cvvController,
        ),
      ],
    );
  }
}

class CreditCardForm extends StatelessWidget {
  final TextEditingController cardNumberController;
  final TextEditingController cardHolderController;
  final TextEditingController expiryDateController;
  final TextEditingController cvvController;
  final VoidCallback onFormChanged;

  const CreditCardForm({
    Key? key,
    required this.cardNumberController,
    required this.cardHolderController,
    required this.expiryDateController,
    required this.cvvController,
    required this.onFormChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 12,
        children: [
          CardNumberField(
            controller: cardNumberController,
            onChanged: (_) => onFormChanged(),
          ),

          CardHolderField(
            controller: cardHolderController,
            onChanged: (_) => onFormChanged(),
          ),

          Row(
            spacing: 12,
            children: [
              Expanded(
                child: CardExpiryField(
                  controller: expiryDateController,
                  onChanged: (_) => onFormChanged(),
                ),
              ),

              Expanded(
                child: CardCvvField(
                  controller: cvvController,
                  onChanged: (_) => onFormChanged(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CardNumberField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;

  const CardNumberField({
    Key? key,
    required this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Credit Card Number',
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        _CardNumberInputFormatter(),
      ],
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
    );
  }
}

class CardHolderField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;

  const CardHolderField({
    Key? key,
    required this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Full Name',
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
      ],
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.characters,
      onChanged: onChanged,
    );
  }
}

class CardExpiryField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;

  const CardExpiryField({
    Key? key,
    required this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        hintText: 'MM/YY',
        labelText: 'Expiry Date',
      ),
      inputFormatters: [
        _ExpiryDateInputFormatter(),
      ],
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
    );
  }
}

class CardCvvField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;

  const CardCvvField({
    Key? key,
    required this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        hintText: '***',
        labelText: 'CVV',
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(3),
      ],
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      obscureText: true,
    );
  }
}

class CreditCardView extends StatelessWidget {
  final double amount;
  final String? companyLogoAsset;
  final String? nfcIconAsset;
  final String? cardNetworkLogoUrl;
  final TextEditingController cardNumberController;
  final TextEditingController cardHolderController;
  final TextEditingController expiryDateController;
  final TextEditingController cvvController;

  const CreditCardView({
    Key? key,
    required this.amount,
    this.companyLogoAsset,
    this.nfcIconAsset,
    this.cardNetworkLogoUrl,
    required this.cardNumberController,
    required this.cardHolderController,
    required this.expiryDateController,
    required this.cvvController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black54,
      margin: const EdgeInsets.symmetric(
        horizontal: 16
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.225,
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            CardHeader(
              amount: amount,
              companyLogoAsset: companyLogoAsset,
            ),

            CardBody(
              cardNumberController: cardNumberController,
              cardHolderController: cardHolderController,
            ),

            nfcIconAsset != null
              ? Align(
                alignment: const Alignment(1, -0.45),
                child: Image.asset(
                  nfcIconAsset!,
                  width: 40,
                  color: Colors.white60,
                ),
              )
              : const SizedBox(),

            CardFooter(
              cardNetworkLogoUrl: cardNetworkLogoUrl,
              expiryDateController: expiryDateController,
              cvvController: cvvController,
            ),
          ],
        ),
      ),
    );
  }
}

class CardHeader extends StatelessWidget {
  final double amount;
  final String? companyLogoAsset;

  const CardHeader({
    Key? key,
    required this.amount,
    this.companyLogoAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _formatPrice(amount),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),

        companyLogoAsset != null
          ? Image.network(
            companyLogoAsset!,
            width: 48,
          )
          : const FlutterLogo(
            size: 36,
          )
      ],
    );
  }

  String _formatPrice(double price) {
    return "${price.toStringAsFixed(2).replaceAll('.', ',')} \$";
  }
}

class CardBody extends StatelessWidget {
  final TextEditingController cardNumberController;
  final TextEditingController cardHolderController;

  const CardBody({
    Key? key,
    required this.cardNumberController,
    required this.cardHolderController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.65,
            child: Text(
              cardNumberController.text.isEmpty
                ? '0000 **** **** ****'
                : cardNumberController.text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Text(
              cardHolderController.text.isEmpty
                ? 'FULL NAME'
                : cardHolderController.text.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class CardFooter extends StatelessWidget {
  final String? cardNetworkLogoUrl;
  final TextEditingController expiryDateController;
  final TextEditingController cvvController;

  const CardFooter({
    Key? key,
    this.cardNetworkLogoUrl,
    required this.expiryDateController,
    required this.cvvController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          cardNetworkLogoUrl != null
            ? SizedBox(
              height: 40,
              width: 60,
              child: Image.network(
                cardNetworkLogoUrl!,
                errorBuilder: (ctx, err, stack) => Container(),
              ),
            )
            : const SizedBox(),

          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 4,
                  children: [
                    const Text(
                      'Expiry Date',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),

                    Text(
                      expiryDateController.text.isEmpty
                        ? '00/00'
                        : expiryDateController.text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),

                Row(
                  spacing: 4,
                  children: [
                    const Text(
                      'CVV',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),

                    Text(
                      cvvController.text.isEmpty
                        ? '***'
                        : '•' * cvvController.text.length,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    String text = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (text.length > 16) {
      text = text.substring(0, 16);
    }

    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      if ((i + 1) % 4 == 0 && i != text.length - 1) {
        buffer.write(' ');
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.toString().length),
    );
  }
}

class _ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    String text = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (text.length > 4) {
      text = text.substring(0, 4);
    }

    if (text.length >= 2) {
      int month = int.tryParse(text.substring(0, 2)) ?? 0;
      if (month > 12) {
        text = '12${text.substring(2)}';
      }

      if (text.length >= 4) {
        int year = int.tryParse(text.substring(2, 4)) ?? 0;
        int currentYear = DateTime.now().year % 100;

        if (year < currentYear) {
          text = text.substring(0, 2) + currentYear.toString().padLeft(2, '0');
        }
      }
    }

    String formattedText;
    if (text.length <= 2) {
      formattedText = text;
    } else {
      formattedText = '${text.substring(0, 2)}/${text.substring(2)}';
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}