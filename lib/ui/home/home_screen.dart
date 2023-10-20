import 'package:digital_cafe_karlsruhe/constants.dart';
import 'package:digital_cafe_karlsruhe/ui/home/dark_mode_toggle.dart';
import 'package:digital_cafe_karlsruhe/ui/home/news_section.dart';
import 'package:digital_cafe_karlsruhe/ui/home/upcoming_events.dart';
import 'package:flutter/material.dart';

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
