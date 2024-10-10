// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForumPostImpl _$$ForumPostImplFromJson(Map<String, dynamic> json) =>
    _$ForumPostImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      authorId: json['authorId'] as String,
      authorName: json['authorName'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      likes:
          (json['likes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => ForumComment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ForumPostImplToJson(_$ForumPostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'authorId': instance.authorId,
      'authorName': instance.authorName,
      'createdAt': instance.createdAt.toIso8601String(),
      'tags': instance.tags,
      'likes': instance.likes,
      'comments': instance.comments,
    };

_$ForumCommentImpl _$$ForumCommentImplFromJson(Map<String, dynamic> json) =>
    _$ForumCommentImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      authorId: json['authorId'] as String,
      authorName: json['authorName'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ForumCommentImplToJson(_$ForumCommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'authorId': instance.authorId,
      'authorName': instance.authorName,
      'createdAt': instance.createdAt.toIso8601String(),
    };
