import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_record.freezed.dart';
part 'health_record.g.dart';

@freezed
class HealthRecord with _$HealthRecord {
  const factory HealthRecord({
    required String id,
    required String petId,
    required DateTime date,
    required String type,
    String? description,
    double? weight,
    String? medication,
    String? vetName,
  }) = _HealthRecord;

  factory HealthRecord.fromJson(Map<String, dynamic> json) =>
      _$HealthRecordFromJson(json);
}
