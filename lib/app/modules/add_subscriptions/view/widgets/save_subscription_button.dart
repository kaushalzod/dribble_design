import 'package:dribble_design/app/modules/add_subscriptions/model/sub_category.dart';
import 'package:dribble_design/app/modules/add_subscriptions/view_model/add_subscription_vm.dart';
import 'package:dribble_design/shared/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaveSubsButton extends StatelessWidget {
  const SaveSubsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<AddSubscriptionVM, (bool, TextEditingController)>(
      selector: (context, vm) => (vm.enableSave, vm.controller),
      builder: (context, enableSave, child) {
        return CommonButton(
          label: "Save",
          ontap: enableSave.$1
              ? () {
                  final result = context.read<AddSubscriptionVM>().save();
                  Navigator.pop<SubCategory>(context, result);
                }
              : null,
        );
      },
    );
  }
}
