import 'package:flutter/material.dart';

import 'payment_history_item.dart';

class PaymentHistory extends StatelessWidget {
  const PaymentHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xff262528),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        spacing: 10,
        children: const [
          PaymentHistoryItem(
            title: "Figma",
            date: "Yesterday, at 5:12 PM",
            amount: "- \$ 8",
            image: "assets/png/figma.png",
          ),
          PaymentHistoryItem(
            title: "HBO Max",
            date: "20.12.2022, at 1:38 PM",
            amount: "- \$ 9.99",
            image: "assets/png/hbo.png",
          ),
          PaymentHistoryItem(
            title: "PS Plus",
            date: "15.12.2022, at 8:17 AM",
            amount: "- \$ 67.57",
            image: "assets/png/playstation.png",
          ),
          PaymentHistoryItem(
            title: "YouTube",
            date: "13.12.2022, at 4:14 PM",
            amount: "- \$ 8.97",
            image: "assets/png/youtube.png",
          ),
        ],
      ),
    );
  }
}
