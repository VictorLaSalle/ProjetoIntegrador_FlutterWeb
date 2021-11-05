import 'package:development/gateways/login_gateway.dart';
import 'package:get/get.dart';
import '../../domains/models/userLogin_model.dart';

class LoginController extends GetxController {
  LoginGateway _login = LoginGateway();

  void connect(String email, String password) async {
    if (email.trim() != '' || password.trim() != '') {
      
        UserLoginModel response =
            await _login.login(UserLoginModel.toJson(email, password));

        if (response.statusCode == 403) {
          Get.snackbar('Divergência',
              'Credenciais incorretas. Por favor, verifique suas credenciais e tente novamente.');
              print(response);
        } else if (response.statusCode >= 500) {
          Get.snackbar('Erro',
              'Desculpe :( ! Ocorreu um erro. Por favor, tente novamente mais tarde ou contate o suporte');
              print(response);
        } else if (response.statusCode == 200) {
          print(response);
        }
      
    } else {
      Get.snackbar('Divergência',
          'Credenciais incorretas. Por favor, verifique suas credenciais e tente novamente.');
    }
  }
}
