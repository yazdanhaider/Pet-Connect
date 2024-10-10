import 'package:freezed_annotation/freezed_annotation.dart';

part 'lost_pet_report.freezed.dart';
part 'lost_pet_report.g.dart';

@freezed
class LostPetReport with _$LostPetReport {
  const factory LostPetReport({
    required String id,
    required String petId,
    required String petName,
    required String petType,
    String? petBreed,
    required DateTime lastSeenDate,
    required String lastSeenLocation,
    required String contactName,
    required String contactPhone,
    String? additionalInfo,
  }) = _LostPetReport;

  factory LostPetReport.fromJson(Map<String, dynamic> json) =>
      _$LostPetReportFromJson(json);
}
