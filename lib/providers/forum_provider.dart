import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_connect/models/forum_post.dart';
import 'package:uuid/uuid.dart';

class ForumNotifier extends StateNotifier<List<ForumPost>> {
  ForumNotifier() : super([]);

  void addPost(ForumPost post) {
    state = [post, ...state];
  }

  void removePost(String id) {
    state = state.where((post) => post.id != id).toList();
  }

  void updatePost(ForumPost updatedPost) {
    state = state.map((post) {
      if (post.id == updatedPost.id) {
        return updatedPost;
      }
      return post;
    }).toList();
  }

  void addComment(String postId, ForumComment comment) {
    state = state.map((post) {
      if (post.id == postId) {
        return post.copyWith(comments: [...post.comments, comment]);
      }
      return post;
    }).toList();
  }

  void toggleLike(String postId, String userId) {
    state = state.map((post) {
      if (post.id == postId) {
        final likes = List<String>.from(post.likes);
        if (likes.contains(userId)) {
          likes.remove(userId);
        } else {
          likes.add(userId);
        }
        return post.copyWith(likes: likes);
      }
      return post;
    }).toList();
  }
}

final forumProvider =
    StateNotifierProvider<ForumNotifier, List<ForumPost>>((ref) {
  return ForumNotifier();
});
