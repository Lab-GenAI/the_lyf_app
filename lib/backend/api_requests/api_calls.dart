import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LyfieCall {
  static Future<ApiCallResponse> call({
    String? phoneNumber = '',
    String? name = '',
    String? foodPreference = '',
    String? bio = '',
  }) async {
    final ffApiRequestBody = '''
{
  "phone_number": "${phoneNumber}",
  "pathway_id": "1e10c31f-c3b2-49a4-8b2b-497e837ccea1",
  "request_data": {
    "Name": "${name}",
    "Food": "${foodPreference}",
    "Bio": "${bio}"
  },
  "model": "turbo",
  "language": "en",
  "voice": "nat"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'lyfie',
      apiUrl: 'https://api.bland.ai/v1/calls',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'authorization':
            'sk-ikt6gx4uzw6qgbwv1p4awihmbq1ko1ph0vugp9z69hmgj8ajuxzeui4dx81atqd569',
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
