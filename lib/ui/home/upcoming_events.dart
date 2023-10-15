import 'package:flutter/material.dart';
import 'package:scout_app/constants.dart';
import 'package:scout_app/utils/readable_date.dart';

class UpcomingEvents extends StatelessWidget {
  UpcomingEvents({super.key});

  final List<Event> events = [
    Event(
      date: DateTime(2023, 10, 22),
      name: "Pfadfindergottesdienst",
      meetingPoint: "Heilig - Geist - Kirche",
    ),
    Event(
      date: DateTime(2023, 12, 01),
      name: "Moduleinstieg Bezirk KaMu",
      meetingPoint: "Sepp-Klumpp-Haus",
    ),
    Event(
      date: DateTime(2023, 12, 17),
      name: "Friedenslichtgottesdienst",
      meetingPoint: "Sankt Valentin",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Upcoming Events",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => ListTile(
              title: Text(events[index].name),
              subtitle: Text(events[index].meetingPoint),
              trailing: Text(
                readableDate(events[index].date, "dd.MM.yyyy"),
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
