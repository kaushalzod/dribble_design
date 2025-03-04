import 'package:hive/hive.dart';

part 'subs_detail_model.g.dart';

@HiveType(typeId: 1)
enum SubsType {
  @HiveField(0)
  month,
  @HiveField(1)
  year,
}

@HiveType(typeId: 2)
class SubsDetailModel {
  @HiveField(0)
  final bool isAddSub;
  @HiveField(1)
  final String price;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final SubsType subsType;
  @HiveField(4)
  final String logo;
  @HiveField(5)
  final int bgColor;
  @HiveField(6)
  final int textColor;

  SubsDetailModel({
    this.isAddSub = false,
    required this.price,
    required this.name,
    required this.subsType,
    required this.logo,
    required this.bgColor,
    required this.textColor,
  });

  @override
  String toString() {
    return 'SubsDetailModel(isAddSub: $isAddSub, price: $price, name: $name, subsType: $subsType, logo: $logo, bgColor: $bgColor, textColor: $textColor)';
  }

  SubsDetailModel copyWith({
    bool? isAddSub,
    String? price,
    String? name,
    SubsType? subsType,
    String? logo,
    int? bgColor,
    int? textColor,
  }) {
    return SubsDetailModel(
      isAddSub: isAddSub ?? this.isAddSub,
      price: price ?? this.price,
      name: name ?? this.name,
      subsType: subsType ?? this.subsType,
      logo: logo ?? this.logo,
      bgColor: bgColor ?? this.bgColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SubsDetailModel &&
        other.isAddSub == isAddSub &&
        other.price == price &&
        other.name == name &&
        other.subsType == subsType &&
        other.logo == logo &&
        other.bgColor == bgColor &&
        other.textColor == textColor;
  }

  @override
  int get hashCode {
    return isAddSub.hashCode ^
        price.hashCode ^
        name.hashCode ^
        subsType.hashCode ^
        logo.hashCode ^
        bgColor.hashCode ^
        textColor.hashCode;
  }
}
