import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final SharedPreferences prefs;

  LocalStorage(this.prefs);

  Future<void> saveUserToken(String token) async {
    prefs.setString('userToken', token);
  }

  String? getUserToken() {
    return prefs.getString('userToken');
  }

 Future<void> removeUserToken( ) async {
    prefs.remove('userToken');
  }

}
