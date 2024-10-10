// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ForumPost _$ForumPostFromJson(Map<String, dynamic> json) {
  return _ForumPost.fromJson(json);
}

/// @nodoc
mixin _$ForumPost {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  String get authorName => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  List<String> get likes => throw _privateConstructorUsedError;
  List<ForumComment> get comments => throw _privateConstructorUsedError;

  /// Serializes this ForumPost to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForumPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForumPostCopyWith<ForumPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForumPostCopyWith<$Res> {
  factory $ForumPostCopyWith(ForumPost value, $Res Function(ForumPost) then) =
      _$ForumPostCopyWithImpl<$Res, ForumPost>;
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      String authorId,
      String authorName,
      DateTime createdAt,
      List<String> tags,
      List<String> likes,
      List<ForumComment> comments});
}

/// @nodoc
class _$ForumPostCopyWithImpl<$Res, $Val extends ForumPost>
    implements $ForumPostCopyWith<$Res> {
  _$ForumPostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForumPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? authorId = null,
    Object? authorName = null,
    Object? createdAt = null,
    Object? tags = null,
    Object? likes = null,
    Object? comments = null,
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
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: null == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<ForumComment>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForumPostImplCopyWith<$Res>
    implements $ForumPostCopyWith<$Res> {
  factory _$$ForumPostImplCopyWith(
          _$ForumPostImpl value, $Res Function(_$ForumPostImpl) then) =
      __$$ForumPostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      String authorId,
      String authorName,
      DateTime createdAt,
      List<String> tags,
      List<String> likes,
      List<ForumComment> comments});
}

/// @nodoc
class __$$ForumPostImplCopyWithImpl<$Res>
    extends _$ForumPostCopyWithImpl<$Res, _$ForumPostImpl>
    implements _$$ForumPostImplCopyWith<$Res> {
  __$$ForumPostImplCopyWithImpl(
      _$ForumPostImpl _value, $Res Function(_$ForumPostImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForumPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? authorId = null,
    Object? authorName = null,
    Object? createdAt = null,
    Object? tags = null,
    Object? likes = null,
    Object? comments = null,
  }) {
    return _then(_$ForumPostImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: null == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      likes: null == likes
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<ForumComment>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForumPostImpl implements _ForumPost {
  const _$ForumPostImpl(
      {required this.id,
      required this.title,
      required this.content,
      required this.authorId,
      required this.authorName,
      required this.createdAt,
      required final List<String> tags,
      final List<String> likes = const [],
      final List<ForumComment> comments = const []})
      : _tags = tags,
        _likes = likes,
        _comments = comments;

  factory _$ForumPostImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForumPostImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String content;
  @override
  final String authorId;
  @override
  final String authorName;
  @override
  final DateTime createdAt;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<String> _likes;
  @override
  @JsonKey()
  List<String> get likes {
    if (_likes is EqualUnmodifiableListView) return _likes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likes);
  }

  final List<ForumComment> _comments;
  @override
  @JsonKey()
  List<ForumComment> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  String toString() {
    return 'ForumPost(id: $id, title: $title, content: $content, authorId: $authorId, authorName: $authorName, createdAt: $createdAt, tags: $tags, likes: $likes, comments: $comments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForumPostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._likes, _likes) &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      content,
      authorId,
      authorName,
      createdAt,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_likes),
      const DeepCollectionEquality().hash(_comments));

  /// Create a copy of ForumPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForumPostImplCopyWith<_$ForumPostImpl> get copyWith =>
      __$$ForumPostImplCopyWithImpl<_$ForumPostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForumPostImplToJson(
      this,
    );
  }
}

abstract class _ForumPost implements ForumPost {
  const factory _ForumPost(
      {required final String id,
      required final String title,
      required final String content,
      required final String authorId,
      required final String authorName,
      required final DateTime createdAt,
      required final List<String> tags,
      final List<String> likes,
      final List<ForumComment> comments}) = _$ForumPostImpl;

  factory _ForumPost.fromJson(Map<String, dynamic> json) =
      _$ForumPostImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get content;
  @override
  String get authorId;
  @override
  String get authorName;
  @override
  DateTime get createdAt;
  @override
  List<String> get tags;
  @override
  List<String> get likes;
  @override
  List<ForumComment> get comments;

  /// Create a copy of ForumPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForumPostImplCopyWith<_$ForumPostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ForumComment _$ForumCommentFromJson(Map<String, dynamic> json) {
  return _ForumComment.fromJson(json);
}

/// @nodoc
mixin _$ForumComment {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  String get authorName => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ForumComment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForumComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForumCommentCopyWith<ForumComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForumCommentCopyWith<$Res> {
  factory $ForumCommentCopyWith(
          ForumComment value, $Res Function(ForumComment) then) =
      _$ForumCommentCopyWithImpl<$Res, ForumComment>;
  @useResult
  $Res call(
      {String id,
      String content,
      String authorId,
      String authorName,
      DateTime createdAt});
}

/// @nodoc
class _$ForumCommentCopyWithImpl<$Res, $Val extends ForumComment>
    implements $ForumCommentCopyWith<$Res> {
  _$ForumCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForumComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? authorId = null,
    Object? authorName = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: null == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForumCommentImplCopyWith<$Res>
    implements $ForumCommentCopyWith<$Res> {
  factory _$$ForumCommentImplCopyWith(
          _$ForumCommentImpl value, $Res Function(_$ForumCommentImpl) then) =
      __$$ForumCommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String content,
      String authorId,
      String authorName,
      DateTime createdAt});
}

/// @nodoc
class __$$ForumCommentImplCopyWithImpl<$Res>
    extends _$ForumCommentCopyWithImpl<$Res, _$ForumCommentImpl>
    implements _$$ForumCommentImplCopyWith<$Res> {
  __$$ForumCommentImplCopyWithImpl(
      _$ForumCommentImpl _value, $Res Function(_$ForumCommentImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForumComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? authorId = null,
    Object? authorName = null,
    Object? createdAt = null,
  }) {
    return _then(_$ForumCommentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: null == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForumCommentImpl implements _ForumComment {
  const _$ForumCommentImpl(
      {required this.id,
      required this.content,
      required this.authorId,
      required this.authorName,
      required this.createdAt});

  factory _$ForumCommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForumCommentImplFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  final String authorId;
  @override
  final String authorName;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'ForumComment(id: $id, content: $content, authorId: $authorId, authorName: $authorName, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForumCommentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, content, authorId, authorName, createdAt);

  /// Create a copy of ForumComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForumCommentImplCopyWith<_$ForumCommentImpl> get copyWith =>
      __$$ForumCommentImplCopyWithImpl<_$ForumCommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForumCommentImplToJson(
      this,
    );
  }
}

abstract class _ForumComment implements ForumComment {
  const factory _ForumComment(
      {required final String id,
      required final String content,
      required final String authorId,
      required final String authorName,
      required final DateTime createdAt}) = _$ForumCommentImpl;

  factory _ForumComment.fromJson(Map<String, dynamic> json) =
      _$ForumCommentImpl.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  String get authorId;
  @override
  String get authorName;
  @override
  DateTime get createdAt;

  /// Create a copy of ForumComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForumCommentImplCopyWith<_$ForumCommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
