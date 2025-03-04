import 'package:dribble_design/core/utils/color_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonButton extends StatelessWidget {
  final String label;
  final VoidCallback? ontap;
  const CommonButton({super.key, required this.label, this.ontap});
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: ontap,
      style: FilledButton.styleFrom(
        backgroundColor: ColorConst.primary,
        disabledBackgroundColor: Color(0xff0b0b11),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        minimumSize: Size.fromHeight(48),
      ),
      child: Text(
        label,
        style: GoogleFonts.redHatDisplay(
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
