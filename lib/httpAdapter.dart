import 'package:development/domains/enums/httpAdapter_enum.dart';
import 'package:http/http.dart' as http;

class HttpAdapter {

  final HttpAdapterEnum _adapter;

  HttpAdapter({required HttpAdapterEnum adapter}) :
    this._adapter = adapter;

  Future<http.Response?> post(String url, {String? body}) async {
      if(this._adapter == HttpAdapterEnum.Http) {
        Uri uri = Uri.parse(url); 
        http.Response data = await http.post(uri, body: body);
        return data;
    }
  }

}