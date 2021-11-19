import 'dart:typed_data';

import 'package:development/domains/enums/localStorage_enum.dart';
import 'package:development/domains/models/private_key_model.dart';
import 'package:development/gateways/login_gateway.dart';
import 'package:development/pages/principal/principal_controller.dart';
import 'package:development/pages/principal/principal_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domains/models/userLogin_model.dart';
import 'package:dio/dio.dart';

class LoginController extends GetxController {
  LoginGateway _login =
      LoginGateway(Dio(BaseOptions(contentType: "application/json")));
  SharedPreferences? _prefs;

  FilePickerResult? _result;
  Uint8List? _file;
  PrivateKey? _key;

  void connect(String email, String password) async {
    PrincipalController _principalController = Get.find<PrincipalController>();

    if (email.trim() != '' || password.trim() != '') {
      if (_key != null) {
        try {
          UserLoginModel response =
              await _login.getLogin(UserLoginModel.toJson(email, password));
          setCredentials(response.token, _key!);

          await _principalController.getData(_key!.privateKey);

          if (response.statusCode == 200) {
            Get.to(PrincipalPage());
          }
        } on DioError catch (error) {
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
    } else {
      Get.snackbar('Divergência',
          'Credenciais incorretas. Por favor, verifique suas credenciais e tente novamente.');
    }
  }

  Future _fileLoader() async {
    _result = null;
    _result = await FilePicker.platform.pickFiles();

    if (_result != null) {
      _file = _result!.files.single.bytes;
    }
  }

  loadPrivateKey() async {
    try {
      await _fileLoader();
      _key = PrivateKey.fromJson(_file!);
    } catch (error) {
      Get.snackbar('Divergência',
          'Certificado inválido. Verifique o arquivo e tente novamente');
    }
  }

  setCredentials(String token, PrivateKey privateKey) async {
    _prefs = await SharedPreferences.getInstance();
    _prefs!.clear();
    _prefs!.setString(describe(LocalStorageEnum.token), token);
    _prefs!.setString(
        describe(LocalStorageEnum.private_key), privateKey.privateKey);
  }
}
