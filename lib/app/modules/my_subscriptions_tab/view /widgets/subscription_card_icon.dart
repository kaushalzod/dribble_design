import 'package:dotted_border/dotted_border.dart';
import 'package:dribble_design/app/modules/my_subscriptions_tab/model/subs_detail_model.dart';
import 'package:flutter/material.dart';

class SubscriptionCardIcon extends StatelessWidget {
  const SubscriptionCardIcon({super.key, required this.model});

  final SubsDetailModel model;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: model.isAddSub ? Colors.white : Colors.transparent,
      dashPattern: const [1, 4],
      padding: EdgeInsets.zero,
      borderType: BorderType.Circle,
      strokeCap: StrokeCap.round,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: model.isAddSub ? Colors.transparent : Colors.white,
          shape: BoxShape.circle,
        ),
        child: model.isAddSub
            ? const Icon(Icons.add, color: Colors.white)
            : Image.asset("assets/png/${model.logo}"),
      ),
    );
  }
}
