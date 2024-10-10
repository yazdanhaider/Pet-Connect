// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HealthRecord _$HealthRecordFromJson(Map<String, dynamic> json) {
  return _HealthRecord.fromJson(json);
}

/// @nodoc
mixin _$HealthRecord {
  String get id => throw _privateConstructorUsedError;
  String get petId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  String? get medication => throw _privateConstructorUsedError;
  String? get vetName => throw _privateConstructorUsedError;

  /// Serializes this HealthRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HealthRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthRecordCopyWith<HealthRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthRecordCopyWith<$Res> {
  factory $HealthRecordCopyWith(
          HealthRecord value, $Res Function(HealthRecord) then) =
      _$HealthRecordCopyWithImpl<$Res, HealthRecord>;
  @useResult
  $Res call(
      {String id,
      String petId,
      DateTime date,
      String type,
      String? description,
      double? weight,
      String? medication,
      String? vetName});
}

/// @nodoc
class _$HealthRecordCopyWithImpl<$Res, $Val extends HealthRecord>
    implements $HealthRecordCopyWith<$Res> {
  _$HealthRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? petId = null,
    Object? date = null,
    Object? type = null,
    Object? description = freezed,
    Object? weight = freezed,
    Object? medication = freezed,
    Object? vetName = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      petId: null == petId
          ? _value.petId
          : petId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      medication: freezed == medication
          ? _value.medication
          : medication // ignore: cast_nullable_to_non_nullable
              as String?,
      vetName: freezed == vetName
          ? _value.vetName
          : vetName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HealthRecordImplCopyWith<$Res>
    implements $HealthRecordCopyWith<$Res> {
  factory _$$HealthRecordImplCopyWith(
          _$HealthRecordImpl value, $Res Function(_$HealthRecordImpl) then) =
      __$$HealthRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String petId,
      DateTime date,
      String type,
      String? description,
      double? weight,
      String? medication,
      String? vetName});
}

/// @nodoc
class __$$HealthRecordImplCopyWithImpl<$Res>
    extends _$HealthRecordCopyWithImpl<$Res, _$HealthRecordImpl>
    implements _$$HealthRecordImplCopyWith<$Res> {
  __$$HealthRecordImplCopyWithImpl(
      _$HealthRecordImpl _value, $Res Function(_$HealthRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of HealthRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? petId = null,
    Object? date = null,
    Object? type = null,
    Object? description = freezed,
    Object? weight = freezed,
    Object? medication = freezed,
    Object? vetName = freezed,
  }) {
    return _then(_$HealthRecordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      petId: null == petId
          ? _value.petId
          : petId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      medication: freezed == medication
          ? _value.medication
          : medication // ignore: cast_nullable_to_non_nullable
              as String?,
      vetName: freezed == vetName
          ? _value.vetName
          : vetName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthRecordImpl implements _HealthRecord {
  const _$HealthRecordImpl(
      {required this.id,
      required this.petId,
      required this.date,
      required this.type,
      this.description,
      this.weight,
      this.medication,
      this.vetName});

  factory _$HealthRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthRecordImplFromJson(json);

  @override
  final String id;
  @override
  final String petId;
  @override
  final DateTime date;
  @override
  final String type;
  @override
  final String? description;
  @override
  final double? weight;
  @override
  final String? medication;
  @override
  final String? vetName;

  @override
  String toString() {
    return 'HealthRecord(id: $id, petId: $petId, date: $date, type: $type, description: $description, weight: $weight, medication: $medication, vetName: $vetName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.petId, petId) || other.petId == petId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.medication, medication) ||
                other.medication == medication) &&
            (identical(other.vetName, vetName) || other.vetName == vetName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, petId, date, type,
      description, weight, medication, vetName);

  /// Create a copy of HealthRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthRecordImplCopyWith<_$HealthRecordImpl> get copyWith =>
      __$$HealthRecordImplCopyWithImpl<_$HealthRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthRecordImplToJson(
      this,
    );
  }
}

abstract class _HealthRecord implements HealthRecord {
  const factory _HealthRecord(
      {required final String id,
      required final String petId,
      required final DateTime date,
      required final String type,
      final String? description,
      final double? weight,
      final String? medication,
      final String? vetName}) = _$HealthRecordImpl;

  factory _HealthRecord.fromJson(Map<String, dynamic> json) =
      _$HealthRecordImpl.fromJson;

  @override
  String get id;
  @override
  String get petId;
  @override
  DateTime get date;
  @override
  String get type;
  @override
  String? get description;
  @override
  double? get weight;
  @override
  String? get medication;
  @override
  String? get vetName;

  /// Create a copy of HealthRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthRecordImplCopyWith<_$HealthRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
