import 'package:digital_cafe_karlsruhe/api/entity/preview.dart';
import 'package:digital_cafe_karlsruhe/news/news_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ArticlesRepository {
  final Dio _dio;

  ArticlesRepository(
    Dio dio,
  ) : _dio = dio;

  Future<Article> fetchArticle(int articleId, TextTheme textTheme) async {
    throw UnimplementedError();
  }

  Future<List<Preview>> fetchPreviews() async {
    var response =
        await _dio.get("https://nextjs-contentlayer-lb1d.vercel.app/api/news");
    var responseBody = response.data;
    List<PreviewEntity> result = [];
    for (var preview in responseBody) {
      result.add(PreviewEntity.fromJson(preview));
    }
    return result
        .map(
          (e) => Preview(
            title: e.title,
            subTitle: e.subtitle,
            published: e.published,
            slug: e.slug,
          ),
        )
        .toList();
  }
}
