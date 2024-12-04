// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PetImpl _$$PetImplFromJson(Map<String, dynamic> json) => _$PetImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      breed: json['breed'] as String,
      gender: json['gender'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      weight: (json['weight'] as num).toDouble(),
      isVaccinated: json['isVaccinated'] as bool,
      imageUrl: json['imageUrl'] as String?,
      microchipNumber: json['microchipNumber'] as String?,
      description: json['description'] as String?,
      healthRecords: (json['healthRecords'] as List<dynamic>?)
              ?.map((e) => HealthRecord.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PetImplToJson(_$PetImpl instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'breed': instance.breed,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'weight': instance.weight,
      'isVaccinated': instance.isVaccinated,
      'imageUrl': instance.imageUrl,
      'microchipNumber': instance.microchipNumber,
      'description': instance.description,
      'healthRecords': instance.healthRecords,
    };
