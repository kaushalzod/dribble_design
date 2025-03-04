import 'package:flutter/material.dart';

class TabSwitcherVM extends ChangeNotifier {
  TabSwitcherVM({this.onTabChange, this.newSelectedIndex = 0}) {
    _selectedIndex = newSelectedIndex;
  }

  final int newSelectedIndex;
  late int _selectedIndex;
  final ValueChanged<int>? onTabChange;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    if (_selectedIndex != index) {
      _selectedIndex = index;
      onTabChange?.call(index);
      notifyListeners();
    }
  }
}
