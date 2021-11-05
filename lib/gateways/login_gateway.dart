import 'dart:convert';

import 'package:development/domains/enums/httpAdapter_enum.dart';
import 'package:development/domains/models/userLogin_model.dart';
import 'package:development/httpAdapter.dart';
import 'package:http/http.dart';

import '../constants.dart';

class LoginGateway {

  late HttpAdapter _adapter;

  login(Map<String, dynamic> body) async {

      this._adapter = HttpAdapter(adapter: HttpAdapterEnum.Http);
      Response? data = await this._adapter.post(piAuthAPI, body: json.encode(body));
   
      return UserLoginModel.fromJson(json.decode(data!.body), data.statusCode);

    
  }

}