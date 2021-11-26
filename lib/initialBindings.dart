import 'package:get/get.dart';
import './pages/login/login_controller.dart';
import './pages/principal/principal_controller.dart';

class InitialBindings extends GetxController {
  final LoginController loginController = Get.put(LoginController());
}
