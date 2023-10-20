import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_state.freezed.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState({
    required List<Preview> previews,
    Article? currentArticle,
  }) = _NewsState;
}

@freezed
class Preview with _$Preview {
  const factory Preview({
    required String title,
    required String subTitle,
    required DateTime published,
    required String slug,
  }) = _Preview;
}

@freezed
class Article with _$Article {
  const factory Article({
    required String title,
    required int id,
    required String subtitle,
    required DateTime published,
    required String author,
    List<Widget>? widgets,
  }) = _Article;
}
