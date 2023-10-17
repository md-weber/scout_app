import 'package:flutter/material.dart';
import 'package:scout_app/constants.dart';
import 'package:scout_app/news/news_cubit.dart';
import 'package:scout_app/news/news_state.dart';
import 'package:scout_app/ui/article/article_screen.dart';
import 'package:scout_app/utils/readable_date.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NewsCubit>().fetchPreviews();
    return Column(
      children: [
        Text("News & Highlights",
            style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(
          height: Spacing.l,
        ),
        Expanded(
          child: BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) {
              return ListView.separated(
                itemCount: state.previews.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: Spacing.s);
                },
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      state.previews[index].title,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      state.previews[index].published.format("dd.MM.yyyy"),
                    ),
                    trailing: const Icon(Icons.navigate_next),
                    onTap: () {
                      context
                          .read<NewsCubit>()
                          .fetchArticle(state.previews[index].id);
                      ArticleScreen.navigate(context);
                    },
                  );
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
