import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static const String jokesKey = "cached_jokes";

  static Future<void> saveJokes(List<String> jokes) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(jokesKey, jokes);
  }

  static Future<List<String>> loadJokes() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(jokesKey) ?? [];
  }
}
