// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppointmentImpl _$$AppointmentImplFromJson(Map<String, dynamic> json) =>
    _$AppointmentImpl(
      id: json['id'] as String,
      clientName: json['clientName'] as String,
      petName: json['petName'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      service: json['service'] as String,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$AppointmentImplToJson(_$AppointmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientName': instance.clientName,
      'petName': instance.petName,
      'dateTime': instance.dateTime.toIso8601String(),
      'service': instance.service,
      'notes': instance.notes,
    };
