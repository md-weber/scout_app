import 'package:digital_cafe_karlsruhe/api/upcoming_events.dart';
import 'package:digital_cafe_karlsruhe/upcoming_events/upcoming_events_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingEventsCubit extends Cubit<UpcomingEventsState> {
  final UpcomingEventsRepo _upcomingEventsRepo;

  UpcomingEventsCubit(UpcomingEventsRepo repo)
      : _upcomingEventsRepo = repo,
        super(const UpcomingEventsState(events: []));

  Future<void> fetchUpcomingEvents() async {
    var t = await _upcomingEventsRepo.fetchUpcomingEvents();
    t.sort((a, b) => a.date.compareTo(b.date));
    emit(state.copyWith(events: t));
  }
}
