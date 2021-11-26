import 'package:development/initialBindings.dart';
import 'package:development/pages/principal/principal_page.dart';
import 'package:development/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './pages/login/login_page.dart';

void main() =>
  runApp(GetMaterialApp(
    home: LoginPage(),
    onInit: () => Get.put(InitialBindings()),
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: () => LoginPage()),
      GetPage(name: '/principal', page: () => PrincipalPage()),
    ],
  ));

