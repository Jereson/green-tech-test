import 'package:shared_preferences/shared_preferences.dart';

///Here vital user details are cached the user device
///for easy access
class LocalStorage {
  final SharedPreferences prefs;

  LocalStorage(this.prefs);

  Future<void> saveUserToken(String token) async {
    prefs.setString('userToken', token);
  }

  Future<void> saveUserId(String id) async {
    prefs.setString('userId', id);
  }

  Future<void> saveUserEmail(String email) async {
    prefs.setString('email', email);
  }

  Future<void> saveUserName(String name) async {
    prefs.setString('name', name);
  }

  Future<void> saveUserPhone(String phone) async {
    prefs.setString('phone', phone);
  }

  String? getUserToken() {
    return prefs.getString('userToken');
  }

  String? getUserEmail() {
    return prefs.getString('userToken');
  }

  String? getUserId() {
    return prefs.getString('userId');
  }

  String? getUserName() {
    return prefs.getString('name');
  }

  String? getUserPhone() {
    return prefs.getString('phone');
  }

  Future<void> removeUserToken() async {
    prefs.remove('userToken');
  }

  Future<void> removeUserId() async {
    prefs.remove('userId');
  }

  Future<void> removeUserEmail() async {
    prefs.remove('email');
  }

  Future<void> removeUserName() async {
    prefs.remove('name');
  }

  Future<void> removeUserPhone() async {
    prefs.remove('phone');
  }
}
