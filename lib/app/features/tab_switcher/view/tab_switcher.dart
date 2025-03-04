import 'package:dribble_design/app/features/tab_switcher/view/widgets/tab_switcher_content.dart';
import 'package:dribble_design/app/features/tab_switcher/view_model/tab_switcher_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabSwitcher extends StatelessWidget {
  const TabSwitcher({super.key, this.onTabChange, this.initalIndex});
  final int? initalIndex;
  final ValueChanged<int>? onTabChange;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TabSwitcherVM>(
      create: (_) => TabSwitcherVM(
        newSelectedIndex: initalIndex ?? 0,
        onTabChange: onTabChange,
      ),
      child: TabSwitcherContent(),
    );
  }
}
