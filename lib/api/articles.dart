import 'package:dio/dio.dart';
import 'package:scout_app/api/entity/preview_data_entity.dart';
import 'package:scout_app/env_load.dart';
import 'package:scout_app/news/news_state.dart';
import 'package:strapi_converter/strapi_converter/converter.dart';

class ArticlesRepository {
  final Dio _dio;
  final EnvironmentVariables _env;
  final StrapiConverter _strapiConverter;

  ArticlesRepository(this._dio, this._env, this._strapiConverter);

  Future<Article> fetchArticle(int articleId) async {
    _dio.options = BaseOptions(
      headers: {
        "Authorization": "Bearer ${_env.strapiKey}",
      },
      queryParameters: {"populate": "*"},
    );

    var resultJson = await _dio.get("${_env.strapiUrl}/articles/$articleId");
    var test = _strapiConverter.convertSingleFromJson(resultJson.data);
    return Article(
      title: test.getString("title"),
      id: test.id,
      subtitle: test.getString("subtitle"),
      published: test.getDateTime("publishedAt"),
      author: test.getString("Name"),
      widgets: _strapiConverter.convertRichTextAttributeToWidgets(
          richTextModel: test.richTextModels[0]),
    );
  }

  Future<List<Preview>> fetchPreviews() async {
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
