import 'package:flutter/material.dart';
import 'package:scout_app/constants.dart';
import 'package:scout_app/ui/article/article_screen.dart';
import 'package:scout_app/utils/readable_date.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("News & Highlights",
            style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(
          height: Spacing.l,
        ),
        Expanded(
          child: ListView.separated(
            itemCount: 1,
            separatorBuilder: (context, index) {
              return const SizedBox(width: Spacing.s);
            },
            itemBuilder: (context, index) {
              return ListTile(
                title: const Text(
                  "Das Digital Café Durlach Aue startet in die zweite Runde",
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(DateTime(2023, 10, 12).format("dd.MM.yyyy")),
                trailing: const Icon(Icons.navigate_next),
                onTap: () {
                  ArticleScreen.navigate(context,
                      "Das Digital Café Durlach Aue startet in die zweite Runde");
                },
              );
            },
          ),
        ),
        const SizedBox(height: Spacing.l)
      ],
    );
  }
}
