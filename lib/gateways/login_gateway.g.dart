// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_gateway.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _LoginGateway implements LoginGateway {
  _LoginGateway(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://piauthapi.herokuapp.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<UserLoginModel> getLogin(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserLoginModel>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/login',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserLoginModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
