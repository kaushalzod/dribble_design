import 'package:dribble_design/app/modules/add_subscriptions/model/sub_category.dart';
import 'package:dribble_design/app/modules/my_subscriptions_tab/model/subs_detail_model.dart';
import 'package:dribble_design/shared/repository/subscription_repository.dart';
import 'package:dribble_design/core/extensions/color_ext.dart';
import 'package:dribble_design/core/utils/color_const.dart';
import 'package:flutter/material.dart';

class MySubscriptionsVM extends ChangeNotifier {
  MySubscriptionsVM() {
    fetchCategory();
  }
  late List<SubsDetailModel> modelList = getList([]);
  List<SubCategory> categoryList = [];

  int _subSelected = -1;
  int _categorySelected = 0;

  int get subSelected => _subSelected;
  int get categorySelected => _categorySelected;

  set categorySelected(int index) {
    _categorySelected = index;
    _subSelected = categoryList[index].detail.length;
    notifyListeners();
  }

  void setSubSelected(int newValue, int listLength) {
    if (_subSelected == newValue) {
      _subSelected = listLength - 1;
    } else {
      _subSelected = newValue;
    }
    notifyListeners();
  }

  void fetchCategory({int selected = 0}) async {
    final categoryBox = CategoryRepository();
    categoryList = await categoryBox.fetchSubCategories();
    final allSubDetails = <SubsDetailModel>[];
    for (int i = 0; i < categoryList.length; i++) {
      allSubDetails.addAll(categoryList[i].detail);
      categoryList[i] =
          categoryList[i].copyWith(detail: getList(categoryList[i].detail));
    }

    final allSub = SubCategory(
      detail: Set<SubsDetailModel>.from(allSubDetails).toList(),
      catName: "All subs",
    );
    categoryList = [allSub, ...categoryList];
    categorySelected = selected;
    notifyListeners();
  }

  List<SubsDetailModel> getList(List<SubsDetailModel> data) {
    if (data.any((element) => element.isAddSub)) return data;

    return [
      SubsDetailModel(
        logo: "",
        isAddSub: true,
        name: "Add a subscription",
        price: "",
        subsType: SubsType.month,
        bgColor: ColorConst.primary.toInt32,
        textColor: Colors.white.toInt32,
      ),
      ...data
    ];
  }
}
