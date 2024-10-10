// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HealthRecordImpl _$$HealthRecordImplFromJson(Map<String, dynamic> json) =>
    _$HealthRecordImpl(
      id: json['id'] as String,
      petId: json['petId'] as String,
      date: DateTime.parse(json['date'] as String),
      type: json['type'] as String,
      description: json['description'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      medication: json['medication'] as String?,
      vetName: json['vetName'] as String?,
    );

Map<String, dynamic> _$$HealthRecordImplToJson(_$HealthRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'petId': instance.petId,
      'date': instance.date.toIso8601String(),
      'type': instance.type,
      'description': instance.description,
      'weight': instance.weight,
      'medication': instance.medication,
      'vetName': instance.vetName,
    };
