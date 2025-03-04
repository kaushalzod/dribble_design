import 'package:dribble_design/app/modules/add_subscriptions/model/sub_category.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CategoryRepository {
  static final String _boxName = "subCategories";

  static openBox() async {
    await Hive.openBox<SubCategory>(_boxName);
  }

  Future<void> saveSubCategories(SubCategory subCategory) async {
    final box = Hive.box<SubCategory>(_boxName);
    final subCategories = box.values.toList()..add(subCategory);
    await box.clear();
    // Add each subcategory.
    for (var subCategory in subCategories) {
      await box.add(subCategory);
    }
  }

  Future<void> deleteCategory(SubCategory subCategory) async {
    final box = Hive.box<SubCategory>(_boxName);
    await box.delete(subCategory.catKey);
  }

  Future<void> updateSubCategory(SubCategory subCategory) async {
    final box = Hive.box<SubCategory>(_boxName);
    await box.put(subCategory.catKey, subCategory);
  }

  Future<List<SubCategory>> fetchSubCategories() async {
    final box = Hive.box<SubCategory>(_boxName);
    final Map<dynamic, SubCategory> subCategoryMap = box.toMap();

    final List<SubCategory> subCategories = subCategoryMap.entries.map((entry) {
      entry.value.catKey = entry.key;
      return entry.value;
    }).toList();

    return subCategories;
  }
}
