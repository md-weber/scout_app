import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scout_app/api/articles.dart';
import 'package:scout_app/env_load.dart';
import 'package:scout_app/news/news_cubit.dart';
import 'package:scout_app/ui/home/home_screen.dart';
import 'package:strapi_converter/strapi_converter/converter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MainApp(
      articlesApi: ArticlesRepository(
        Dio(),
        EnvironmentVariables.init(),
        StrapiConverter(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({required ArticlesRepository articlesApi, super.key})
      : _articlesRepo = articlesApi;

  final ArticlesRepository _articlesRepo;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _articlesRepo,
      child: BlocProvider<NewsCubit>(
        create: (_) => NewsCubit(_articlesRepo),
        child: MaterialApp(
          theme: ThemeData.dark(useMaterial3: true),
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
