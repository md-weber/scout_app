import 'package:dio/dio.dart';
import 'package:scout_app/api/entity/article_entity.dart';
import 'package:scout_app/api/entity/preview_data_entity.dart';
import 'package:scout_app/env_load.dart';
import 'package:scout_app/news/news_state.dart';
import 'package:strapi_converter/strapi_converter/converter.dart';

class ArticlesRepository {
  final Dio _dio;
  final EnvironmentVariables _env;
  final StrapiConverter _strapiConverter;

  ArticlesRepository(this._dio, this._env, this._strapiConverter);

  Future<Article> getArticle(int articleId) async {
    _dio.options = BaseOptions(
      headers: {
        "Authorization": "Bearer ${_env.strapiKey}",
      },
    );

    var test = await _dio.get("${_env.strapiUrl}/articles/$articleId");
    final entity = ArticleEntity.fromJson(test.data);
    var list = _strapiConverter.convertFromJsonToWidgets(test.data);
    return Article(
      title: entity.data.attributes.title,
      id: entity.data.id,
      subtitle: entity.data.attributes.subtitle,
      published: entity.data.attributes.publishedAt,
      author: "N/A",
      widgets: list.convertedRichText,
    );
  }

  Future<List<Preview>> getPreviews() async {
    _dio.options = BaseOptions(
      headers: {"Authorization": "Bearer ${_env.strapiKey}"},
      queryParameters: {
        "fields[0]": "title",
        "fields[1]": "subtitle",
        "fields[2]": "published",
      },
    );

    var response = await _dio.get("${_env.strapiUrl}/articles");
    var data = response.data;

    var entities = PreviewResponseEntity.fromJson(data);
    return entities.data
        .map(
          (e) => Preview(
            id: e.id,
            title: e.attributes.title,
            subTitle: e.attributes.subtitle,
            published: e.attributes.published,
          ),
        )
        .toList();
  }
}
