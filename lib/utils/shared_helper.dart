import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  Future<void> setThemeName(String themeName) async {
    SharedPreferences shr = await SharedPreferences.getInstance();

    await shr.setString("theme", themeName);
  }

  Future<String?> getThemeName() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    String? theme = shr.getString("theme");
    return theme;
  }

  Future<void> setIntro(bool introName) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setBool("intro", introName);
  }

  Future<bool?> getIntro() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    bool? intro = shr.getBool("intro");
    return intro;
  }
}