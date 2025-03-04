import 'package:dribble_design/app/modules/my_subscriptions_tab/view%20/widgets/my_subscription_categories.dart';
import 'package:dribble_design/app/modules/my_subscriptions_tab/view%20/widgets/subscription_card.dart';
import 'package:dribble_design/app/modules/my_subscriptions_tab/viewmodel/my_subscriptions_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySubscriptionsTabView extends StatelessWidget {
  const MySubscriptionsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MySubscriptionsVM>(
          create: (_) => MySubscriptionsVM(),
        ),
      ],
      child: Consumer<MySubscriptionsVM>(
        builder: (context, vm, child) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 25,
              children: [
                // Shows the list of categories
                MySubscriptionCategories(),

                // Shows list of subscription based on category selected
                if (vm.categoryList.isNotEmpty)
                  Expanded(
                    child: vm.categoryList[vm.categorySelected].detail.isEmpty
                        ? Center(
                            child: Text(
                              "No subscription found.",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : ListView.builder(
                            key: ValueKey<int>(vm.categorySelected),
                            addAutomaticKeepAlives: true,
                            itemCount: vm.categoryList[vm.categorySelected]
                                .detail.length,
                            itemBuilder: (context, index) {
                              final model = vm.categoryList[vm.categorySelected]
                                  .detail[index];
                              final isSelected = index == vm.subSelected;

                              // Avoiding Add a subscription card in All Subs
                              if (model.isAddSub && vm.categorySelected == 0) {
                                return const SizedBox.shrink();
                              }
                              return SubscriptionCard(
                                index: index,
                                model: model,
                                isSelected: isSelected,
                              );
                            },
                          ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
