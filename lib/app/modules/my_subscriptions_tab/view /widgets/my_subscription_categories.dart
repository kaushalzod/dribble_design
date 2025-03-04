import 'package:dribble_design/app/modules/add_subscriptions/view/add_subscriptions_view.dart';
import 'package:dribble_design/shared/repository/subscription_repository.dart';
import 'package:dribble_design/app/modules/my_subscriptions_tab/view%20/widgets/category_chip.dart';
import 'package:dribble_design/app/modules/my_subscriptions_tab/viewmodel/my_subscriptions_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySubscriptionCategories extends StatelessWidget {
  const MySubscriptionCategories({super.key});
  @override
  Widget build(BuildContext context) {
    final vm = context.read<MySubscriptionsVM>();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        children: [
          for (int index = 0; index < vm.categoryList.length; index++)
            CategoryChip(
              title: vm.categoryList[index].catName,
              isSelected: vm.categorySelected == index,
              onTap: () => vm.categorySelected = index,
            ),
          CategoryChip(
            title: "",
            onTap: () async {
              final subCategory = await AddSubscriptionsView.open(context);
              final repository = CategoryRepository();
              if (subCategory != null) {
                await repository.saveSubCategories(subCategory);
                vm.fetchCategory(selected: vm.categoryList.length);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
