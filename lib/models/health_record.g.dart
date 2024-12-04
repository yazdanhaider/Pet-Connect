// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HealthRecordImpl _$$HealthRecordImplFromJson(Map<String, dynamic> json) =>
    _$HealthRecordImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      type: json['type'] as String,
      date: DateTime.parse(json['date'] as String),
      veterinarian: json['veterinarian'] as String,
      notes: json['notes'] as String?,
      prescription: json['prescription'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$HealthRecordImplToJson(_$HealthRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'date': instance.date.toIso8601String(),
      'veterinarian': instance.veterinarian,
      'notes': instance.notes,
      'prescription': instance.prescription,
      'weight': instance.weight,
      'attachments': instance.attachments,
    };
