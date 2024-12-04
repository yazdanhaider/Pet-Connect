// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lost_pet_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LostPetReportImpl _$$LostPetReportImplFromJson(Map<String, dynamic> json) =>
    _$LostPetReportImpl(
      id: json['id'] as String,
      petName: json['petName'] as String,
      petType: json['petType'] as String,
      breed: json['breed'] as String,
      color: json['color'] as String,
      size: json['size'] as String,
      location: json['location'] as String,
      lastSeenDate: DateTime.parse(json['lastSeenDate'] as String),
      contactName: json['contactName'] as String,
      contactPhone: json['contactPhone'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      isFound: json['isFound'] as bool,
    );

Map<String, dynamic> _$$LostPetReportImplToJson(_$LostPetReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'petName': instance.petName,
      'petType': instance.petType,
      'breed': instance.breed,
      'color': instance.color,
      'size': instance.size,
      'location': instance.location,
      'lastSeenDate': instance.lastSeenDate.toIso8601String(),
      'contactName': instance.contactName,
      'contactPhone': instance.contactPhone,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'isFound': instance.isFound,
    };
