import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scout_app/api/articles.dart';
import 'package:scout_app/env_load.dart';

void main() {
  group("getArticles", () {
    final subject = ArticlesApi(dio: Dio());
    test("should return a Map<String, dynamic> with a length of 2", () async {
      var env = EnvironmentVariables(
          strapiKey:
              "56f64dcbfb2ad57fee935976895de9134b599c46cb524b8ceecc7272fae332795a73c56d369ebe81958500196a7dd0cca3efa211a2e94b2490026c4018e41151806d679f657c969d7646dfec85692524b48419436a0820a608928af9444d796d18e2251fb3426f403b9428682167ac30d417b12808ce89d9bef0717103d1e4c9",
          strapiUrl: "http://localhost:1337/api");
      var result = await subject.getArticle(env, 1);
      expect(result, isA<Map<String, dynamic>>());
      expect(result.length, 2);
      print(const JsonEncoder().convert(result));
    });
  });
}
