import 'package:development/gateways/login_gateway.dart';
import 'package:development/pages/principal/principal_page.dart';
import 'package:get/get.dart';
import '../../domains/models/userLogin_model.dart';
import 'package:dio/dio.dart';

class LoginController extends GetxController {
  LoginGateway _login = LoginGateway(Dio());

  void connect(String email, String password) async {
    if (email.trim() != '' || password.trim() != '') {
      
        try {
          UserLoginModel response =
          await _login.getLogin(UserLoginModel.toJson(email, password));

          if (response.statusCode == 200) {
            Get.to(PrincipalPage());
          }

        } on DioError catch(error) {
          if (error.response!.statusCode == 403) {
            Get.snackbar('Divergência',
                'Credenciais incorretas. Por favor, verifique suas credenciais e tente novamente.');
          } else if (error.response!.statusCode == 500) {
            Get.snackbar('Erro',
                'Desculpe :( ! Ocorreu um erro. Por favor, tente novamente mais tarde ou contate o suporte');
          }
        }
      
    } else {
      Get.snackbar('Divergência',
          'Credenciais incorretas. Por favor, verifique suas credenciais e tente novamente.');
    }
  }
}
