import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpentSummary extends StatelessWidget {
  const SpentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Spent for January",
          style: GoogleFonts.redHatDisplay(color: Colors.white, fontSize: 18),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            RichText(
              text: TextSpan(
                text: "\$ 31",
                style: GoogleFonts.unbounded(
                  fontSize: 54,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                    text: ".45",
                    style: const TextStyle(
                      color: Colors.white12,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 15),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff0fb762),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(5),
              child: Text(
                "+ 5%",
                style: GoogleFonts.unbounded(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
