import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  final String _userKey = 'USER';

  Future<SharedPreferences> get _getInstance => SharedPreferences.getInstance();

  getUserData() async {
    SharedPreferences instance = await _getInstance;
    bool? user = instance.getBool(_userKey);

    return user ?? false;
  }

  setUserData(bool isLogged) async {
    SharedPreferences instance = await _getInstance;
    instance.setBool(_userKey, isLogged);
  }
}
