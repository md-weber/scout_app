import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scout_app/api/upcoming_events.dart';
import 'package:scout_app/upcoming_events/upcoming_events_state.dart';

class UpcomingEventsCubit extends Cubit<UpcomingEventsState> {
  final UpcomingEventsRepo _upcomingEventsRepo;

  UpcomingEventsCubit(UpcomingEventsRepo repo)
      : _upcomingEventsRepo = repo,
        super(const UpcomingEventsState(events: []));

  Future<void> fetchUpcomingEvents() async {
    var t = await _upcomingEventsRepo.fetchUpcomingEvents();
    emit(state.copyWith(events: t));
  }
}
