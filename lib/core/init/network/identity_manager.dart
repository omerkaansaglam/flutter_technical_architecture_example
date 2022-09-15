import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:neyasischallenge/core/init/network/logging.dart';
import 'package:neyasischallenge/features/add_or_update_account/model/account_response_model.dart';
import 'package:xml/xml.dart';

class IdentityManager {
  late final Dio _dio;
  late final AccountResponseModel model;
  static IdentityManager? _instance;
  static IdentityManager get instance {
    _instance ??= IdentityManager._init();
    return _instance!;
  }

  String get identityBaseUrl => 'https://tckimlik.nvi.gov.tr/';

  IdentityManager._init() {
    _dio = Dio(BaseOptions(
        baseUrl: identityBaseUrl,
        connectTimeout: 5000,
        receiveTimeout: 10000,
        headers: {
          'Host': 'tckimlik.nvi.gov.tr',
          'SOAPAction': 'http://tckimlik.nvi.gov.tr/WS/TCKimlikNoDogrula',
        },
        contentType: 'application/soap+xml; charset=utf-8'))
      ..interceptors.add(Logging());
  }

  String parseSop({required AccountResponseModel model}) {
    return '''<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">
  <soap:Body>
    <TCKimlikNoDogrula xmlns="http://tckimlik.nvi.gov.tr/WS">
      <TCKimlikNo>${model.identity}</TCKimlikNo>
      <Ad>${model.name}</Ad>
      <Soyad>${model.surname}</Soyad>
      <DogumYili>${model.birthDate.year}</DogumYili>
    </TCKimlikNoDogrula>
  </soap:Body>
</soap:Envelope>''';
  }

  // METHOD : POST
  Future<Response> checkIdentity({
    String uri = 'Service/KPSPublic.asmx',
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    _dio.options.headers[Headers.contentLengthHeader] = utf8.encode(data).length;

    try {
      final Response response = await _dio.post(
        uri,
        data: utf8.encode(data),
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      var responseData = response.data;
      XmlDocument parsedXml = XmlDocument.parse(responseData);
      return response;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
