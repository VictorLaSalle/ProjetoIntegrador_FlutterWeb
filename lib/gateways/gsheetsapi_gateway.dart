import 'package:development/domains/models/respostas_model.dart';
import 'package:retrofit/retrofit.dart';
import '../constants.dart';
import 'package:dio/dio.dart';
part 'gsheetsapi_gateway.g.dart';

@RestApi(baseUrl: gsheetsAPI)
abstract class GSheetsApi {

  factory GSheetsApi(Dio dio, {String baseUrl}) = _GSheetsApi;

  @POST(gsheetsAPIEndpoint)
  Future<Respostas> getData(@Body() Map<String, dynamic> body);
}