import 'package:freezed_annotation/freezed_annotation.dart';

part 'lost_pet_report.freezed.dart';
part 'lost_pet_report.g.dart';

@freezed
class LostPetReport with _$LostPetReport {
  const factory LostPetReport({
    required String id,
    required String petName,
    required String petType,
    required String breed,
    required String color,
    required String size,
    required String location,
    required DateTime lastSeenDate,
    required String contactName,
    required String contactPhone,
    required String description,
    required String imageUrl,
    required bool isFound,
  }) = _LostPetReport;

  factory LostPetReport.fromJson(Map<String, dynamic> json) =>
      _$LostPetReportFromJson(json);
}
