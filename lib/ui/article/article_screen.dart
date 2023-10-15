import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:scout_app/api/articles.dart';
import 'package:scout_app/bloc/articles.dart';
import 'package:scout_app/constants.dart';
import 'package:scout_app/env_load.dart';
import 'package:strapi_converter/strapi_converter/converter.dart';

class ArticleScreen extends StatelessWidget {
  final String title;

  const ArticleScreen({super.key, required this.title});

  static navigate(BuildContext context, String title) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ArticleScreen(title: title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: ArticlesBloc(
          StrapiConverter(),
          articlesApi: ArticlesApi(dio: Dio()),
          env: EnvironmentVariables.init(),
        ).getArticle(
          context,
          1,
          Theme.of(context).textTheme,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(Spacing.m),
              child: ListView(
                children: [...snapshot.data ?? []],
              ),
            );
          }
          if (snapshot.hasError) return Text(snapshot.error.toString());
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
