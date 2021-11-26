import 'dart:typed_data';

import 'package:development/domains/enums/localStorage_enum.dart';
import 'package:development/domains/models/private_key_model.dart';
import 'package:development/gateways/gsheetsapi_gateway.dart';
import 'package:development/gateways/login_gateway.dart';
import 'package:development/pages/principal/principal_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domains/models/userLogin_model.dart';
import 'package:dio/dio.dart';

class LoginController extends GetxController {
  LoginGateway _login =
      LoginGateway(Dio(BaseOptions(contentType: "application/json")));
  GSheetsApi _gsheets = GSheetsApi(Dio(BaseOptions(contentType: "application/json")));
  SharedPreferences? _prefs;

  FilePickerResult? result;
  Uint8List? file;
  PrivateKey? _key;

  RxBool isLoading = false.obs;

  Future connect(String email, String password) async {
    if (email.trim() != '' || password.trim() != '') {
      if (_key != null) {
        try {
          isLoading.value = true;
          UserLoginModel response =
              await _login.getLogin(UserLoginModel.toJson(email, password));
          setCredentials(response.token, _key!);

          var _responseSheets = await _gsheets.getData({"private_key": _key!.privateKey, "token": response.token});

          if (_responseSheets.resposta1 != null && response.statusCode == 200 && result != null && file != null) {
            isLoading.value = false;
            Get.toNamed('/principal');
            Get.put(PrincipalController());
          } else {
            isLoading.value = false;
            Get.snackbar('Divergência',
                'Credenciais incorretas. Por favor, verifique suas credenciais e tente novamente.');
          }
        } catch (error) {
          throw error;
        }
      } else {
        isLoading.value = false;
        Get.snackbar('Divergência',
            'Credenciais incorretas. Por favor, verifique suas credenciais e tente novamente.');
      }
    } else {
      isLoading.value = false;
      Get.snackbar('Divergência',
          'Credenciais incorretas. Por favor, verifique suas credenciais e tente novamente.');
    }
  }

  Future _fileLoader() async {
    result = null;
    result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = result!.files.single.bytes;
    }
  }

  loadPrivateKey() async {
    try {
      await _fileLoader();
      _key = PrivateKey.fromJson(file!);
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
