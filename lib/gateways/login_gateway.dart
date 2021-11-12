import 'package:development/domains/models/userLogin_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../constants.dart';
part 'login_gateway.g.dart';

@RestApi(baseUrl: "https://piauthapi.herokuapp.com")
abstract class LoginGateway {

  factory LoginGateway(Dio dio, {String baseUrl}) = _LoginGateway;

  @POST(piAuthAPIEndpoint)
  Future<UserLoginModel> getLogin(@Body() Map<String, dynamic> body);
}