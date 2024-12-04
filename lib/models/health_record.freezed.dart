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
  String get title => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get veterinarian => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get prescription => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  List<String> get attachments => throw _privateConstructorUsedError;

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
      String title,
      String type,
      DateTime date,
      String veterinarian,
      String? notes,
      String? prescription,
      double? weight,
      List<String> attachments});
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
    Object? title = null,
    Object? type = null,
    Object? date = null,
    Object? veterinarian = null,
    Object? notes = freezed,
    Object? prescription = freezed,
    Object? weight = freezed,
    Object? attachments = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      veterinarian: null == veterinarian
          ? _value.veterinarian
          : veterinarian // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      prescription: freezed == prescription
          ? _value.prescription
          : prescription // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      attachments: null == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      String title,
      String type,
      DateTime date,
      String veterinarian,
      String? notes,
      String? prescription,
      double? weight,
      List<String> attachments});
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
    Object? title = null,
    Object? type = null,
    Object? date = null,
    Object? veterinarian = null,
    Object? notes = freezed,
    Object? prescription = freezed,
    Object? weight = freezed,
    Object? attachments = null,
  }) {
    return _then(_$HealthRecordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      veterinarian: null == veterinarian
          ? _value.veterinarian
          : veterinarian // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      prescription: freezed == prescription
          ? _value.prescription
          : prescription // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      attachments: null == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthRecordImpl implements _HealthRecord {
  const _$HealthRecordImpl(
      {required this.id,
      required this.title,
      required this.type,
      required this.date,
      required this.veterinarian,
      this.notes,
      this.prescription,
      this.weight,
      final List<String> attachments = const []})
      : _attachments = attachments;

  factory _$HealthRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthRecordImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String type;
  @override
  final DateTime date;
  @override
  final String veterinarian;
  @override
  final String? notes;
  @override
  final String? prescription;
  @override
  final double? weight;
  final List<String> _attachments;
  @override
  @JsonKey()
  List<String> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  String toString() {
    return 'HealthRecord(id: $id, title: $title, type: $type, date: $date, veterinarian: $veterinarian, notes: $notes, prescription: $prescription, weight: $weight, attachments: $attachments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.veterinarian, veterinarian) ||
                other.veterinarian == veterinarian) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.prescription, prescription) ||
                other.prescription == prescription) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      type,
      date,
      veterinarian,
      notes,
      prescription,
      weight,
      const DeepCollectionEquality().hash(_attachments));

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
      required final String title,
      required final String type,
      required final DateTime date,
      required final String veterinarian,
      final String? notes,
      final String? prescription,
      final double? weight,
      final List<String> attachments}) = _$HealthRecordImpl;

  factory _HealthRecord.fromJson(Map<String, dynamic> json) =
      _$HealthRecordImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get type;
  @override
  DateTime get date;
  @override
  String get veterinarian;
  @override
  String? get notes;
  @override
  String? get prescription;
  @override
  double? get weight;
  @override
  List<String> get attachments;

  /// Create a copy of HealthRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthRecordImplCopyWith<_$HealthRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
