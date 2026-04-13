import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref {
  static SharedPreferences? _sharedpref;
  static MySharedPref? _mySharedpre;

  static Future<MySharedPref?> getInstance() async {
    _mySharedpre ??= MySharedPref();

    _sharedpref ??= await SharedPreferences.getInstance();

    return _mySharedpre;
  }

  ////read String Value
  static Future<String?> readStringValue(String name) async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    return _sharedpref?.getString(name);
  }

  ///save String Value
  static saveStringValue(String name, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString(name, value);
  }

  ///----------------------------------------------------------------------

  ////read double Value
  static Future<double?> readDoubleValue(String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getDouble(name);
  }

  ///save double Value
  static saveDoubleValue(String name, double value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setDouble(name, value);
  }

  ///----------------------------------------------------------------------

  /////save List String Value
  static saveListStringValue(String name, List<String> value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.setStringList(name, value);
  }

  ///read List String Value
  static Future<List<String>?> readListStringValue(String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getStringList(name);
  }
  /////-------------------------------------------------

  ///save Boolean Value
  static saveBooleanValue(String name, bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setBool(name, value);
  }

  ///  read Boolean Value
  static Future readBooleanValue(String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getBool(name) ?? false;
  }
  /////-------------------------------------------------

  static saveIntValue(String name, int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setInt(name, value);
  }

  static Future readIntValue(String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getInt(name);
  }

  /////-------------------------------------------------

  static clearPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    await preferences.reload();
  }
}
