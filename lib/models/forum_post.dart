import 'package:freezed_annotation/freezed_annotation.dart';

part 'forum_post.freezed.dart';
part 'forum_post.g.dart';

@freezed
class ForumPost with _$ForumPost {
  const factory ForumPost({
    required String id,
    required String title,
    required String content,
    required String authorId,
    required String authorName,
    required DateTime createdAt,
    required List<String> tags,
    @Default([]) List<String> likes,
    @Default([]) List<ForumComment> comments,
  }) = _ForumPost;

  factory ForumPost.fromJson(Map<String, dynamic> json) =>
      _$ForumPostFromJson(json);
}

@freezed
class ForumComment with _$ForumComment {
  const factory ForumComment({
    required String id,
    required String content,
    required String authorId,
    required String authorName,
    required DateTime createdAt,
  }) = _ForumComment;

  factory ForumComment.fromJson(Map<String, dynamic> json) =>
      _$ForumCommentFromJson(json);
}
