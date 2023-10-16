import 'package:bloc/bloc.dart';
import 'package:scout_app/api/articles.dart';
import 'package:scout_app/news/news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final ArticlesRepository _articlesRepo;

  NewsCubit(this._articlesRepo) : super(const NewsState(previews: []));

  Future<void> fetchPreviews() async {
    emit(state.copyWith(previews: await _articlesRepo.getPreviews()));
  }

  Future<void> fetchArticle(int id) async {
    emit(
      state.copyWith(
        currentArticle: await _articlesRepo.getArticle(id),
      ),
    );
  }
}
