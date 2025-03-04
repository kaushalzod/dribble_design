import 'package:dribble_design/app/modules/my_subscriptions_tab/model/subs_detail_model.dart';
import 'package:hive/hive.dart';

part 'sub_category.g.dart';

@HiveType(typeId: 3)
class SubCategory {
  @HiveField(0)
  final List<SubsDetailModel> detail;
  @HiveField(1)
  final String catName;
  @HiveField(2)
  int? catKey;

  SubCategory({
    required this.detail,
    required this.catName,
    this.catKey,
  });

  SubCategory copyWith({
    List<SubsDetailModel>? detail,
    String? catName,
    int? catKey,
  }) {
    return SubCategory(
      detail: detail ?? this.detail,
      catName: catName ?? this.catName,
      catKey: catKey ?? this.catKey,
    );
  }

  @override
  String toString() =>
      'SubCategory(detail: $detail, catName: $catName, catKey: $catKey)';
}
