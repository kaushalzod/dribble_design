import 'package:flutter/material.dart';

class LandingVM extends ChangeNotifier {
  final int initalTab = 0;
  late final PageController pageController =
      PageController(initialPage: initalTab);
  int _currentTab = 0;

  int get currentTab => _currentTab;

  set currentTab(int index) {
    _currentTab = index;
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
