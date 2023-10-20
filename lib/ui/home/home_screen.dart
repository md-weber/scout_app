import 'package:flutter/material.dart';
import 'package:scout_app/constants.dart';
import 'package:scout_app/ui/home/dark_mode_toggle.dart';
import 'package:scout_app/ui/home/news_section.dart';
import 'package:scout_app/ui/home/upcoming_events.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Digital Café Karlsruhe"),
        actions: const [
          DarkModeToggle()
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: Spacing.l),
        child: Column(
          children: [
            Expanded(child: NewsSection()),
            Expanded(child: UpcomingEvents())
          ],
        ),
      ),
    );
  }
}
