import 'package:freezed_annotation/freezed_annotation.dart';

part 'upcoming_events_state.freezed.dart';

@freezed
class UpcomingEventsState with _$UpcomingEventsState {
  const factory UpcomingEventsState({required List<UpcomingEvent> events}) =
      _UpcomingEventsState;
}

@freezed
class UpcomingEvent with _$UpcomingEvent {
  const factory UpcomingEvent({
    required int id,
    required String name,
    required DateTime date,
    required String meetingPoint,
    required Uri locationUri,
  }) = _UpcomingEvent;
}
