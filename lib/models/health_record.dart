import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_record.freezed.dart';
part 'health_record.g.dart';

@freezed
class HealthRecord with _$HealthRecord {
  const factory HealthRecord({
    required String id,
    required String title,
    required String type,
    required DateTime date,
    required String veterinarian,
    String? notes,
    String? prescription,
    double? weight,
    @Default([]) List<String> attachments,
  }) = _HealthRecord;

  factory HealthRecord.fromJson(Map<String, dynamic> json) =>
      _$HealthRecordFromJson(json);
}
