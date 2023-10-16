import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_entity.g.dart';

part 'article_entity.freezed.dart';

@freezed
class ArticleEntity with _$ArticleEntity {
  const factory ArticleEntity({
    required ArticleDataEntity data,
  }) = _ArticleEntity;

  factory ArticleEntity.fromJson(Map<String, dynamic> json) =>
      _$ArticleEntityFromJson(json);
}

@freezed
class ArticleDataEntity with _$ArticleDataEntity {
  const factory ArticleDataEntity({
    required int id,
    required ArticleAttributes attributes,
  }) = _ArticleDataEntity;

  factory ArticleDataEntity.fromJson(Map<String, dynamic> json) =>
      _$ArticleDataEntityFromJson(json);
}

@freezed
class ArticleAttributes with _$ArticleAttributes {
  const factory ArticleAttributes({
    required String title,
    required String subtitle,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime publishedAt,
  }) = _ArticleAttributes;

  factory ArticleAttributes.fromJson(Map<String, dynamic> json) =>
      _$ArticleAttributesFromJson(json);
}
