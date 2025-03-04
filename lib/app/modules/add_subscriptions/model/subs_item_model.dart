import 'package:dribble_design/app/modules/my_subscriptions_tab/model/subs_detail_model.dart';

class SubsItemModel {
  final SubsDetailModel detail;
  bool isSelected;

  SubsItemModel({
    required this.detail,
    this.isSelected = false,
  });
}
