import 'package:dio/dio.dart';
import 'package:scout_app/env_load.dart';
import 'package:scout_app/upcoming_events/upcoming_events_state.dart';
import 'package:strapi_converter/strapi_converter/converter.dart';

class UpcomingEventsRepo {
  final Dio _dio;
  final EnvironmentVariables _env;
  final StrapiConverter _strapiConverter;

  UpcomingEventsRepo(
    Dio dio,
    EnvironmentVariables env,
    StrapiConverter strapiConverter,
  )   : _dio = dio,
        _env = env,
        _strapiConverter = strapiConverter;

  Future<List<UpcomingEvent>> fetchUpcomingEvents() async {
    _dio.options = BaseOptions(
      headers: {
        "Authorization": "Bearer ${_env.strapiKey}",
      },
      queryParameters: {"populate": "*"},
    );

    var resultJson = await _dio.get("${_env.strapiUrl}/upcoming-events/");
    var test = _strapiConverter.convertCollectionFromJson(resultJson.data);
    return test
        .map(
          (e) => UpcomingEvent(
            id: e.id,
            name: e.getString("name"),
            date: e.getDateTime("date"),
            meetingPoint: e.getString("meetingPoint"),
          ),
        )
        .toList();
  }
}
