// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Pet _$PetFromJson(Map<String, dynamic> json) {
  return _Pet.fromJson(json);
}

/// @nodoc
mixin _$Pet {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get breed => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  DateTime get dateOfBirth => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;
  bool get isVaccinated => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get microchipNumber => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<HealthRecord> get healthRecords => throw _privateConstructorUsedError;

  /// Serializes this Pet to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PetCopyWith<Pet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetCopyWith<$Res> {
  factory $PetCopyWith(Pet value, $Res Function(Pet) then) =
      _$PetCopyWithImpl<$Res, Pet>;
  @useResult
  $Res call(
      {String id,
      String name,
      String type,
      String breed,
      String gender,
      DateTime dateOfBirth,
      double weight,
      bool isVaccinated,
      String? imageUrl,
      String? microchipNumber,
      String? description,
      List<HealthRecord> healthRecords});
}

/// @nodoc
class _$PetCopyWithImpl<$Res, $Val extends Pet> implements $PetCopyWith<$Res> {
  _$PetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? breed = null,
    Object? gender = null,
    Object? dateOfBirth = null,
    Object? weight = null,
    Object? isVaccinated = null,
    Object? imageUrl = freezed,
    Object? microchipNumber = freezed,
    Object? description = freezed,
    Object? healthRecords = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      isVaccinated: null == isVaccinated
          ? _value.isVaccinated
          : isVaccinated // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      microchipNumber: freezed == microchipNumber
          ? _value.microchipNumber
          : microchipNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      healthRecords: null == healthRecords
          ? _value.healthRecords
          : healthRecords // ignore: cast_nullable_to_non_nullable
              as List<HealthRecord>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PetImplCopyWith<$Res> implements $PetCopyWith<$Res> {
  factory _$$PetImplCopyWith(_$PetImpl value, $Res Function(_$PetImpl) then) =
      __$$PetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String type,
      String breed,
      String gender,
      DateTime dateOfBirth,
      double weight,
      bool isVaccinated,
      String? imageUrl,
      String? microchipNumber,
      String? description,
      List<HealthRecord> healthRecords});
}

/// @nodoc
class __$$PetImplCopyWithImpl<$Res> extends _$PetCopyWithImpl<$Res, _$PetImpl>
    implements _$$PetImplCopyWith<$Res> {
  __$$PetImplCopyWithImpl(_$PetImpl _value, $Res Function(_$PetImpl) _then)
      : super(_value, _then);

  /// Create a copy of Pet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? breed = null,
    Object? gender = null,
    Object? dateOfBirth = null,
    Object? weight = null,
    Object? isVaccinated = null,
    Object? imageUrl = freezed,
    Object? microchipNumber = freezed,
    Object? description = freezed,
    Object? healthRecords = null,
  }) {
    return _then(_$PetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      isVaccinated: null == isVaccinated
          ? _value.isVaccinated
          : isVaccinated // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      microchipNumber: freezed == microchipNumber
          ? _value.microchipNumber
          : microchipNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      healthRecords: null == healthRecords
          ? _value._healthRecords
          : healthRecords // ignore: cast_nullable_to_non_nullable
              as List<HealthRecord>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PetImpl implements _Pet {
  const _$PetImpl(
      {required this.id,
      required this.name,
      required this.type,
      required this.breed,
      required this.gender,
      required this.dateOfBirth,
      required this.weight,
      required this.isVaccinated,
      this.imageUrl,
      this.microchipNumber,
      this.description,
      final List<HealthRecord> healthRecords = const []})
      : _healthRecords = healthRecords;

  factory _$PetImpl.fromJson(Map<String, dynamic> json) =>
      _$$PetImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String type;
  @override
  final String breed;
  @override
  final String gender;
  @override
  final DateTime dateOfBirth;
  @override
  final double weight;
  @override
  final bool isVaccinated;
  @override
  final String? imageUrl;
  @override
  final String? microchipNumber;
  @override
  final String? description;
  final List<HealthRecord> _healthRecords;
  @override
  @JsonKey()
  List<HealthRecord> get healthRecords {
    if (_healthRecords is EqualUnmodifiableListView) return _healthRecords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_healthRecords);
  }

  @override
  String toString() {
    return 'Pet(id: $id, name: $name, type: $type, breed: $breed, gender: $gender, dateOfBirth: $dateOfBirth, weight: $weight, isVaccinated: $isVaccinated, imageUrl: $imageUrl, microchipNumber: $microchipNumber, description: $description, healthRecords: $healthRecords)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.breed, breed) || other.breed == breed) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.isVaccinated, isVaccinated) ||
                other.isVaccinated == isVaccinated) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.microchipNumber, microchipNumber) ||
                other.microchipNumber == microchipNumber) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._healthRecords, _healthRecords));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      type,
      breed,
      gender,
      dateOfBirth,
      weight,
      isVaccinated,
      imageUrl,
      microchipNumber,
      description,
      const DeepCollectionEquality().hash(_healthRecords));

  /// Create a copy of Pet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PetImplCopyWith<_$PetImpl> get copyWith =>
      __$$PetImplCopyWithImpl<_$PetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PetImplToJson(
      this,
    );
  }
}

abstract class _Pet implements Pet {
  const factory _Pet(
      {required final String id,
      required final String name,
      required final String type,
      required final String breed,
      required final String gender,
      required final DateTime dateOfBirth,
      required final double weight,
      required final bool isVaccinated,
      final String? imageUrl,
      final String? microchipNumber,
      final String? description,
      final List<HealthRecord> healthRecords}) = _$PetImpl;

  factory _Pet.fromJson(Map<String, dynamic> json) = _$PetImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get type;
  @override
  String get breed;
  @override
  String get gender;
  @override
  DateTime get dateOfBirth;
  @override
  double get weight;
  @override
  bool get isVaccinated;
  @override
  String? get imageUrl;
  @override
  String? get microchipNumber;
  @override
  String? get description;
  @override
  List<HealthRecord> get healthRecords;

  /// Create a copy of Pet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PetImplCopyWith<_$PetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
