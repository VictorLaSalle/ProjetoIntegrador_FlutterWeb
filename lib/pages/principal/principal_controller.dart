import 'package:development/domains/enums/localStorage_enum.dart';
import 'package:development/domains/models/private_key_model.dart';
import 'package:development/domains/models/respostas_model.dart';
import 'package:development/gateways/gsheetsapi_gateway.dart';
import 'package:development/gateways/local_storage.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class PrincipalController {

  GSheetsApi _gSheetsApi = GSheetsApi(Dio(
    BaseOptions(
      contentType: "application/json"
    )
  ));

  void getData(PrivateKey privateKey) async {
    String token = LocalStorage.instance.getString(LocalStorageEnum.token);

    try {
      Respostas respostas = await _gSheetsApi.getData(
          {
            "private_key": privateKey.privateKey,
            "token": token
          }
      );

      print(respostas.resposta1);

    } on DioError catch(error) {
      if (error.response!.statusCode == 403) {
        Get.snackbar('Divergência',
            'Credenciais incorretas. Por favor, verifique suas credenciais e tente novamente.');
      } else if (error.response!.statusCode == 500) {
        Get.snackbar('Erro',
            'Desculpe :( ! Ocorreu um erro. Por favor, tente novamente mais tarde ou contate o suporte');
      }
    }
  }
}