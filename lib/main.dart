import 'package:digital_cafe_karlsruhe/api/articles.dart';
import 'package:digital_cafe_karlsruhe/api/upcoming_events.dart';
import 'package:digital_cafe_karlsruhe/news/news_cubit.dart';
import 'package:digital_cafe_karlsruhe/theme/theme_cubit.dart';
import 'package:digital_cafe_karlsruhe/theme/theme_state.dart';
import 'package:digital_cafe_karlsruhe/theme/themes.dart';
import 'package:digital_cafe_karlsruhe/ui/home/home_screen.dart';
import 'package:digital_cafe_karlsruhe/upcoming_events/upcoming_events_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = _SimpleBlocObserver();

  var dio = Dio();
  runApp(
    MainApp(
      articlesApi: ArticlesRepository(dio),
      upcomingEventsRepo: UpcomingEventsRepo(dio),
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
          BlocProvider(create: (_) => UpcomingEventsCubit(_upcomingEventsRepo)),
          BlocProvider(
            create: (_) => ThemeCubit(lightTheme, AvailableThemes.light),
          )
        ],
        child: Builder(
          builder: (context) => MaterialApp(
            theme: context.watch<ThemeCubit>().state.appTheme,
            debugShowCheckedModeBanner: false,
            home: const HomeScreen(),
          ),
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
