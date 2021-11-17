import 'package:development/domains/enums/localStorage_enum.dart';
import 'package:development/domains/models/private_key_model.dart';
import 'package:development/domains/models/respostas_model.dart';
import 'package:development/gateways/gsheetsapi_gateway.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrincipalController extends GetxController {
  GSheetsApi _gSheetsApi = GSheetsApi(Dio());
  SharedPreferences? _prefs;
  Respostas? respostas;
  RxBool loading = false.obs;

  @override
  void onInit() async {
    await getData();
    super.onInit();
  }

  Future getData() async {
    try {
      loading.value = true;
      respostas = await _gSheetsApi.getData(
          {"private_key": await getPrivateKey(), "token": await getToken()});
      loading.value = false;
    } on DioError catch (error) {
      loading.value = false;
      if (error.response!.statusCode == 403) {
        Get.snackbar('Divergência',
            'Credenciais incorretas. Por favor, verifique suas credenciais e tente novamente.');
      } else if (error.response!.statusCode == 500) {
        Get.snackbar('Erro',
            'Desculpe :( ! Ocorreu um erro. Por favor, tente novamente mais tarde ou contate o suporte');
      }
    }
  }

  getToken() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs!.getString(describe(LocalStorageEnum.token));
  }

  getPrivateKey() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs!.getString(describe(LocalStorageEnum.private_key));
  }
}
