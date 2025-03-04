import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroductionText extends StatelessWidget {
  const IntroductionText({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Text(
          "Manage all your\nsubscriptions",
          style: GoogleFonts.redHatDisplay(
            fontWeight: FontWeight.w700,
            fontSize: 28,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          "Keep regular expenses on hand\nand recieve timely notifications of\nupcoming fees",
          style: GoogleFonts.redHatDisplay(
            fontSize: 20,
            color: Colors.white38,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
