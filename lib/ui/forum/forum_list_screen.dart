import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_connect/models/forum_post.dart';
import 'package:pet_connect/providers/forum_provider.dart';
import 'package:intl/intl.dart';

class ForumListScreen extends ConsumerWidget {
  const ForumListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(forumProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Forum'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(post.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.authorName),
                  Text(DateFormat.yMMMd().format(post.createdAt)),
                  Wrap(
                    spacing: 4,
                    children:
                        post.tags.map((tag) => Chip(label: Text(tag))).toList(),
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite,
                      color: post.likes.isNotEmpty ? Colors.red : Colors.grey),
                  Text('${post.likes.length}'),
                ],
              ),
              onTap: () => context.push('/forum-post/${post.id}'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/create-forum-post'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
