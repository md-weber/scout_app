import 'package:freezed_annotation/freezed_annotation.dart';

part 'preview.freezed.dart';

part 'preview.g.dart';

@freezed
class PreviewEntity with _$PreviewEntity {
  const factory PreviewEntity({
    required String title,
    required String subtitle,
    required String slug,
    required DateTime published,
  }) = _PreviewEntity;

  factory PreviewEntity.fromJson(Map<String, Object?> json) =>
      _$PreviewEntityFromJson(json);
}
