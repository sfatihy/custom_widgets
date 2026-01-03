import 'package:flutter/material.dart';

import 'package:custom_widgets/views/calendar_view.dart';
import 'package:custom_widgets/views/credit_card_view.dart';
import 'package:custom_widgets/views/favorite_view.dart';
import 'package:custom_widgets/views/infinite_scroll_view.dart';
import 'package:custom_widgets/views/pizza_view.dart';
import 'package:custom_widgets/views/qr_view.dart';

import 'package:custom_widgets/widgets/animated_price/animated_price_widget.dart';
import 'package:custom_widgets/widgets/animated_price_wheel/animated_price_wheel_widget.dart';
import 'package:custom_widgets/widgets/buttons/only_corner_button.dart';
import 'package:custom_widgets/widgets/buttons/colorful_button.dart';
import 'package:custom_widgets/widgets/column/custom_column_widget.dart';
import 'package:custom_widgets/widgets/digital_clock/countdown_timer_widget.dart';
import 'package:custom_widgets/widgets/digital_clock/digital_clock_widget.dart';
import 'package:custom_widgets/widgets/divider/custom_divider_widget.dart';
import 'package:custom_widgets/widgets/glass_morphism/glass_morphism_widget.dart';
import 'package:custom_widgets/widgets/heart/animated_heart_button.dart';
import 'package:custom_widgets/widgets/heart/heart_button.dart';
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
              child: const Text('Login'),
              onTap: () {

              },
            ),

            ColorfulButton(
              child: const Text('Login'),
              onTap: () {

              },
            ),

            ColorfulButton(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF8AECFF),
                  Colors.white30,
                  Color(0xFF8AECFF),
                ],
                stops: [0.2,0.5,0.8],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              overlayColor: const WidgetStatePropertyAll(Color(0xFF8AECFF)),
              child: const Text('Login'),
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

            const GlassMorphismWidget(),

            OnlyCornerButton(
              child: const Row(
                spacing: 8,
                children: [
                  Text('Circle FAB'),
                  Icon(Icons.arrow_forward_outlined)
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const QrView()));
              },
            ),

            OnlyCornerButton(
              child: const Row(
                spacing: 8,
                children: [
                  Text('Favorite FAB'),
                  Icon(Icons.arrow_forward_outlined)
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const FavoriteView()));
              },
            ),

            OnlyCornerButton(
              child: const Row(
                spacing: 8,
                children: [
                  Text('Calendar'),
                  Icon(Icons.calendar_month_rounded)
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const CalendarView()));
              },
            ),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HeartButton(),
                AnimatedHeartButton()
              ],
            ),

            const DigitalClockWidget(),

            Builder(
              builder: (context) {
                final endTime = DateTime.now().add(const Duration(seconds: 65));
                return StreamBuilder<int>(
                  stream: Stream.periodic(const Duration(seconds: 1), (tick) {
                    final int remaining = endTime.difference(DateTime.now()).inSeconds;
                    return remaining > 0 ? remaining : 0;
                  }),
                  builder: (context, snapshot) {
                    final int remainingSeconds = snapshot.data ?? 65;

                    return CountdownTimerWidget(
                      time: 65,
                      remainingSeconds: remainingSeconds,
                    );
                  },
                );
              }
            ),

            OnlyCornerButton(
              child: const Row(
                spacing: 8,
                children: [
                  Text('Pizza'),
                  Icon(Icons.local_pizza_rounded)
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const PizzaView()));
              },
            ),

            OnlyCornerButton(
              child: const Row(
                spacing: 8,
                children: [
                  Text('Credit Card'),
                  Icon(Icons.credit_card)
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const CreditCardView()));
              },
            ),

            OnlyCornerButton(
              child: const Row(
                spacing: 8,
                children: [
                  Text('Infinite Scroll'),
                  Icon(Icons.list)
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const InfiniteScrollView()));
              },
            ),

          ]
        ),
      )
    );
  }
}
