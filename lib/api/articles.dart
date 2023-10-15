import 'package:dio/dio.dart';
import 'package:scout_app/env_load.dart';

class ArticlesApi {
  Dio dio;

  ArticlesApi({required this.dio});

  Future<Map<String, dynamic>> getArticle(EnvironmentVariables env, int articleId) async {
    dio.options = BaseOptions(
      headers: {
        "Authorization": "Bearer ${env.strapiKey}",
      },
    );

    var test = await dio.get("${env.strapiUrl}/articles/$articleId");

    return test.data;
  }
}
