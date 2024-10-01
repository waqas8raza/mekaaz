import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefKey {
  static const String accessToken = 'token';
}

class SharedPrefService {
  static const String keyPrefix = 'Meekaz';
  static SharedPrefService? _instance;
  static SharedPreferences? _pref;

  SharedPrefService._internal();

  static Future<void> _init() async {
    _pref ??= await SharedPreferences.getInstance();
  }

  static Future<SharedPrefService> getInstance() async {
    if (_instance == null) {
      _instance = SharedPrefService._internal();
      await _init();
    }
    return _instance!;
  }

  static Future<void> saveString(String key, String value) async {
    await _init();
    await _pref!.setString(keyPrefix + key, value);
  }

  static Future<String?> getString(String key) async {
    await _init();
    return _pref!.getString(keyPrefix + key);
  }

  static Future<void> saveInt(String key, int value) async {
    await _init();
    await _pref!.setInt(keyPrefix + key, value);
  }

  static Future<int?> getInt(String key) async {
    await _init();
    return _pref!.getInt(keyPrefix + key);
  }

  static Future<void> removeKey(String key) async {
    await _init();
    await _pref!.remove(keyPrefix + key);
  }

  static Future<void> clearAll() async {
    await _init();
    await _pref!.clear();
  }
}
