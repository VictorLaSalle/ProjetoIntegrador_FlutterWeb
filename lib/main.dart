import 'package:development/domains/enums/localStorage_enum.dart';
import 'package:development/initialBindings.dart';
import 'package:development/pages/principal/principal_page.dart';
import 'package:development/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './pages/login/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString(describe(LocalStorageEnum.token));
  String? privateKey = prefs.getString(describe(LocalStorageEnum.private_key));

  runApp(GetMaterialApp(
    home: LoginPage(),
    onInit: () => Get.put(InitialBindings()),
    initialRoute: token == null && privateKey == null ? '/' : '/principal',
    getPages: [
      GetPage(name: '/', page: () => LoginPage()),
      GetPage(name: '/principal', page: () => PrincipalPage()),
    ],
  ));
}
