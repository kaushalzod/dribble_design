import 'package:dribble_design/app/modules/my_subscriptions_tab/model/subs_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubscriptionCardInfo extends StatelessWidget {
  const SubscriptionCardInfo({super.key, required this.model});

  final SubsDetailModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          model.name,
          style: GoogleFonts.redHatDisplay(
            fontWeight: FontWeight.w500,
            color: Color(model.textColor),
            fontSize: 20,
          ),
        ),
        if (!model.isAddSub)
          Container(
            margin: const EdgeInsets.only(top: 4),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.unbounded(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
                children: [
                  TextSpan(text: "\$ ${model.price}"),
                  TextSpan(
                    text: " / ${model.subsType.name}",
                    style: GoogleFonts.unbounded(
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
