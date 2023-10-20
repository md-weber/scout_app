import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scout_app/constants.dart';
import 'package:scout_app/upcoming_events/upcoming_events_cubit.dart';
import 'package:scout_app/upcoming_events/upcoming_events_state.dart';
import 'package:scout_app/utils/readable_date.dart';
import 'package:url_launcher/url_launcher.dart';

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UpcomingEventsCubit>().fetchUpcomingEvents();
    final List<UpcomingEvent> events =
        context.read<UpcomingEventsCubit>().state.events;
    return Column(
      children: [
        Text(
          "Upcoming Events",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: Spacing.m),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => ListTile(
              onTap: () async {
                if (await canLaunchUrl(events[index].locationUri)) {
                  await launchUrl(events[index].locationUri);
                } else {
                  throw 'Could not launch ${events[index].locationUri}';
                }
              },
              title: Text(events[index].name),
              subtitle: Text(events[index].meetingPoint),
              trailing: Text(
                readableDate(events[index].date, "dd.MM.yyyy hh:mm"),
              ),
            ),
            separatorBuilder: (context, index) =>
                const Divider(height: Spacing.xs),
            itemCount: events.length,
          ),
        ),
      ],
    );
  }
}

class Event {
  DateTime date;
  String name;
  String meetingPoint;

  Event({required this.date, required this.name, required this.meetingPoint});
}
