import 'package:dribble_design/app/modules/general_tab/view%20/widgets/upcoming_payment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/payment_history.dart';
import 'widgets/spent_summary.dart';

class GeneralTabView extends StatelessWidget {
  const GeneralTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final animatedChildren = [
      const SizedBox(height: 30),
      const SpentSummary(),
      const SizedBox(height: 35),
      const UpcomingPaymentCard(),
      const SizedBox(height: 35),
      Text(
        "Payment history",
        style: GoogleFonts.redHatDisplay(color: Colors.white, fontSize: 28),
      ),
      const SizedBox(height: 20),
      const PaymentHistory(),
    ]
        .animate(interval: 100.ms)
        .fadeIn(duration: 700.ms, curve: Curves.easeIn)
        .slide(
          begin: const Offset(0, 0.5),
          end: Offset.zero,
          duration: 300.ms,
          curve: Curves.easeIn,
        );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: animatedChildren,
      ),
    );
  }
}
