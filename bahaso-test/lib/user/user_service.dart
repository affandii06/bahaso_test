import 'package:shared_preferences/shared_preferences.dart';

class UserService{

  static saveAccount(String name, String age)async{
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
    prefs.setString('age', age);
  }

  static deleteAccount()async{
    var prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

}