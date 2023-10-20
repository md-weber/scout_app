import 'package:bloc/bloc.dart';
import 'package:digital_cafe_karlsruhe/api/articles.dart';
import 'package:digital_cafe_karlsruhe/news/news_state.dart';
import 'package:flutter/material.dart';

class NewsCubit extends Cubit<NewsState> {
  final ArticlesRepository _articlesRepo;

  NewsCubit(this._articlesRepo) : super(const NewsState(previews: []));

  Future<void> fetchPreviews() async {
    emit(state.copyWith(previews: await _articlesRepo.fetchPreviews()));
  }

  Future<void> fetchArticle(int id, TextTheme textTheme) async {}
}
