import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage(
      {super.key, this.size = 50, required this.logoPath, this.padding = 8});
  final String logoPath;
  final double size;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      width: size,
      height: size,
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Image.asset("assets/png/$logoPath"),
    );
  }
}
