import 'package:digital_cafe_karlsruhe/constants.dart';
import 'package:digital_cafe_karlsruhe/news/news_cubit.dart';
import 'package:digital_cafe_karlsruhe/news/news_state.dart';
import 'package:digital_cafe_karlsruhe/utils/readable_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

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
                    onTap: () async {
                      var post = Uri.parse(
                        "https://nextjs-contentlayer-lb1d.vercel.app/${state.previews[index].slug}",
                      );
                      if (await canLaunchUrl(post)) {
                        launchUrl(post);
                      }
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
