import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scout_app/constants.dart';
import 'package:scout_app/news/news_cubit.dart';
import 'package:scout_app/news/news_state.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  static navigate(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ArticleScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(state.currentArticle?.title ?? ""),
        ),
        body: Padding(
          padding: const EdgeInsets.all(Spacing.m),
          child: ListView(
            children: [...state.currentArticle?.widgets ?? []],
          ),
        ),
      ),
    );
  }
}

// Scaffold(
//       appBar: AppBar(
//         title: const Text("Headline"),
//       ),
//       body: FutureBuilder(
//         future: articlesBloc.getArticle(
//           context,
//           1,
//           Theme.of(context).textTheme,
//         ),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return Padding(
//               padding: const EdgeInsets.all(Spacing.m),
//               child: ListView(
//                 children: [...snapshot.data ?? []],
//               ),
//             );
//           }
//           if (snapshot.hasError) return Text(snapshot.error.toString());
//           return const CircularProgressIndicator();
//         },
//       ),
//     );
