import 'package:freezed_annotation/freezed_annotation.dart';

part 'forum_post.freezed.dart';
part 'forum_post.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String id,
    required String authorName,
    required String content,
    required DateTime createdAt,
    @Default(0) int likes,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}

@freezed
class ForumPost with _$ForumPost {
  const factory ForumPost({
    required String id,
    required String title,
    required String content,
    required String authorName,
    required String category,
    required DateTime createdAt,
    @Default(0) int likes,
    @Default([]) List<Comment> comments,
  }) = _ForumPost;

  factory ForumPost.fromJson(Map<String, dynamic> json) =>
      _$ForumPostFromJson(json);
}
