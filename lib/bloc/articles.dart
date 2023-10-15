import 'package:flutter/widgets.dart';
import 'package:scout_app/api/articles.dart';
import 'package:scout_app/env_load.dart';
import 'package:strapi_converter/models/strapi_attribute_models.dart';
import 'package:strapi_converter/models/strapi_return_model.dart';
import 'package:strapi_converter/strapi_converter/converter.dart';

class ArticlesBloc {
  final ArticlesApi articlesApi;
  final StrapiConverter strapiConverter;
  final EnvironmentVariables env;

  ArticlesBloc(
    this.strapiConverter, {
    required this.articlesApi,
    required this.env,
  });

  Future<List<Widget>> getArticle(BuildContext context, int articleId) async {
    final articlesJSON = await articlesApi.getArticle(env, articleId);
    StrapiReturnModel strapiAttributes =
        strapiConverter.convertFromJson(articlesJSON);

    return strapiConverter.convertRichTextAttributeToWidgets(context: context, richTextModel: strapiAttributes.richTextModels.first);
  }
}
