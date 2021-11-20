import 'package:development/initialBindings.dart';
import 'package:development/pages/principal/principal_page_desktop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './pages/login/login_page.dart';

void main() {
  runApp(GetMaterialApp(
    home: LoginPage(),
    onInit: () => Get.put(InitialBindings()),
  ));
}
