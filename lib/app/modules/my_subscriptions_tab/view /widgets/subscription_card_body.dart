import 'package:dribble_design/app/modules/my_subscriptions_tab/model/subs_detail_model.dart';
import 'package:dribble_design/app/modules/my_subscriptions_tab/view%20/widgets/subscription_card_icon.dart';
import 'package:dribble_design/app/modules/my_subscriptions_tab/view%20/widgets/subscription_card_info.dart';
import 'package:flutter/material.dart';

/// The subscription card widget.
class SubscriptionCardBody extends StatelessWidget {
  const SubscriptionCardBody({
    super.key,
    required this.model,
    required this.isSelected,
  });

  final SubsDetailModel model;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(model.bgColor),
      ),
      child: Column(
        children: [
          _buildCardHeader(),
        ],
      ),
    );
  }

  Widget _buildCardHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SubscriptionCardInfo(model: model),
        SubscriptionCardIcon(model: model),
      ],
    );
  }
}
