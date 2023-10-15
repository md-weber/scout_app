import 'package:flutter/material.dart';
import 'package:scout_app/constants.dart';
import 'package:scout_app/ui/home/news.dart';
import 'package:scout_app/ui/home/upcoming_events.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Digital Café Karlsruhe"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: Spacing.l),
        child: Column(
          children: [
            const Expanded(child: News()),
            Expanded(child: UpcomingEvents())
          ],
        ),
      ),
    );
  }
}
