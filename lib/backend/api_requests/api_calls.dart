import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class OneSignalEmailCall {
  static Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
  "app_id": "fc0f984a-a2c3-4fdb-b633-ac1517360e8e",
  "email_subject": "¡Promoción Especial!",
  "email_body": "<html><body><h1>Hola [Nombre]</h1><p>Esta es una prueba de email con OneSignal.</p><a href='[UNSUBSCRIBE_URL]'>Desuscribirse</a></body></html>",
  "email_from_name": "HoySíFio",
  "email_from_address": "hoysifioapp@hoysifio.org",
  "include_email_tokens": [
    "adrron204@gmail.com"
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'OneSignalEmail',
      apiUrl: 'https://onesignal.com/api/v1/notifications',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Key os_v2_app_7qhzqsvcynh5xnrtvqkronqory7h3fci6sxunx4yd64ecbnxx7sutv3nhvqcfvpfqrhmbqqs2u7qbyvcklyymchv6z5smpppcbmkfey',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class OneSignalNotificationsCall {
  static Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
  "app_id": "fc0f984a-a2c3-4fdb-b633-ac1517360e8e",
  "contents": {"en": "Este es un mensaje de prueba desde FlutterFlow"},
  "include_player_ids": ["f3c939b1-a1d3-46aa-b56f-b3012bb7d7bc"]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'OneSignalNotifications',
      apiUrl: 'https://onesignal.com/api/v1/notifications',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Key os_v2_app_7qhzqsvcynh5xnrtvqkronqory7h3fci6sxunx4yd64ecbnxx7sutv3nhvqcfvpfqrhmbqqs2u7qbyvcklyymchv6z5smpppcbmkfey',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
