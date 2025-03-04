import 'package:dribble_design/app/modules/add_subscriptions/view_model/add_subscription_vm.dart';
import 'package:dribble_design/core/utils/color_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryTextfield extends StatelessWidget {
  const CategoryTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Enter a name",
          style: GoogleFonts.redHatDisplay(color: Colors.white, fontSize: 14),
        ),
        const SizedBox(height: 8),
        Selector<AddSubscriptionVM, TextEditingController>(
          selector: (context, vm) => vm.controller,
          builder: (context, controller, child) {
            return TextField(
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              controller: controller,
              style: GoogleFonts.redHatDisplay(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xff272735),
                hintText: "e.g. Music",
                hintStyle: GoogleFonts.redHatDisplay(color: Colors.white12),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: ColorConst.primary),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
