import 'package:dribble_design/core/utils/color_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    this.isSelected = false,
    this.onTap,
    required this.title,
    this.child,
  });
  final VoidCallback? onTap;
  final bool isSelected;
  final String title;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: child == null ? 14 : 0,
            vertical: child == null ? 8 : 0),
        decoration: BoxDecoration(
          color: isSelected ? ColorConst.primary : Color(0xff28272d),
          borderRadius: BorderRadius.circular(25),
        ),
        child: child ??
            Text(
              title,
              style: GoogleFonts.redHatDisplay(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
      ),
    );
  }
}
