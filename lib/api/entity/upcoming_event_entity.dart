import 'package:freezed_annotation/freezed_annotation.dart';

part 'upcoming_event_entity.freezed.dart';

part 'upcoming_event_entity.g.dart';

@freezed
class UpcomingEventsEntity with _$UpcomingEventsEntity {
  const factory UpcomingEventsEntity({
    required List<UpcomingEventEntity> upcomingEvents,
  }) = _UpcomingEventsEntity;

  factory UpcomingEventsEntity.fromJson(Map<String, dynamic> json) =>
      _$UpcomingEventsEntityFromJson(json);
}

@freezed
class UpcomingEventEntity with _$UpcomingEventEntity {
  const factory UpcomingEventEntity({
    required String name,
    required DateTime date,
    required UpcomingEventLocationEntity location,
  }) = _UpcomingEventEntity;

  factory UpcomingEventEntity.fromJson(Map<String, dynamic> json) =>
      _$UpcomingEventEntityFromJson(json);
}

@freezed
class UpcomingEventLocationEntity with _$UpcomingEventLocationEntity {
  const factory UpcomingEventLocationEntity({
    required String name,
    required String street,
    required String city,
    required String link,
  }) = _UpcomingEventLocationEntity;

  factory UpcomingEventLocationEntity.fromJson(Map<String, dynamic> json) =>
      _$UpcomingEventLocationEntityFromJson(json);
}
