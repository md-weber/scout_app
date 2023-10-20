import 'package:digital_cafe_karlsruhe/constants.dart';
import 'package:digital_cafe_karlsruhe/upcoming_events/upcoming_events_cubit.dart';
import 'package:digital_cafe_karlsruhe/upcoming_events/upcoming_events_state.dart';
import 'package:digital_cafe_karlsruhe/utils/readable_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UpcomingEventsCubit>().fetchUpcomingEvents();
    final List<UpcomingEvent> events =
        context.watch<UpcomingEventsCubit>().state.events;
    return Column(
      children: [
        Text(
          "Kommende Veranstaltungen",
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
