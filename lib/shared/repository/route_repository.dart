import 'package:hive_flutter/hive_flutter.dart';

class RouteRepository {
  static final String _boxName = "app";

  static openBox() async {
    await Hive.openBox<bool>(_boxName);
  }

  Future<void> markIntroSeen() async {
    final box = Hive.box<bool>(_boxName);
    box.put("intro_viewed", true);
  }

  bool fetchIntroStatus() {
    final box = Hive.box<bool>(_boxName);
    return box.get("intro_viewed") ?? false;
  }
}
