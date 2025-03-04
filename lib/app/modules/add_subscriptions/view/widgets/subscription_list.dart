import 'package:dribble_design/app/modules/add_subscriptions/model/subs_item_model.dart';
import 'package:dribble_design/app/modules/add_subscriptions/view_model/add_subscription_vm.dart';
import 'package:dribble_design/shared/widgets/custom_checkbox.dart';
import 'package:dribble_design/shared/widgets/logo_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubscriptionsList extends StatelessWidget {
  const SubscriptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select subscriptions",
            style: GoogleFonts.redHatDisplay(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Selector<AddSubscriptionVM, List<SubsItemModel>>(
              selector: (context, vm) => vm.subscriptions,
              builder: (context, subscriptions, child) => ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: subscriptions.length,
                itemBuilder: (context, index) {
                  final subscription = subscriptions[index];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: LogoImage(
                      logoPath: subscription.detail.logo,
                      size: 40,
                      padding: 6,
                    ),
                    title: Text(
                      subscription.detail.name,
                      style: GoogleFonts.redHatDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: CustomCheckbox(
                      initialSelected: subscription.isSelected,
                      onChanged: (_) {
                        context
                            .read<AddSubscriptionVM>()
                            .toggleSubscription(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
