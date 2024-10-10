import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_connect/models/forum_post.dart';
import 'package:pet_connect/providers/forum_provider.dart';
import 'package:intl/intl.dart';

class ForumPostScreen extends ConsumerWidget {
  final String postId;

  const ForumPostScreen({super.key, required this.postId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final post = ref.watch(forumProvider).firstWhere((p) => p.id == postId);

    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.content, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 16),
            Text(
                'Posted by ${post.authorName} on ${DateFormat.yMMMd().format(post.createdAt)}'),
            Wrap(
              spacing: 4,
              children: post.tags.map((tag) => Chip(label: Text(tag))).toList(),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.favorite,
                      color: post.likes.isNotEmpty ? Colors.red : Colors.grey),
                  onPressed: () => ref
                      .read(forumProvider.notifier)
                      .toggleLike(post.id, 'currentUserId'),
                ),
                Text('${post.likes.length} likes'),
              ],
            ),
            const Divider(),
            const Text('Comments',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...post.comments.map((comment) => _buildCommentTile(comment)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddCommentDialog(context, ref, post.id),
        child: const Icon(Icons.add_comment),
      ),
    );
  }

  Widget _buildCommentTile(ForumComment comment) {
    return ListTile(
      title: Text(comment.content),
      subtitle: Text(
          '${comment.authorName} - ${DateFormat.yMMMd().format(comment.createdAt)}'),
    );
  }

  void _showAddCommentDialog(
      BuildContext context, WidgetRef ref, String postId) {
    final commentController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Comment'),
        content: TextField(
          controller: commentController,
          decoration: const InputDecoration(hintText: 'Enter your comment'),
          maxLines: 3,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (commentController.text.isNotEmpty) {
                final newComment = ForumComment(
                  id: DateTime.now().toString(),
                  content: commentController.text,
                  authorId: 'currentUserId',
                  authorName: 'Current User',
                  createdAt: DateTime.now(),
                );
                ref.read(forumProvider.notifier).addComment(postId, newComment);
                Navigator.of(context).pop();
              }
            },
            child: const Text('Post'),
          ),
        ],
      ),
    );
  }
}
