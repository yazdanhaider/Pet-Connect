// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lost_pet_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LostPetReportImpl _$$LostPetReportImplFromJson(Map<String, dynamic> json) =>
    _$LostPetReportImpl(
      id: json['id'] as String,
      petId: json['petId'] as String,
      petName: json['petName'] as String,
      petType: json['petType'] as String,
      petBreed: json['petBreed'] as String?,
      lastSeenDate: DateTime.parse(json['lastSeenDate'] as String),
      lastSeenLocation: json['lastSeenLocation'] as String,
      contactName: json['contactName'] as String,
      contactPhone: json['contactPhone'] as String,
      additionalInfo: json['additionalInfo'] as String?,
    );

Map<String, dynamic> _$$LostPetReportImplToJson(_$LostPetReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'petId': instance.petId,
      'petName': instance.petName,
      'petType': instance.petType,
      'petBreed': instance.petBreed,
      'lastSeenDate': instance.lastSeenDate.toIso8601String(),
      'lastSeenLocation': instance.lastSeenLocation,
      'contactName': instance.contactName,
      'contactPhone': instance.contactPhone,
      'additionalInfo': instance.additionalInfo,
    };
