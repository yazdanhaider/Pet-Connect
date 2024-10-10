import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_connect/models/health_record.dart';

part 'pet.freezed.dart';
part 'pet.g.dart';

@freezed
class Pet with _$Pet {
  const factory Pet({
    required String id,
    required String name,
    required String type,
    String? breed,
    DateTime? birthDate,
    @Default([]) List<HealthRecord> healthRecords,
  }) = _Pet;

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);
}
