import 'package:development/domains/enums/localStorage_enum.dart';
import 'package:development/domains/models/respostas_model.dart';
import 'package:development/gateways/gsheetsapi_gateway.dart';
import 'package:development/pages/login/login_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrincipalController extends GetxController {
  final LoginController _loginController = Get.find<LoginController>();
  GSheetsApi _gSheetsApi = GSheetsApi(Dio());
  SharedPreferences? _prefs;
  Rx<Respostas> respostas = Respostas().obs;
  RxBool loading = false.obs;
  RxInt indexPageDesktop = 0.obs;
  RxInt indexPageMobile = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    await getData();
  }

  Future getData() async {
    try {
      loading.value = true;
      respostas.value = await _gSheetsApi.getData(
          {"private_key": await getPrivateKey(), "token": await getToken()});
      loading.value = false;

      if(respostas.value.resposta1 == null) {
        await logout();
        Get.snackbar('Divergência',
            'Suas credenciais expiraram. Autentique-se novamente');
      }
    } catch(error) {
      await logout();
      Get.snackbar('Divergência',
          'Suas credenciais expiraram. Autentique-se novamente');
    }
  }

  int incrementIndexDesktop() {
    if (indexPageDesktop.value < 2) {
      ++indexPageDesktop.value;
      update();
      return indexPageDesktop.value;
    }
    return indexPageDesktop.value;
  }

  int decrementIndexDesktop() {
    if (indexPageDesktop.value > 0) {
      --indexPageDesktop.value;
      update();
    }
    return indexPageDesktop.value;
  }

  int incrementIndexMobile() {
    if (indexPageMobile.value < 8) {
      ++indexPageMobile.value;
      update();
      return indexPageMobile.value;
    }
    return indexPageMobile.value;
  }

  int decrementIndexMobile() {
    if (indexPageMobile.value > 0) {
      --indexPageMobile.value;
      update();
    }
    return indexPageMobile.value;
  }

  getToken() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs!.getString(describe(LocalStorageEnum.token));
  }

  getPrivateKey() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs!.getString(describe(LocalStorageEnum.private_key));
  }

  logout() async {
    _prefs = await SharedPreferences.getInstance();
    _prefs!.remove(describe(LocalStorageEnum.private_key));
    _prefs!.remove(describe(LocalStorageEnum.token));
    _loginController.result = null;
    _loginController.file = null;
    Get.back();
  }
}
