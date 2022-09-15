import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedUtility {
  SharedUtility({
    required this.sharedPreferences,
  });
  final SharedPreferences sharedPreferences;

  bool isDarkModeEnabled() {
    return sharedPreferences.getBool('isDarkModeEnabled') ?? false;
  }

  Future<bool> setDarkModeEnabled(bool value) async {
    return await sharedPreferences.setBool('isDarkModeEnabled', value);
  }
}

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedUtitltyProvider = Provider<SharedUtility>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return SharedUtility(sharedPreferences: prefs);
});
