import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static final SharedPreferences _pref = GetIt.I.get<SharedPreferences>();

  static Future<void> saveData(
      {required String key, required dynamic value}) async {
    if (value is String) {
      await _pref.setString(key, value);
    } else if (value is int) {
      await _pref.setInt(key, value);
    } else if (value is bool) {
      await _pref.setBool(key, value);
    } else {
      await _pref.setDouble(key, value);
    }
  }

  static dynamic getData(String key) {
    return _pref.get(key);
  }
}
