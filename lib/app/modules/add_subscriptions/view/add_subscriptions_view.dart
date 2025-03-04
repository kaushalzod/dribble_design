import 'package:dribble_design/app/modules/add_subscriptions/model/sub_category.dart';
import 'package:dribble_design/app/modules/add_subscriptions/view/widgets/category_textfield.dart';
import 'package:dribble_design/app/modules/add_subscriptions/view/widgets/delete_category_icon.dart';
import 'package:dribble_design/app/modules/add_subscriptions/view/widgets/save_subscription_button.dart';
import 'package:dribble_design/app/modules/add_subscriptions/view/widgets/subscription_list.dart';
import 'package:dribble_design/app/modules/add_subscriptions/view_model/add_subscription_vm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddSubscriptionsView extends StatelessWidget {
  const AddSubscriptionsView({super.key, this.subCategory, this.onDelete});
  final SubCategory? subCategory;
  final VoidCallback? onDelete;

  static Future<SubCategory?> open(BuildContext context,
      {SubCategory? subcategory, VoidCallback? onDelete}) async {
    return await showModalBottomSheet<SubCategory?>(
      isScrollControlled: true,
      context: context,
      backgroundColor: const Color(0xff181721),
      builder: (context) {
        return AddSubscriptionsView(
          subCategory: subcategory,
          onDelete: onDelete,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ChangeNotifierProvider(
          create: (_) => AddSubscriptionVM(subCategory: subCategory),
          builder: (context, child) => Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${subCategory != null ? "Edit" : "Add"} a category",
                        style: GoogleFonts.redHatDisplay(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      if (subCategory != null)
                        DeleteCategoryIcon(onDelete: onDelete)
                    ],
                  ),
                ),
                CategoryTextfield(),
                SubscriptionsList(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SaveSubsButton(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
