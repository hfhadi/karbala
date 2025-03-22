import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

import '../const/values.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(Ref ref) {
  final headers = {
    'Authorization': 'Bearer $apiKey',
    'Content-Type': 'application/json',
    'Notion-Version': '2022-06-28',
  };

  if (kIsWeb) {
    return Dio(
      BaseOptions(
        baseUrl: '$proxyUrl/query/$databaseIdMohammad/$apiKey',
        headers: headers,

        queryParameters: {
          'start_cursor': '15a48fcd-1a60-4402-a836-7b47e28295ed',
        },
      ),
    );
  }
  return Dio(
    BaseOptions(baseUrl: '$baseUrl/$databaseIdKarbala/query', headers: headers),
  );
}
