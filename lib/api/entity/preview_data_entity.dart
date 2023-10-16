import 'package:freezed_annotation/freezed_annotation.dart';

part 'preview_data_entity.freezed.dart';

part 'preview_data_entity.g.dart';

@freezed
class PreviewResponseEntity with _$PreviewResponseEntity {
  const factory PreviewResponseEntity({
    required List<PreviewData> data,
  }) = _PreviewResponseEntity;

  factory PreviewResponseEntity.fromJson(Map<String, Object?> json) =>
      _$PreviewResponseEntityFromJson(json);
}

@freezed
class PreviewData with _$PreviewData {
  const factory PreviewData({
    required int id,
    required PreviewAttributes attributes,
  }) = _PreviewData;

  factory PreviewData.fromJson(Map<String, Object?> json) =>
      _$PreviewDataFromJson(json);
}

@freezed
class PreviewAttributes with _$PreviewAttributes {
  const factory PreviewAttributes({
    required String title,
    required String subtitle,
    required DateTime published,
  }) = _PreviewAttributes;

  factory PreviewAttributes.fromJson(Map<String, Object?> json) =>
      _$PreviewAttributesFromJson(json);
}
