import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scout_app/api/articles.dart';
import 'package:scout_app/api/upcoming_events.dart';
import 'package:scout_app/news/news_cubit.dart';
import 'package:scout_app/theme/theme_cubit.dart';
import 'package:scout_app/theme/theme_state.dart';
import 'package:scout_app/theme/themes.dart';
import 'package:scout_app/ui/home/home_screen.dart';
import 'package:scout_app/upcoming_events/upcoming_events_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = _SimpleBlocObserver();

  var dio = Dio();
  runApp(
    MainApp(
      articlesApi: ArticlesRepository(),
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
