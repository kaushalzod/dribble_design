import 'package:dribble_design/app/modules/add_subscriptions/model/sub_category.dart';
import 'package:dribble_design/app/modules/add_subscriptions/model/subs_item_model.dart';
import 'package:dribble_design/app/modules/my_subscriptions_tab/model/subs_detail_model.dart';
import 'package:dribble_design/shared/data/subscription_data.dart';
import 'package:flutter/material.dart';

class AddSubscriptionVM with ChangeNotifier {
  AddSubscriptionVM({this.subCategory}) {
    controller.addListener(() {
      notifyListeners();
    });

    if (subCategory != null) {
      controller.text = subCategory!.catName;

      for (int i = 0; i < _subscriptions.length; i++) {
        final currentDetail = _subscriptions[i].detail;
        final existsInCategory = subCategory!.detail
            .any((existingDetail) => existingDetail.name == currentDetail.name);
        if (existsInCategory) {
          _subscriptions[i] =
              SubsItemModel(detail: currentDetail, isSelected: true);
        }
      }
    }
  }

  final SubCategory? subCategory;
  late final List<SubsDetailModel> _selectedSubList =
      subCategory?.detail ?? <SubsDetailModel>[];

  final List<SubsItemModel> _subscriptions = SubscriptionData.list
      .map((e) => SubsItemModel(detail: e, isSelected: false))
      .toList()
    ..removeAt(0);
  final TextEditingController controller = TextEditingController();

  List<SubsItemModel> get subscriptions => _subscriptions;

  bool get enableSave =>
      subscriptions.any((element) => element.isSelected) &&
      controller.text.trim().isNotEmpty;

  void toggleSubscription(int index) {
    if (!_subscriptions[index].isSelected) {
      _selectedSubList.add(_subscriptions[index].detail);
    } else {
      _selectedSubList.remove(_subscriptions[index].detail);
    }
    _subscriptions[index].isSelected = !_subscriptions[index].isSelected;

    notifyListeners();
  }

  SubCategory save() {
    return SubCategory(
      detail: _selectedSubList,
      catName: controller.text.trim(),
      catKey: subCategory?.catKey,
    );
  }
}
