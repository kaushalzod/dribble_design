import 'package:dribble_design/app/modules/add_subscriptions/model/sub_category.dart';
import 'package:dribble_design/app/modules/add_subscriptions/view/add_subscriptions_view.dart';
import 'package:dribble_design/app/modules/my_subscriptions_tab/model/subs_detail_model.dart';
import 'package:dribble_design/app/modules/my_subscriptions_tab/view%20/widgets/subscription_card_body.dart';
import 'package:dribble_design/app/modules/my_subscriptions_tab/viewmodel/my_subscriptions_vm.dart';
import 'package:dribble_design/shared/repository/subscription_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

class SubscriptionCard extends StatelessWidget {
  const SubscriptionCard(
      {super.key,
      required this.isSelected,
      required this.model,
      required this.index});
  final bool isSelected;
  final int index;
  final SubsDetailModel model;
  @override
  Widget build(BuildContext context) {
    final vm = context.read<MySubscriptionsVM>();
    return AnimatedAlign(
      duration: const Duration(milliseconds: 300),
      alignment: Alignment.topCenter,
      heightFactor: isSelected ? 1 : 0.45,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () async {
            await _onCardTap(context, vm);
          },
          child: SubscriptionCardBody(
            model: model,
            isSelected: isSelected,
          ),
        ),
      ),
    )
        .animate(onPlay: (controller) => controller.forward(), autoPlay: true)
        .then(delay: Duration(milliseconds: 100 * index))
        .slideX(duration: 500.ms, begin: 1, end: 0, curve: Curves.easeInOut)
        .fade(duration: 500.ms, begin: 0, end: 1, curve: Curves.easeInOut);
  }

  Future<void> _onCardTap(BuildContext context, MySubscriptionsVM vm) async {
    final SubCategory subCategoryItem = vm.categoryList[vm.categorySelected];
    final repository = CategoryRepository();
    if (model.isAddSub) {
      final subCategory = await AddSubscriptionsView.open(
        context,
        subcategory: subCategoryItem,
        onDelete: () {
          repository.deleteCategory(subCategoryItem);
          vm.fetchCategory(selected: 0);
          Navigator.pop(context);
        },
      );
      if (subCategory == null) return;

      await repository.updateSubCategory(subCategory);
      vm.fetchCategory(selected: vm.categorySelected);
    } else {
      vm.setSubSelected(index, subCategoryItem.detail.length);
    }
  }
}
