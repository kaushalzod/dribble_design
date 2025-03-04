import 'package:dribble_design/app/features/tab_switcher/view/tab_switcher.dart';
import 'package:dribble_design/app/modules/general_tab/view%20/general_tab_view.dart';
import 'package:dribble_design/app/modules/landing_page/viewmodel/landing_vm.dart';
import 'package:dribble_design/app/modules/my_subscriptions_tab/view%20/my_subscriptions_tab_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1B1B1C),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff1B1B1C),
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton.filled(
                onPressed: () {},
                icon: Icon(Icons.menu, color: Colors.white),
                style: IconButton.styleFrom(backgroundColor: Color(0xff28272d)),
              ),
              TabSwitcher(
                initalIndex: context.read<LandingVM>().initalTab,
                onTabChange: (val) =>
                    context.read<LandingVM>().currentTab = val,
              ),
              IconButton.filled(
                onPressed: () {},
                icon: Icon(CupertinoIcons.bell, color: Colors.white),
                style: IconButton.styleFrom(backgroundColor: Color(0xff28272d)),
              )
            ].animate().scale(),
          ),
        ),
      ),
      body: Selector<LandingVM, int>(
        selector: (_, vm) => vm.currentTab,
        builder: (context, value, child) => PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: context.read<LandingVM>().pageController,
          children: [
            GeneralTabView(),
            MySubscriptionsTabView(),
          ],
        ),
      ),
    );
  }
}
