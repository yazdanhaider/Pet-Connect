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
    required String breed,
    required String gender,
    required DateTime dateOfBirth,
    required double weight,
    required bool isVaccinated,
    String? imageUrl,
    String? microchipNumber,
    String? description,
    @Default([]) List<HealthRecord> healthRecords,
  }) = _Pet;

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);
}
