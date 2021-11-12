import 'package:development/pages/login/login_page.dart';
import 'package:development/pages/principal/principal_page.dart';
import 'package:get/get.dart';

final routes = [
  GetPage(name: '/login', page: () => LoginPage()),
  GetPage(name: '/principal', page: () => PrincipalPage())
];