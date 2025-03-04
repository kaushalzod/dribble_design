import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentHistoryItem extends StatelessWidget {
  final String title;
  final String date;
  final String amount;
  final String image;

  const PaymentHistoryItem({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: const Color(0xff32343b),
        contentPadding: const EdgeInsets.all(15),
        minTileHeight: 0,
        leading: Container(
          padding: const EdgeInsets.all(6),
          width: 45,
          height: 45,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Image.asset(image),
        ),
        horizontalTitleGap: 10,
        title: Text(
          title,
          style: GoogleFonts.redHatDisplay(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          date,
          style: GoogleFonts.redHatDisplay(
            color: Colors.white54,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Text(
          amount,
          style: GoogleFonts.unbounded(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
