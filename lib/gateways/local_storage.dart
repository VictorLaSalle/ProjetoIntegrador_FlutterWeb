import 'package:development/domains/enums/localStorage_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LocalStorage extends GetxController {
  
  @override
  onInit() {
    _build();
    super.onInit();
  }

  SharedPreferences? _prefs;
  
  void _build() async {
    if(_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }
  
  LocalStorage._privateConstructor();
  static final LocalStorage _instance = LocalStorage._privateConstructor();
  static LocalStorage get instance => _instance;
  
  setString(LocalStorageEnum localStorageEnum, String value) => _prefs!.setString(describe(localStorageEnum), value);
  getString(LocalStorageEnum localStorageEnum) => _prefs!.getString(describe(localStorageEnum));

}