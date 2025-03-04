import 'package:dribble_design/app/features/tab_switcher/utils/tab_switcher_color.dart';
import 'package:dribble_design/app/features/tab_switcher/utils/tab_switcher_string.dart';
import 'package:dribble_design/app/features/tab_switcher/view/widgets/tab_detail.dart';
import 'package:dribble_design/app/features/tab_switcher/view_model/tab_switcher_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabSwitcherContent extends StatelessWidget {
  const TabSwitcherContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: TabSwitcherColor.unselectedColor,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Consumer<TabSwitcherVM>(
        builder: (context, value, child) {
          final selectedIndex = value.selectedIndex;
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TabDetail(
                context: context,
                index: 0,
                title: TabSwitcherString.general,
                icon: Icons.grid_view_rounded,
                isSelected: selectedIndex == 0,
                onTap: () => value.setSelectedIndex(0),
              ),
              const SizedBox(width: 8),
              TabDetail(
                context: context,
                index: 1,
                title: TabSwitcherString.mysubs,
                icon: Icons.subscriptions,
                isSelected: selectedIndex == 1,
                onTap: () => value.setSelectedIndex(1),
              ),
            ],
          );
        },
      ),
    );
  }
}
