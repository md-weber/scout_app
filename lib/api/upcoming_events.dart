import 'package:digital_cafe_karlsruhe/api/entity/upcoming_event_entity.dart';
import 'package:digital_cafe_karlsruhe/upcoming_events/upcoming_events_state.dart';
import 'package:dio/dio.dart';

class UpcomingEventsRepo {
  final Dio _dio;

  UpcomingEventsRepo(
    Dio dio,
  )   : _dio = dio;

  Future<List<UpcomingEvent>> fetchUpcomingEvents() async {
    var response = await _dio
        .get("https://nextjs-contentlayer-lb1d.vercel.app/api/upcoming-events");
    var responseBody = response.data;

    List<UpcomingEventEntity> events = [];

    for (var e in responseBody) {
      events.add(UpcomingEventEntity.fromJson(e));
    }

    return events
        .map((e) => UpcomingEvent(
              id: 1,
              name: e.name,
              date: e.date,
              meetingPoint: e.location.name,
              locationUri: Uri.parse(e.location.link),
            ))
        .toList();
  }
}
