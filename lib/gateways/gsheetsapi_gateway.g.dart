// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gsheetsapi_gateway.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _GSheetsApi implements GSheetsApi {
  _GSheetsApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://gsheetsapi.herokuapp.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Respostas> getData(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Respostas>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/getData',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Respostas.fromJson(_result.data!);
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
