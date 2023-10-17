import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scout_app/api/articles.dart';
import 'package:scout_app/api/upcoming_events.dart';
import 'package:scout_app/env_load.dart';
import 'package:scout_app/news/news_cubit.dart';
import 'package:scout_app/ui/home/home_screen.dart';
import 'package:scout_app/upcoming_events/upcoming_events_cubit.dart';
import 'package:strapi_converter/strapi_converter/converter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = _SimpleBlocObserver();

  var dio = Dio();
  var environmentVariables = EnvironmentVariables.init();
  var strapiConverter = StrapiConverter();
  runApp(
    MainApp(
      articlesApi:
          ArticlesRepository(dio, environmentVariables, strapiConverter),
      upcomingEventsRepo:
          UpcomingEventsRepo(dio, environmentVariables, strapiConverter),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({required articlesApi, required upcomingEventsRepo, super.key})
      : _articlesRepo = articlesApi,
        _upcomingEventsRepo = upcomingEventsRepo;

  final ArticlesRepository _articlesRepo;
  final UpcomingEventsRepo _upcomingEventsRepo;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _articlesRepo,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => NewsCubit(_articlesRepo)),
          BlocProvider(create: (_) => UpcomingEventsCubit(_upcomingEventsRepo))
        ],
        child: MaterialApp(
          theme: ThemeData.dark(useMaterial3: true),
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}

class _SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}
